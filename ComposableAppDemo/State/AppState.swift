//
//  AppState.swift
//  ComposableAppDemo
//
//  Created by Sasikumar JP on 24/07/22.
//

import Foundation

class AppState: ObservableObject {
    @Published var count: Int = 0
    @Published var favorites: [Int] = []
}
