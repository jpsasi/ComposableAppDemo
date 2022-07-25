//
//  IsPrimeModalView.swift
//  ComposableAppDemo
//
//  Created by Sasikumar JP on 24/07/22.
//

import SwiftUI

struct IsPrimeModalView: View {
    @ObservedObject var store: Store<AppState>
    
    var body: some View {
        if isPrime(store.state.count) {
            Text("\(store.state.count) is a Prime Number 😎")
            if store.state.favorites.contains(store.state.count) {
                Button("Remove from Favorites") {
                    if let index = store.state.favorites.firstIndex(of: store.state.count) {
                        let prime = store.state.favorites[index]
                        store.state.favorites.remove(at: index)
                        store.state.activityFeed.append(.init(type: .removedFromFavoritePrime(prime)))
                    }
                }
            } else {
                Button("Save to Favorites") {
                    store.state.favorites.append(store.state.count)
                    store.state.activityFeed.append(.init(type: .addedToFavoritePrime(store.state.count)))
                }
            }
        } else {
            Text("\(store.state.count) is not a Prime Number 🥵")
        }
    }
    
    private func isPrime(_ n: Int) -> Bool {
        if n <= 1 { return false }
        if n <= 3 { return true }
        for i in 2...Int(sqrtf(Float(n))) {
            if n % i == 0 { return false }
        }
        return true
    }
}

struct IsPrimeModalView_Previews: PreviewProvider {
    static var previews: some View {
        IsPrimeModalView(store: Store(state: AppState()))
    }
}
