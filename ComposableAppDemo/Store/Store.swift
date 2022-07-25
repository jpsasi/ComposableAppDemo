//
//  Store.swift
//  ComposableAppDemo
//
//  Created by Sasikumar JP on 25/07/22.
//

import Foundation

class Store<Value, Action>: ObservableObject {
    let reducer: (inout Value, Action) -> Void
    @Published var value: Value
    
    init(state: Value, reducer: @escaping (inout Value, Action) -> Void) {
        self.value = state
        self.reducer = reducer
    }
    
    func send(_ action: Action) {
        reducer(&value, action)
    }
}

func appReducer(state: inout AppState, action: AppAction) {
    switch action {
        case .counter(.incrTapped):
            state.count += 1
        case .counter(.decrTapped):
            state.count -= 1
        case .primeModal(.saveFavoritePrimeTapped):
            state.favorites.append(state.count)
            state.activityFeed.append(.init(type: .addedToFavoritePrime(state.count)))
        case .primeModal(.removeFavoritePrimeTapped):
            if let index = state.favorites.firstIndex(of: state.count) {
                let prime = state.favorites[index]
                state.favorites.remove(at: index)
                state.activityFeed.append(.init(type: .removedFromFavoritePrime(prime)))
            }
        case let .favoritePrime(.deleteFavoritePrimes(indexSet)):
            for index in indexSet {
                let prime = state.favorites[index]
                state.favorites.remove(at: index)
                state.activityFeed.append(.init(type: .removedFromFavoritePrime(prime)))
            }
    }
}

