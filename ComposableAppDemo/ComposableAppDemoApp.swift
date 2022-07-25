//
//  ComposableAppDemoApp.swift
//  ComposableAppDemo
//
//  Created by Sasikumar JP on 24/07/22.
//

import SwiftUI

@main
struct ComposableAppDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(state: AppState()))
        }
    }
}
