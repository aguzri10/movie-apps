//
//  TitleDetailView.swift
//  RyuMovie
//
//  Created by Agus Riyanto on 04/03/26.
//

import SwiftUI

struct TitleDetailView: View {
    var title: Title
    var titleName: String {
        return (title.name ?? title.title) ?? ""
    }
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        GeometryReader { geo in
            switch viewModel.videoIdStatus {
            case .notStarted:
                EmptyView()
            case .fetching:
                ProgressView().frame(width: geo.size.width, height: geo.size.height)
            case .success:
                ScrollView {
                    LazyVStack (alignment: .leading) {
                        YoutubePlayer(videoId: viewModel.videoId)
                            .aspectRatio(1.3 ,contentMode: .fit)
                        Text(titleName).bold().font(.title2).padding(.horizontal, 16)
                        Text(title.overview ?? "").padding(.horizontal, 16)
                    }
                }
            case .failed(let underlyingError):
                Text(underlyingError.localizedDescription)
            }
        }
        .task {
            await viewModel.getVideoId(for: titleName)
        }
    }
}

#Preview {
    TitleDetailView(title: Title.previewTitles[0])
}
