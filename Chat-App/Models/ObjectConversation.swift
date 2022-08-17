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
	var participantIds = [String]()
	var lastMessage: String?
	var lastMessageTimeStamp = 0
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(String.self, forKey: .id)
    participantIds = try container.decode([String].self, forKey: .participantIds)
    lastMessage = try container.decodeIfPresent(String.self, forKey: .lastMessage)
    lastMessageTimeStamp = try container.decodeIfPresent(Int.self, forKey: .lastMessageTimeStamp) ?? 0
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(self.id, forKey: .id)
    try container.encode(self.participantIds, forKey: .participantIds)
    try container.encode(self.lastMessage, forKey: .lastMessage)
    try container.encode(self.lastMessageTimeStamp, forKey: .lastMessageTimeStamp)
  }
  
  init(){ }
}

private extension ObjectConversation {
  enum CodingKeys: CodingKey {
    case id
    case participantIds
    case lastMessage
    case lastMessageTimeStamp
  }
}

