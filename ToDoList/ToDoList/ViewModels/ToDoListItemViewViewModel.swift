//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Erzhan Kasymov on 20/2/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoItemViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
