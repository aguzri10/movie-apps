//
//  Constants.swift
//  RyuMovie
//
//  Created by Agus Riyanto on 02/03/26.
//

import Foundation
import SwiftUI

struct Constants {
    static let homeString = "Home"
    static let upcomingString = "Upcoming"
    static let searchString = "Search"
    static let downloadString = "Download"
    static let playString = "Play"
    static let trendingMovieString = "Trending Movies"
    static let trendingTVString = "Trending TV"
    static let topRatedMovieString = "Top Rated Movies"
    static let topRatedTVString = "Top Rated TV"
    
    static let homeIconString = "house"
    static let upcomingIconString = "play.circle"
    static let searchIconString = "magnifyingglass"
    static let downloadIconString = "arrow.down.to.line"
    
    static let testTitleURL = "https://m.media-amazon.com/images/M/MV5BOGQ3YWUzYjEtMTJiYy00ZjQ0LWI0YjktYjhiNGVhNGExYTM3XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg"
    static let testTitltURL2 = "https://media.japanesestation.com/images/original/2020/05/11/53013-patma-inverted-poster.jpg"
    static let testTitleURL3 = "https://images-cdn.ubuy.vn/634e8d8b2b71536d8d294acc-kimi-no-na-wa-your-name-2016-movie.jpg"
    
}

extension Text {
    func gostButton() -> some View {
        self
            .frame(width: 100, height: 50)
            .foregroundStyle(.buttonText)
            .bold()
            .background {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(.buttonBorder, lineWidth: 2)
            }
    }
}
