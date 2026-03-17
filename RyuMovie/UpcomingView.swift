//
//  UpcomingView.swift
//  RyuMovie
//
//  Created by Agus Riyanto on 13/03/26.
//

import SwiftUI

struct UpcomingView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            GeometryReader { geo in
                switch viewModel.upcomingStatus {
                case .notStarted:
                    EmptyView()
                case .fetching:
                    ProgressView()
                        .frame(width: geo.size.width, height: geo.size.height)
                case .success:
                    VerticalListView(titles: viewModel.upcomingMovies, canDelete: false)
                case .failed(let error):
                    Text("Error fetching data: \(error.localizedDescription)")
                }
            }
            .task {
                await viewModel.getUpcomingMovies()
            }
        }
    }
}

#Preview {
    UpcomingView()
}
