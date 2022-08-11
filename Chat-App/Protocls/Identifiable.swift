//
//  Identifiable.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/11/22.
//

import Foundation

protocol Identifiable: Codable {
  var id: String { get set }
}
