	//
	//  ObjectMessage.swift
	//  Chat-App
	//
	//  Created by Nor Gh on 28.07.22.
	//

import Foundation

final class ObjectMessage: Identifiable {
  
  var id = UUID().uuidString
	var recipientIds = UUID().uuidString
  var messageType = MessageType.text
  var timestamp = Date()
  var content: String?
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(String.self, forKey: .id)
    recipientIds = try container.decode(String.self, forKey: .recipientIds)
    let messageTypeValue = try container.decode(Int.self, forKey: .messageType)
    messageType = MessageType(rawValue: messageTypeValue) ?? .text
    content = try container.decode(String.self, forKey: .content)
    if let timeValue = try container.decodeIfPresent(Double.self, forKey: .timestamp) {
      timestamp = Date(timeIntervalSince1970: timeValue)
    }
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(self.id, forKey: .id)
    try container.encode(recipientIds, forKey: .recipientIds)
    try container.encode(messageType.rawValue, forKey: .messageType)
    try container.encode(content, forKey: .content)
    try container.encode(timestamp.timeIntervalSince1970, forKey: .timestamp)
  }
  
  init() {}
}

extension ObjectMessage {
	
  enum MessageType: Int {
		case text
		case image
		case location
	}
  
  enum CodingKeys: CodingKey {
    case id
    case recipientIds
    case messageType
    case content
    case timestamp
  }
}
