//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Erzhan Kasymov on 20/2/24.
//

import Foundation
import FirebaseFirestore

// ViewModel for list items view
// Primary tab

class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
        
        private let userId: String
        
        init(userId: String) {
            self.userId = userId
        }
        
        func deleteItem(id: String) {
            let db = Firestore.firestore()
            db.collection("users")
                .document(userId)
                .collection("todos")
                .document(id)
                .delete()
        }
        
    }
