//
//  UserManager.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/9/22.
//

import Foundation

final class Usermanager {
  
  static let shared = Usermanager()
  
  private init() {}
  
}

//MARK: Authentication
extension Usermanager {
  
  func isSignedIn() -> Bool {
    return true
  }
  
  func signin() {
    
  }
  
  func signup(name: String, lastName: String, email: String, password: String) {
    
  }
}

extension Usermanager {
    func fetchAllUsers() {
        
    }
}
