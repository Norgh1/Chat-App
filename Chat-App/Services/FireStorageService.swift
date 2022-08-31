//
//  FireStorageService.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/31/22.
//

import Foundation
import FirebaseStorage

final class FireStorageService {
  
  private let storage = Storage.storage()
  
  func set(data: Data, name: String, completion: @escaping (NetworkStatus<String>) -> Void) {
    storage.reference().child(name).putData(data) { metadata, error in
      guard error == nil else {
        completion(.generalError)
        return
      }
      self.storage.reference().child(name).downloadURL { url, error in
        if let urlString = url?.absoluteString {
          completion(.success(urlString))
          return
        }
        completion(.generalError)
      }
    }
  }
}
