	//
	//  ObjectMessage.swift
	//  Chat-App
	//
	//  Created by Nor Gh on 28.07.22.
	//

import Foundation

final class ObjectMessage: Identifiable {
  
  var id = UUID().uuidString
	var reciepeintId = UUID().uuidString
  var messageType = MessageType.text
  var content: String?
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(String.self, forKey: .id)
    reciepeintId = try container.decode(String.self, forKey: .reciepeintId)
    let messageTypeValue = try container.decode(Int.self, forKey: .messageType)
    messageType = MessageType(rawValue: messageTypeValue) ?? .text
    content = try container.decode(String.self, forKey: .content)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(self.id, forKey: .id)
    try container.encode(reciepeintId, forKey: .reciepeintId)
    try container.encode(messageType.rawValue, forKey: .messageType)
    try container.encode(content, forKey: .content)
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
    case reciepeintId
    case messageType
    case content
  }
}
