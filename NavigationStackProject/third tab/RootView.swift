//
//  RootView.swift
//  NavigationStackProject
//
//  Created by Karin Prater on 12.11.22.
//

import SwiftUI

struct RootView: View {
    
    @ObservedObject var modelData: ModelDataManager
    
    var body: some View {
        List {
        
            Section("Songs") {
                ForEach(modelData.songs) { song in
                    NavigationLink(song.title, value: SelectionState.song(song))
                }
            }
            
            Section("Movie") {
                ForEach(modelData.movies) { movie in
                    NavigationLink(movie.title, value: SelectionState.movie(movie))
                }
            }
            
            Section("Book") {
                ForEach(modelData.books) { book in
                    NavigationLink(book.title, value: SelectionState.book(book))
                }
            }
            
            NavigationLink("Settings", value: SelectionState.settings)
        }
        .navigationTitle("Root View")
        
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(modelData: ModelDataManager())
    }
}
