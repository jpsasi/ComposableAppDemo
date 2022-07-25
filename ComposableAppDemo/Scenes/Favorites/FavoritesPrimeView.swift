//
//  FavoritesPrimeView.swift
//  ComposableAppDemo
//
//  Created by Sasikumar JP on 24/07/22.
//

import SwiftUI

struct FavoritesPrimeView: View {
    @ObservedObject var state: AppState
    var body: some View {
        ZStack {
            List {
                ForEach(state.favorites, id: \.self) { prime in
                    Text("\(prime)")
                        .font(.title2)
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        let prime = state.favorites[index]
                        state.favorites.remove(at: index)
                        state.activityFeed.append(.init(type: .removedFromFavoritePrime(prime)))
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Favorites Prime")
            if state.favorites.count == 0 {
                Text("No Favorites Prime")
                    .font(.title)
            }
        }
    }
}

struct FavoritesPrimeView_Previews: PreviewProvider {
    static var previews: some View {
        let state = AppState()
        state.favorites.append(contentsOf: [3,5,7,11])
        return NavigationView {
            FavoritesPrimeView(state: state)
        }
    }
}
