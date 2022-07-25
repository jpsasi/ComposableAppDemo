//
//  FavoritesPrimeView.swift
//  ComposableAppDemo
//
//  Created by Sasikumar JP on 24/07/22.
//

import SwiftUI

struct FavoritesPrimeView: View {
    @ObservedObject var store: Store<AppState, AppAction>
    var body: some View {
        ZStack {
            List {
                ForEach(store.value.favorites, id: \.self) { prime in
                    Text("\(prime)")
                        .font(.title2)
                }
                .onDelete { indexSet in
                    store.send(.favoritePrime(.deleteFavoritePrimes(indexSet)))
//                    for index in indexSet {
//                        let prime = store.value.favorites[index]
//                        store.value.favorites.remove(at: index)
//                        store.value.activityFeed.append(.init(type: .removedFromFavoritePrime(prime)))
//                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Favorites Prime")
            if store.value.favorites.count == 0 {
                Text("No Favorites Prime")
                    .font(.title)
            }
        }
    }
}

struct FavoritesPrimeView_Previews: PreviewProvider {
    static var previews: some View {
        var state = AppState()
        state.favorites.append(contentsOf: [3,5,7,11])
        return NavigationView {
            FavoritesPrimeView(store: Store(state: state, reducer: appReducer))
        }
    }
}
