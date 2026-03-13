//
//  UpcomingView.swift
//  RyuMovie
//
//  Created by Agus Riyanto on 13/03/26.
//

import SwiftUI

struct UpcomingView: View {
    @StateObject private var viewModel = ViewModel()
    @Binding var path : NavigationPath
    
    var body: some View {
        GeometryReader { geo in
            switch viewModel.upcomingStatus {
            case .notStarted:
                EmptyView()
            case .fetching:
                ProgressView()
                    .frame(width: geo.size.width, height: geo.size.height)
            case .success:
                VerticalListView(titles: viewModel.upcomingMovies, path: $path)
            case .failed(let error):
                Text("Error fetching data: \(error.localizedDescription)")
            }
        }
        .task {
            await viewModel.getUpcomingMovies()
        }
    }
}

#Preview {
    UpcomingView(path: .constant(NavigationPath()))
}
