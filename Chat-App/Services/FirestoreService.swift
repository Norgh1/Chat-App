//
//  FirestoreService.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/11/22.
//
import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

final class FirestoreService {
  
  private let db = Firestore.firestore()
  private let user = ObjectUser()
  
  //MARK: Set
  func set(_ object: ObjectUser, path: CollectionPath, _ completion: @escaping (NetworkStatus<Void>) -> Void) {
    do {
      let _ = try db.collection(path.rawValue).document(object.id).setData(from: object, completion: { error in
        completion(error == nil ? .success(()) : .generalError)
      })
    } catch {
      completion(.generalError)
    }
  }
  
  //MARK: Read
  func read<T: Decodable>(type: T.Type, path: CollectionPath, _ completion: @escaping (NetworkStatus<[T]>) -> Void) {
    db.collection(path.rawValue).getDocuments(completion: { snapshot, error in
      guard let items = snapshot?.documents.compactMap({try? $0.data(as: T.self)}) else {
        completion(.generalError)
        return
      }
      completion(.success(items))
    })
  }
  //MARK: Observe
  func observe<T: Decodable>(type: T.Type, path: CollectionPath, _ completion: @escaping (NetworkStatus<[T]>) -> Void) {
    db.collection(path.rawValue).addSnapshotListener { snapshot, error in
      guard let items = snapshot?.documents.compactMap({try? $0.data(as: T.self)}) else {
        completion(.generalError)
        return
      }
      completion(.success(items))
    }
  }
  //MARK: Deleth
  func delete(path: CollectionPath, id: String, completion: @escaping (NetworkStatus<Void>) -> Void) {
    db.collection(path.rawValue).document(id).delete { error in
      completion(error == nil ? .success(()) : .generalError)
    }
  }
}

//MARK: Models
extension FirestoreService {
  enum CollectionPath: String {
    case users = "Users"
    case conversations = "Conversations"
    case messeges = "Messeges"
  }
}
