//
//  NavigationStateManager.swift
//  NavigationStackProject
//
//  Created by Karin Prater on 12.11.22.
//

import Foundation
import Combine

enum SelectionState: Hashable, Codable {
    case movie(Movie)
    case song(Song)
    case book(Book)
    case settings
}

class NavigationStateManager: ObservableObject {
    
    @Published var selectionPath = [SelectionState]()
    
    var data: Data? {
        get {
           try? JSONEncoder().encode(selectionPath)
        }
        set {
            
            guard let data = newValue,
                  let path = try? JSONDecoder().decode([SelectionState].self, from: data) else {
                return
            }
            
            // fetch updated new model data for each id
            self.selectionPath = path
        }
    }
    
    
    func popToRoot() {
        selectionPath = []
    }
    
    func goToSettings() {
        selectionPath = [SelectionState.settings]
    }
    
    var objectWillChangeSequence: AsyncPublisher<Publishers.Buffer<ObservableObjectPublisher>> {
        objectWillChange
            .buffer(size: 1, prefetch: .byRequest, whenFull: .dropOldest)
            .values
    }
}
