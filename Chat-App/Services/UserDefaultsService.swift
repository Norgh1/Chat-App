//
//  UserDefaultsService.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import UIKit

@propertyWrapper
final class UserDefaultsService<T: Codable> {
  
  private let key: Key
  
  init(_ key: Key) {
    self.key = key
  }
  
  var wrappedValue: T? {
    get {
      guard let data = UserDefaults.standard.object(forKey: key.rawValue) as? Data else { return nil }
      return try? JSONDecoder().decode(T.self, from: data)
    }
    set {
      guard let value = newValue else {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
        return
      }
      let data = try? JSONEncoder().encode(value)
      UserDefaults.standard.set(data, forKey: key.rawValue)
    }
  }
}

//MARK: Model
extension UserDefaultsService {
  enum Key: String {
    case isFirstLaunch
  }
}
