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
    @Published var activityFeed: [Activity] = []
    
    struct Activity {
        let timeStamp = Date()
        let type: ActivityType
    }
    
    enum ActivityType {
        case addedToFavoritePrime(Int)
        case removedFromFavoritePrime(Int)
    }
}
