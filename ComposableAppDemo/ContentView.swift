//
//  ContentView.swift
//  ComposableAppDemo
//
//  Created by Sasikumar JP on 24/07/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var state: AppState
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Counter View") {
                    CounterView(state: state)
                }
                NavigationLink("Favorites") {
                    EmptyView()
                }
            }
            .listStyle(.plain)
            .navigationTitle("Composable App Demo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(state: AppState())
    }
}
