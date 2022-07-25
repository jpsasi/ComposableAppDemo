//
//  IsPrimeModalView.swift
//  ComposableAppDemo
//
//  Created by Sasikumar JP on 24/07/22.
//

import SwiftUI

struct IsPrimeModalView: View {
    @ObservedObject var state: AppState
    
    var body: some View {
        if isPrime(state.count) {
            Text("\(state.count) is a Prime Number 😎")
            if state.favorites.contains(state.count) {
                Button("Remove from Favorites") {
                    if let index = state.favorites.firstIndex(of: state.count) {
                        let prime = state.favorites[index]
                        state.favorites.remove(at: index)
                        state.activityFeed.append(.init(type: .removedFromFavoritePrime(prime)))
                    }
                }
            } else {
                Button("Save to Favorites") {
                    state.favorites.append(state.count)
                    state.activityFeed.append(.init(type: .addedToFavoritePrime(state.count)))
                }
            }
        } else {
            Text("\(state.count) is not a Prime Number 🥵")
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
        IsPrimeModalView(state: AppState())
    }
}
