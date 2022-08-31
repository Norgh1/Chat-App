//
//  UserManager.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/9/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import UIKit

final class Usermanager {
  
  //MARK: Public properties
  static let shared = Usermanager()
  @UserDefaultsService(.isFirstLaunch) var currentUser: ObjectUser?
  
  //MARK: Private properties
  private let service = FirestoreService()
  private let storageService = FireStorageService()
  
  private init() {}
  
}

//MARK: Authentication
extension Usermanager {
  func signin(email: String, password: String, _ completion: @escaping (NetworkStatus<Void>) -> Void) {
    Auth.auth().signIn(withEmail: email, password: password) { result, error in
      guard let userId = result?.user.uid else { completion(.generalError); return }
      self.service.read(type: ObjectUser.self, path: .users) { response in
        switch response {
          case .success(let users):
            guard let user = users?.filter({$0.id == userId}).first else {
              completion(.generalError)
              return
            }
            self.currentUser = user
            completion(.success(()))
          case .noConnection:
            completion(.noConnection)
          case .generalError:
            completion(.generalError)
        }
      }
    }
  }
  
  func signup(name: String, lastName: String, email: String, password: String, _ completion: @escaping (NetworkStatus<Void>) -> Void) {
    Auth.auth().createUser(withEmail: email, password: password) { result, error in
      guard let userId = result?.user.uid else { completion(.generalError); return }
      let user = ObjectUser()
      user.id = userId
      user.name = name
      user.lastName = lastName
      user.email = email
      self.service.set(user, path: .users) { status in
        self.currentUser = user
        completion(status)
      }
    }
  }
  
  func logout(_ completion: @escaping (NetworkStatus<Void>) -> Void) {
    do {
      try Auth.auth().signOut()
      currentUser = nil
      completion(.success(()))
    } catch {
      completion(.generalError)
    }
  }
}

extension Usermanager {
  func fetchAllUsers(_ completion: @escaping (NetworkStatus<[ObjectUser]>) -> Void) {
    service.read(type: ObjectUser.self, path: .users) { response in
      switch response {
        case .success(let users):
          let otherUsers = users?.filter({$0.id != (self.currentUser?.id ?? "")})
          completion(.success(otherUsers))
        case .noConnection:
          completion(.noConnection)
        case .generalError:
          completion(.generalError)
      }
    }
  }
  
  func observeAllUsers(_ completion: @escaping (NetworkStatus<[ObjectUser]>) -> Void) {
    service.observe(type: ObjectUser.self, path: .users) { response in
      switch response {
        case .success(let users):
          let otherUsers = users?.filter({$0.id != (self.currentUser?.id ?? "")})
          completion(.success(otherUsers))
        case .noConnection:
          completion(.noConnection)
        case .generalError:
          completion(.generalError)
      }
    }
  }
  
  func editProfile(user: ObjectUser, _ complition: @escaping (NetworkStatus<Void>) -> Void) {
    if let image = user.image {
      storageService.set(data: image.jpegData(compressionQuality: 1.0)!, name: user.id + ".jpg") { response in
        guard case .success(let url) = response else {
          complition(.generalError)
          return
        }
        user.profileImageURL = url
        self.service.set(user.self, path: .users) { response in
          switch response {
            case.generalError:
              complition(.generalError)
            case.noConnection:
              complition(.noConnection)
            case.success:
              self.currentUser = user
              complition(.success(()))
          }
        }
      }
      return
    }
    service.set(user.self, path: .users) { response in
      switch response {
        case.generalError:
          complition(.generalError)
        case.noConnection:
          complition(.noConnection)
        case.success:
          self.currentUser = user
          complition(.success(()))
      }
    }
  }
}


