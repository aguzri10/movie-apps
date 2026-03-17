//
//  TitleDetailView.swift
//  RyuMovie
//
//  Created by Agus Riyanto on 04/03/26.
//

import SwiftUI
import SwiftData

struct TitleDetailView: View {
    var title: Title
    var titleName: String {
        return (title.name ?? title.title) ?? ""
    }

    @StateObject private var viewModel = ViewModel()
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView {
            GeometryReader { geo in
                switch viewModel.videoIdStatus {
                case .notStarted:
                    EmptyView()

                case .fetching:
                    ProgressView()
                        .frame(width: geo.size.width, height: geo.size.height)

                case .success:
                    LazyVStack(alignment: .leading) {
                        YoutubePlayer(videoId: viewModel.videoId)
                            .aspectRatio(1.3, contentMode: .fit)

                        Text(titleName)
                            .bold()
                            .font(.title2)
                            .padding(.horizontal, 16)

                        Text(title.overview ?? "")
                            .padding(.horizontal, 16)
                        
                        Button {
                            let saveTitle = title
                            saveTitle.title = titleName
                            modelContext.insert(saveTitle)
                            try? modelContext.save()
                            dismiss()
                        } label: {
                            Text(Constants.downloadString)
                                .gostButton()
                        }
                        .padding(.horizontal, 16)
                    }

                case .failed(let error):
                    Text(error.localizedDescription)
                }
            }
            .task {
                await viewModel.getVideoId(for: titleName)
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .ignoresSafeArea(.container, edges: .top)
    }
}

#Preview {
    TitleDetailView(title: Title.previewTitles[0])
}
