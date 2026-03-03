//
//  ViewModel.swift
//  RyuMovie
//
//  Created by Agus Riyanto on 03/03/26.
//

import Foundation

// ViewModel responsible for managing trending movie state
// @Observable automatically triggers UI update when properties change
// fetchStatus controls loading / success / error UI
// getTitles() calls DataFetcher and updates trendingMovies

@Observable
class ViewModel {
    enum fetchStatus {
        case notStarted
        case fetching
        case success
        case failed(underlyingError: Error)
    }
    
    private(set) var fetchStatus: fetchStatus = .notStarted
    private let dataFetcher = DataFetcher()
    var trendingMovies: [Title] = []
    
    func getTitles() async {
        self.fetchStatus = .fetching
        do {
            let fetchedTitles = try await dataFetcher.fetchTitles(for: "movie")
            self.trendingMovies = fetchedTitles
            self.fetchStatus = .success
        } catch {
            print(error)
            self.fetchStatus = .failed(underlyingError: error)
        }
    }
}
