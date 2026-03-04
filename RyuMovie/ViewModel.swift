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
    var trendingTV: [Title] = []
    var topRatedMovies: [Title] = []
    var topRatedTV: [Title] = []
    
    func getTitles() async {
        self.fetchStatus = .fetching
        if (self.trendingMovies.isEmpty) {
            do {
                async let tMovies = dataFetcher.fetchTitles(for: "movie", by: "trending")
                async let tTV = dataFetcher.fetchTitles(for: "tv", by: "trending")
                async let tRMovies = dataFetcher.fetchTitles(for: "movie", by: "top_rated")
                async let tRTV = dataFetcher.fetchTitles(for: "tv", by: "top_rated")
                
                self.trendingMovies = try await tMovies
                self.trendingTV = try await tTV
                self.topRatedMovies = try await tRMovies
                self.topRatedTV = try await tRTV
                
                self.fetchStatus = .success
            } catch {
                print(error)
                self.fetchStatus = .failed(underlyingError: error)
            }
        } else {
            self.fetchStatus = .success
        }
    }
}
