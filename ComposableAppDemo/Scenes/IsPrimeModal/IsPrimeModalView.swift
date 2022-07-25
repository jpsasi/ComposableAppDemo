//
//  IsPrimeModalView.swift
//  ComposableAppDemo
//
//  Created by Sasikumar JP on 24/07/22.
//

import SwiftUI

struct IsPrimeModalView: View {
    @ObservedObject var store: Store<AppState, AppAction>
    
    var body: some View {
        if isPrime(store.value.count) {
            Text("\(store.value.count) is a Prime Number 😎")
            if store.value.favorites.contains(store.value.count) {
                Button("Remove from Favorites") {
                    store.send(.primeModal(.removeFavoritePrimeTapped))
                }
            } else {
                Button("Save to Favorites") {
                    store.send(.primeModal(.saveFavoritePrimeTapped))
                }
            }
        } else {
            Text("\(store.value.count) is not a Prime Number 🥵")
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
        IsPrimeModalView(store: Store(state: AppState(), reducer: appReducer))
    }
}
