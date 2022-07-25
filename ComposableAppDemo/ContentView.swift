//
//  ContentView.swift
//  ComposableAppDemo
//
//  Created by Sasikumar JP on 24/07/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: Store<AppState>
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Counter View") {
                    CounterView(store: store)
                }
                NavigationLink("Favorites") {
                    FavoritesPrimeView(store: store)
                }
                NavigationLink("Activity Feed") {
                    ActivityFeedView(store: store)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Composable Demo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: Store(state: AppState()))
    }
}
