	//
	//  ObjectConversation.swift
	//  Chat-App
	//
	//  Created by Nor Gh on 28.07.22.
	//

import Foundation
import FirebaseFirestoreSwift

final class ObjectConversation: Identifiable {
	
  var id = UUID().uuidString
	var participantId = [String]()
	var lastMessage: String?
	var lastMessageTimeStamp = 0
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(String.self, forKey: .id)
    participantId = try container.decode([String].self, forKey: .participantId)
    lastMessage = try container.decodeIfPresent(String.self, forKey: .lastMessage)
    lastMessageTimeStamp = try container.decodeIfPresent(Int.self, forKey: .lastMessageTimeStamp) ?? 0
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(self.id, forKey: .id)
    try container.encode(self.participantId, forKey: .participantId)
    try container.encode(self.lastMessage, forKey: .lastMessage)
    try container.encode(self.lastMessageTimeStamp, forKey: .lastMessageTimeStamp)
  }
  
  init(){ }
}

private extension ObjectConversation {
  enum CodingKeys: CodingKey {
    case id
    case participantId
    case lastMessage
    case lastMessageTimeStamp
  }
}

