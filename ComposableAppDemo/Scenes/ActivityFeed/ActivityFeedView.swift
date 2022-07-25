//
//  ActivityFeedView.swift
//  ComposableAppDemo
//
//  Created by Sasikumar JP on 25/07/22.
//

import SwiftUI

struct ActivityFeedView: View {
    @ObservedObject var state: AppState
    
    var body: some View {
        ZStack {
            List {
                ForEach(state.activityFeed.sorted(by: { $0.timeStamp > $1.timeStamp }),
                        id: \.self) { activity in
                    VStack(alignment:. leading) {
                        Text("\(activity.description)")
                            .font(.title2)
                        HStack {
                            Spacer()
                            Text(activity.formattedDate)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .listStyle(.plain)
            if state.activityFeed.count == 0 {
                Text("No Activities found")
                    .font(.title)
            }
        }
        .navigationTitle("Activity Feed")
    }
}

struct ActivityFeedView_Previews: PreviewProvider {
    static var previews: some View {
        let state = AppState()
        state.activityFeed.append(contentsOf: [.init(type: .addedToFavoritePrime(7)),
                                               .init(type: .removedFromFavoritePrime(5))])
        return NavigationView {
            ActivityFeedView(state: state)
        }
    }
}
