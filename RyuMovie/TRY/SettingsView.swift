//
//  SettingsView.swift
//  RyuMovie
//
//  Created by Agus Riyanto on 16/03/26.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        List {
            
            NavigationLink {
                
            } label: {
                Label("Dark Mode", systemImage: "moon")
            }
            
            NavigationLink {
                
            } label: {
                Label("Notifications", systemImage: "bell")
            }
            
            NavigationLink {
                
            } label: {
                Label("Account", systemImage: "person")
            }
            
        }
        .navigationTitle("Settings")
        .toolbar(.hidden, for: .tabBar)
        .navigationBarTitleDisplayMode(.inline)
    }
}
