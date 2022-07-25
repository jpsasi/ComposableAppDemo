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
}

struct Activity: Hashable, CustomStringConvertible {
    let timeStamp = Date()
    let type: ActivityType
    
    var description: String {
        switch type {
            case .addedToFavoritePrime(let prime):
                return "Added prime no. \(prime)"
            case .removedFromFavoritePrime(let prime):
                return "Removed prime no. \(prime)"
        }
    }
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: timeStamp)
    }
}

enum ActivityType: Hashable {
    case addedToFavoritePrime(Int)
    case removedFromFavoritePrime(Int)
}


