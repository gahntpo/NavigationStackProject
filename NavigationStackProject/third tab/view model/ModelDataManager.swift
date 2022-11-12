//
//  ModelDataManager.swift
//  NavigationStackProject
//
//  Created by Karin Prater on 12.11.22.
//

import Foundation

class ModelDataManager: ObservableObject {
    
    @Published var books = Book.examples()
    @Published var songs = Song.examples()
    @Published var movies = Movie.examples()
}

