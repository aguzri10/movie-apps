//
//  HorizontalListView.swift
//  RyuMovie
//
//  Created by Agus Riyanto on 02/03/26.
//

import SwiftUI

struct HorizontalListView: View {
    var header : String
    var titles = [Constants.testTitleURL, Constants.testTitltURL2, Constants.testTitleURL3]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header).font(.title).padding()
            
            ScrollView (.horizontal) {
                LazyHStack {
                    ForEach(titles, id: \.self) { title in
                        AsyncImage(url: URL(string: title)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 120, height: 200)
                    }
                }
                .padding()
            }
        }
        .frame(height: 250)
    }
}

#Preview {
    HorizontalListView(header: Constants.trendingMovieString)
}
