//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Erzhan Kasymov on 19/2/24.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
