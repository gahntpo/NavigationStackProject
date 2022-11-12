//
//  BookDestinationView.swift
//  NavigationStackProject
//
//  Created by Karin Prater on 12.11.22.
//

import SwiftUI

struct BookDestinationView: View {
    
    let book: Book
    
    var body: some View {
        VStack {
            Text("Book detail view")
            
            Divider()
            
            NavigationLink("suggestion 1", value: Book(title: "suggestion 1"))
            NavigationLink("suggestion 2", value: Book(title: "suggestion 2"))
            NavigationLink("suggestion 3", value: Book(title: "suggestion 3"))
        }
        .navigationTitle(book.title)
    }
}

struct BookDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        BookDestinationView(book: Book(title: "Alice in Wonderland"))
    }
}
