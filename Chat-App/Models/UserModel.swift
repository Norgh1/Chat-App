//
//  UserModel.swift
//  Chat-App
//
//  Created by Nor Gh on 16.08.22.
//

import Foundation
import UIKit

struct UserModel {
  
  var name: String
  var image: UIImage
  
}

let model : [UserModel] = [
  UserModel(name: "name", image: UIImage(named: "emoji1")!),
  UserModel(name: "name", image: UIImage(named: "emoji3")!),
  UserModel(name: "name", image: UIImage(named: "emoji4")!),
  UserModel(name: "name", image: UIImage(named: "emoji1")!)
]
