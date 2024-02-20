//
//  User.swift
//  ToDoList
//
//  Created by Erzhan Kasymov on 20/2/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
