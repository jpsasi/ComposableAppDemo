//
//  Store.swift
//  ComposableAppDemo
//
//  Created by Sasikumar JP on 25/07/22.
//

import Foundation

class Store<Value>: ObservableObject {
    @Published var state: Value
    
    init(state: Value) {
        self.state = state
    }
}
