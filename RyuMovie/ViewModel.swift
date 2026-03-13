//
//  ViewModel.swift
//  RyuMovie
//
//  Created by Agus Riyanto on 03/03/26.
//

import Foundation
import Combine

// ViewModel responsible for managing trending movie state
// @Observable automatically triggers UI update when properties change
// fetchStatus controls loading / success / error UI
// getTitles() calls DataFetcher and updates trendingMovies

class ViewModel: ObservableObject {
    enum FetchStatus {
        case notStarted
        case fetching
        case success
        case failed(underlyingError: Error)
    }
    
    @Published var fetchStatus: FetchStatus = .notStarted
    @Published var videoIdStatus: FetchStatus = .notStarted
    @Published var upcomingStatus: FetchStatus = .notStarted
    
    private let dataFetcher = DataFetcher()
    var trendingMovies: [Title] = []
    var trendingTV: [Title] = []
    var topRatedMovies: [Title] = []
    var topRatedTV: [Title] = []
    var upcomingMovies: [Title] = []
    
    var heroTitle = Title.previewTitles[0]
    @Published var videoId = ""
    
    func getTitles() async {
        guard case .notStarted = fetchStatus else {
            return
        }
        
        self.fetchStatus = .fetching
        
        do {
            async let tMovies = dataFetcher.fetchTitles(for: "movie", by: "trending")
            async let tTV = dataFetcher.fetchTitles(for: "tv", by: "trending")
            async let tRMovies = dataFetcher.fetchTitles(for: "movie", by: "top_rated")
            async let tRTV = dataFetcher.fetchTitles(for: "tv", by: "top_rated")
            
            self.trendingMovies = try await tMovies
            self.trendingTV = try await tTV
            self.topRatedMovies = try await tRMovies
            self.topRatedTV = try await tRTV
            
            if let title = trendingMovies.randomElement() {
                heroTitle = title
            }
            
            self.fetchStatus = .success
        } catch {
            print(error)
            self.fetchStatus = .failed(underlyingError: error)
        }
    }
    
    func getVideoId(for title: String) async {
        guard case .notStarted = videoIdStatus else { return }
        self.videoIdStatus = .fetching
        
        do {
            videoId = try await dataFetcher.fetchVideoId(for: title)
            print("VIDEO ID:", videoId)
            self.videoIdStatus = .success
        } catch {
            print(error)
            self.videoIdStatus = .failed(underlyingError: error)
        }
    }
    
    func getUpcomingMovies() async {
        guard case .notStarted = upcomingStatus else { return }
        self.upcomingStatus = .fetching
        
        do {
            upcomingMovies = try await dataFetcher.fetchTitles(for: "movie", by: "upcoming")
            self.upcomingStatus = .success
        } catch {
            print(error)
            self.upcomingStatus = .failed(underlyingError: error)
        }
    }
}
