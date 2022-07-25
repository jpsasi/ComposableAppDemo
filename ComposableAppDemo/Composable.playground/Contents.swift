import UIKit
import SwiftUI
import PlaygroundSupport

var greeting = "Hello, playground"

var state = AppState()
let store = Store(state: state)
PlaygroundPage.current.liveView = UIHostingController(rootView: ContentView(store: store))
