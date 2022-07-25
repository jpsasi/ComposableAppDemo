//
//  CounterView.swift
//  ComposableAppDemo
//
//  Created by Sasikumar JP on 24/07/22.
//

import SwiftUI

struct CounterView: View {
    @ObservedObject var store: Store<AppState, AppAction>
    @State var showModalPrime = false
    @State var showAlert: Bool = false
    @State var disableNthPrimeButton: Bool = false
    @State var prime: Int = 0
    
    var body: some View {
        return VStack(spacing: 8) {
            HStack {
                Button("-") {
                    store.send(.counter(.decrTapped))
                }
                Text("\(store.value.count)")
                Button("+") {
                    store.send(.counter(.incrTapped))
                }
            }
            Button("Is this Prime Number?") {
                showModalPrime = true
            }
            Button("What is \(ordinal(store.value.count)) Prime Number?") {
                disableNthPrimeButton = true
                nthPrime(store.value.count) { prime in
                    if let prime = prime {
                        self.prime = prime
                    }
                    showAlert = true
                    disableNthPrimeButton = false
                }
            }
            .disabled(disableNthPrimeButton)
            .navigationTitle("Counter Scene")
            ProgressView()
                .opacity(disableNthPrimeButton ? 1.0 : 0.0)
        }
        .font(.title)
        .sheet(isPresented: $showModalPrime) {
            IsPrimeModalView(store: store)
        }
        .alert("\(ordinal(store.value.count)) prime number is \(prime)",
               isPresented: $showAlert) {
        }
    }
    
    private func ordinal(_ n: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        return formatter.string(for: n) ?? ""
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CounterView(store: Store(state: AppState(),
                                     reducer: appReducer))
        }
    }
}
