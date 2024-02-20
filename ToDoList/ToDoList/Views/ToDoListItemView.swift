//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Erzhan Kasymov on 20/2/24.
//

import SwiftUI

struct ToDoItemView: View {
    @StateObject var viewModel = ToDoItemViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }

        }
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView(item: .init(id: "123",
                                     title: "Get mild",
                                     dueDate: Date().timeIntervalSince1970,
                                     createdDate: Date().timeIntervalSince1970,
                                     isDone: true))
    }
}
