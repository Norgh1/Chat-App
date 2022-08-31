//
//  ObjectUser.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import Foundation
import UIKit

final class ObjectUser: Identifiable {  
  var id = UUID().uuidString
  var name: String?
  var lastName: String?
  var email: String?
  var profileImageURL: String?
  var isActive = false
  
  var image: UIImage?
  
  var fullName: String {
    return "\(name ?? "") \(lastName ?? "")"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(String.self, forKey: .id)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
    email = try container.decodeIfPresent(String.self, forKey: .email)
    profileImageURL = try container.decodeIfPresent(String.self, forKey: .profileImageURL)
    isActive = try container.decodeIfPresent(Bool.self, forKey: .isActive) ?? false
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(self.id, forKey: .id)
    try container.encodeIfPresent(name, forKey: .name)
    try container.encodeIfPresent(lastName, forKey: .lastName)
    try container.encodeIfPresent(profileImageURL, forKey: .profileImageURL)
    try container.encodeIfPresent(email, forKey: .email)
    try container.encodeIfPresent(isActive, forKey: .isActive)
  }
  
  init() {
  }
}

//MARK: Models
private extension ObjectUser {
  enum CodingKeys: CodingKey {
    case id
    case name
    case lastName
    case email
    case profileImageURL
    case isActive
  }
}
