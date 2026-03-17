//
//  DownloadView.swift
//  RyuMovie
//
//  Created by Agus Riyanto on 17/03/26.
//

import SwiftUI
import SwiftData

struct DownloadView: View {
    @Query(sort: \Title.title) var downloads : [Title]
    
    var body: some View {
        NavigationStack {
            if downloads.isEmpty {
                Text("No Download")
                    .font(.title3)
                    .padding()
                    .bold()
            } else {
                VerticalListView(titles: downloads, canDelete: true)
            }
        }
    }
}

#Preview {
    DownloadView()
}
