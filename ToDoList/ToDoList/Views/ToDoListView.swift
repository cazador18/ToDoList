//
//  ToDoListitemsViews.swift
//  ToDoList
//
//  Created by Erzhan Kasymov on 20/2/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        // users/<id>/todos/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                //Delete
                                viewModel.deleteItem(id: item.id)
                            }
                            .tint(Color.red)

                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }

            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "XaEQOxyPrucZF1HmVTrr6T0t25z2")
    }
}
