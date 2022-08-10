//
//  UserManager.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/9/22.
//

import Foundation
import FirebaseAuth

final class Usermanager {
  
  static let shared = Usermanager()
  public var currentUser: ObjectUser?
  
  private init() {}
  
}

//MARK: Authentication
extension Usermanager {
  
  func isSignedIn() -> Bool {
    Auth.auth().currentUser != nil
  }
  
  func signin(email: String, password: String, _ completion: @escaping (NetworkStatus<Void>) -> Void) {
    Auth.auth().signIn(withEmail: email, password: password) { result, error in
      guard result != nil else { completion(.generalError); return }
      completion(.success(()))
    }
  }
  
  func signup(name: String, lastName: String, email: String, password: String, _ completion: @escaping (NetworkStatus<Void>) -> Void) {
    Auth.auth().createUser(withEmail: email, password: password) { result, error in
      guard result != nil else { completion(.generalError); return }
      completion(.success(()))
    }
  }
  
  func logout() {
    try? Auth.auth().signOut()
  }
}

extension Usermanager {
  func fetchAllUsers(_ completion: @escaping (NetworkStatus<[ObjectUser]>) -> Void) {
    
  }
}
