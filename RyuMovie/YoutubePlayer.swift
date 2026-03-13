//
//  YoutubePlayer.swift
//  RyuMovie
//
//  Created by Agus Riyanto on 04/03/26.
//

import SwiftUI
import WebKit

struct YoutubePlayer: UIViewRepresentable {
    let webview = WKWebView()
    let videoId : String
    let youtubeBaseURL = APIConfig.shared?.youtubeBaseURL
    
    func makeUIView(context: Context) -> some UIView {
        webview
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let baseURLString = youtubeBaseURL,
              let baseURL = URL(string: baseURLString) else { return
        }
        
        let videoURL = baseURL.appending(path: videoId)
        print(videoURL)
        webview.load(URLRequest(url: videoURL))
    }
}

//import SwiftUI
//import WebKit
//
//struct YoutubePlayer: UIViewRepresentable {
//
//    let videoId: String
//
//    func makeUIView(context: Context) -> WKWebView {
//        let webView = WKWebView()
//        webView.scrollView.isScrollEnabled = false
//        webView.backgroundColor = .black
//        return webView
//    }
//
//    func updateUIView(_ webView: WKWebView, context: Context) {
//
//        let html = """
//        <html>
//        <body style="margin:0;padding:0;">
//        <iframe width="100%" height="100%"
//        src="https://www.youtube.com/embed/\(videoId)?playsinline=1"
//        frameborder="0"
//        allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
//        allowfullscreen>
//        </iframe>
//        </body>
//        </html>
//        """
//
//        webView.loadHTMLString(html, baseURL: nil)
//    }
//}
