//
//  HomeView.swift
//  RyuMovie
//
//  Created by Agus Riyanto on 02/03/26.
//

import SwiftUI

// ViewModel responsible for fetching trending movies
// fetchStatus used to control UI state (loading, success, error)
// .task = trigger API call when view appears (like initState in Flutter)
// trendingMovies passed to HorizontalListView for rendering

struct HomeView: View {
    @StateObject private var viewModel = ViewModel()
    @Binding var path : NavigationPath
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                switch viewModel.fetchStatus {
                case .notStarted:
                    EmptyView()
                case .fetching:
                    ProgressView()
                        .frame(width: geo.size.width, height: geo.size.height)
                case .success:
                    LazyVStack {
                        AsyncImage(url: URL(string: viewModel.heroTitle.posterPath ?? "")) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .overlay {
                                    LinearGradient(stops: [Gradient.Stop(color: .clear, location: 0.8), Gradient.Stop(color: .gradient, location: 1)], startPoint: .top, endPoint: .bottom)
                                }
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: geo.size.width, height: geo.size.height * 0.85)
                        
                        HStack {
                            Button {
                                path.append(viewModel.heroTitle)
                            } label: {
                                Text(Constants.playString)
                                    .gostButton()
                            }
                            
                            Button {
                                
                            } label: {
                                Text(Constants.downloadString)
                                    .gostButton()
                            }
                        }
                        
                        HorizontalListView(header: Constants.trendingMovieString, titles: viewModel.trendingMovies) { title in path.append(title)}
                        HorizontalListView(header: Constants.trendingTVString, titles: viewModel.trendingTV) { title in path.append(title)}
                        HorizontalListView(header: Constants.topRatedMovieString, titles: viewModel.topRatedMovies) { title in path.append(title)}
                        HorizontalListView(header: Constants.topRatedTVString, titles: viewModel.topRatedTV) { title in path.append(title)}
                    }
                case .failed(let error):
                    Text("Error fetching data: \(error.localizedDescription)")
                }
            }
            .task {
                await viewModel.getTitles()
            }
        }
    }
    
}

#Preview {
    HomeView(path: .constant(NavigationPath()))
}
