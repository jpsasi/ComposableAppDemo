//
//  CounterView.swift
//  ComposableAppDemo
//
//  Created by Sasikumar JP on 24/07/22.
//

import SwiftUI

struct CounterView: View {
    @ObservedObject var state: AppState
    @State var showModalPrime = false
    @State var showAlert: Bool = false
    @State var disableNthPrimeButton: Bool = false
    @State var prime: Int = 0
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Button("-") {
                    state.count -= 1
                }
                Text("\(state.count)")
                Button("+") {
                    state.count += 1
                }
            }
            Button("Is this Prime Number?") {
                showModalPrime = true
            }
            Button("What is \(ordinal(state.count)) Prime Number?") {
                disableNthPrimeButton = true
                nthPrime(state.count) { prime in
                    if let prime = prime {
                        self.prime = prime
                    }
                    showAlert = true
                    disableNthPrimeButton = false
                }
            }
            .disabled(disableNthPrimeButton)
            .navigationTitle("Counter Scene")
        }
        .font(.title)
        .sheet(isPresented: $showModalPrime) {
            IsPrimeModalView(state: state)
        }
        .alert("\(ordinal(state.count)) prime number is \(prime)", isPresented: $showAlert) {
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
            CounterView(state: AppState())
        }
    }
}