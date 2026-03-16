//
//  DownloadView.swift
//  RyuMovie
//
//  Created by Agus Riyanto on 16/03/26.
//

import SwiftUI

struct DownloadView: View {
    
    var body: some View {
        NavigationStack {
            List {
                
                Section {
                    
                    Button("About") {
                        
                    }
                    
                    Button("FAQ") {
                        
                    }
                    
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Label("Settings", systemImage: "gearshape")
                    }
                    
                    Button("Logout") {
                        
                    }
                    .foregroundColor(.red)
                    
                }
                
            }
            .navigationTitle("Menu")
        }
    }
}

#Preview {
    NavigationStack {
        DownloadView()
    }
}
