//
//  UserDefaultsService.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import UIKit

@propertyWrapper

final class UserDefaultsService<T: Codable> {
  
  private var key: String
  private let defaultValue: T
  
  init(key: String, defaultValue: T) {
    self.key = key
    self.defaultValue = defaultValue
  }
  
  var wrappedValue: T {
    get {
      guard let data = UserDefaults.standard.object(forKey: key) as? Data else {
      return defaultValue
      }
      let value = try? JSONDecoder().decode(T.self, from: data)
      return value ?? defaultValue
    }
    set {
      
      let data = try? JSONEncoder().encode(newValue)
      UserDefaults.standard.set(data, forKey: key)
    }
  }
}

//MARK: Model
extension UserDefaults {
	enum Key: String {
		case isSignedin
    case isSignup
	}
}
