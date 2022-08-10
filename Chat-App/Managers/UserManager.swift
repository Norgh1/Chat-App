//
//  UserManager.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/9/22.
//

import Foundation

final class Usermanager {
  
  static let shared = Usermanager()
  public var currentUser: ObjectUser?
  
  private init() {}
  
}

//MARK: Authentication
extension Usermanager {
  
  func isSignedIn() -> Bool {
    return true
  }
  
  func signin(email: String, password: String, _ completion: @escaping (NetworkStatus<Void>) -> Void) {
    
  }
  
  func signup(name: String, lastName: String, email: String, password: String, _ completion: @escaping (NetworkStatus<Void>) -> Void) {

  }
}

extension Usermanager {
  func fetchAllUsers(_ completion: @escaping (NetworkStatus<[ObjectUser]>) -> Void) {
    
  }
}
