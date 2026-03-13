//
//  ContentView.swift
//  RyuMovie
//
//  Created by Agus Riyanto on 02/03/26.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            TabView {
                Tab(Constants.homeString, systemImage: Constants.homeIconString) {
                    HomeView(path: $path)
                }
                Tab(Constants.upcomingString, systemImage: Constants.upcomingIconString) {
                    UpcomingView(path: $path)
                }
                Tab(Constants.searchString, systemImage: Constants.searchIconString) {
                    Text(Constants.searchString)
                }
                Tab(Constants.downloadString, systemImage: Constants.downloadIconString) {
                    Text(Constants.downloadString)
                }
            }
            .onAppear {
                if let config = APIConfig.shared {
                    print(config.tmdbAPIKey)
                    print(config.tmdbBaseURL)
                }
            }
            .navigationDestination(for: Title.self) { title in TitleDetailView(title: title)
            }
        }
    }
}

#Preview {
    ContentView()
}
