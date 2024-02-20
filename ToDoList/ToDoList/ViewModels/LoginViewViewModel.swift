//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Erzhan Kasymov on 20/2/24.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var password  = ""
    @Published var email  = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
           guard self.validate() else { return }
           Auth.auth().signIn(withEmail: email, password: password) { result, error in
               
           }
       }
    
    func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill in all fields."
            return false
        }
        
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return false
        }
        return true
    }
}
