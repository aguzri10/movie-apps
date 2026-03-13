//
//  HorizontalListView.swift
//  RyuMovie
//
//  Created by Agus Riyanto on 02/03/26.
//

import SwiftUI

struct HorizontalListView: View {
    let header : String
    var titles : [Title]
    let onSelect : (Title) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header).font(.title).padding()
            
            ScrollView (.horizontal) {
                LazyHStack {
                    ForEach(titles) { title in
                        AsyncImage(url: URL(string: title.posterPath ?? "")) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 120, height: 200)
                        .onTapGesture {
                            onSelect(title)
                        }
                    }
                }
                .padding()
            }
        }
        .frame(height: 250)
    }
}

#Preview {
    HorizontalListView(header: Constants.trendingMovieString, titles: Title.previewTitles) { title in }
}
