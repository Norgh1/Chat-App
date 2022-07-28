//
//  ObjectUser.swift
//  Chat-App
//
//  Created by Nor Gh on 28.07.22.
//

import Foundation

final class ObjectUser {
    
    let id = UUID().uuidString
    var name: String?
    var lastName: String?
    var profileImageURL: String?
    var isActive = false
    
}
