//
//  RyuMovieApp.swift
//  RyuMovie
//
//  Created by Agus Riyanto on 02/03/26.
//

import SwiftUI
import SwiftData

// Entry point aplikasi (analog Flutter: main() + runApp)
// WindowGroup = root window
// ContentView() = halaman pertama yang ditampilkan

@main
struct RyuMovieApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Title.self)
    }
}
