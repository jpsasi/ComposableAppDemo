//
//  ComposableAppDemoApp.swift
//  ComposableAppDemo
//
//  Created by Sasikumar JP on 24/07/22.
//

import SwiftUI

@main
struct ComposableAppDemoApp: App {
    @ObservedObject var store: Store<AppState, AppAction> = Store(state: AppState(),
                                                                  reducer: appReducer)
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
