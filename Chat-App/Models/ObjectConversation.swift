	//
	//  ObjectConversation.swift
	//  Chat-App
	//
	//  Created by Nor Gh on 28.07.22.
	//

import Foundation

final class ObjectConversation: Codable {
	
  var id = UUID().uuidString
	var participantIds = [String]()
	var lastMessage: String?
	var lastMessageTimeStamp = 0
  
}



