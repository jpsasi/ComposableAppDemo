//
//  AppState.swift
//  ComposableAppDemo
//
//  Created by Sasikumar JP on 24/07/22.
//

import Foundation

struct AppState {
    var count: Int = 0
    var favorites: [Int] = []
    var activityFeed: [Activity] = []
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
        formatter.timeStyle = .medium
        return formatter.string(from: timeStamp)
    }
}

enum ActivityType: Hashable {
    case addedToFavoritePrime(Int)
    case removedFromFavoritePrime(Int)
}

enum AppAction {
    case counter(CounterAction)
    case primeModal(PrimeModalAction)
    case favoritePrime(FavoritePrimesAction)
}

enum CounterAction {
    case incrTapped
    case decrTapped
}

enum PrimeModalAction {
    case saveFavoritePrimeTapped
    case removeFavoritePrimeTapped
}

enum FavoritePrimesAction {
    case deleteFavoritePrimes(IndexSet)
}
