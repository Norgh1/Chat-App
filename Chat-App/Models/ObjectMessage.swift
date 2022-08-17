	//
	//  ObjectMessage.swift
	//  Chat-App
	//
	//  Created by Nor Gh on 28.07.22.
	//

import Foundation
import CoreLocation

final class ObjectMessage: Identifiable {
  
  private var type = ContentMode.text
  var id = UUID().uuidString
	var reciepeintId = UUID().uuidString
	var message: String?
	var attachedImageURL: String?
	var attachedLocation = CLLocationCoordinate2D()
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(String.self, forKey: .id)
    reciepeintId = try container.decode(String.self, forKey: .reciepeintId)
    message = try container.decode(String.self, forKey: .message)
    attachedImageURL = try container.decode(String.self, forKey: .attachedImageURL)
    //attachedLocation = try container.decode(String.self, forKey: .attachedLocation)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(self.id, forKey: CodingKeys.id)
    try container.encode(self.reciepeintId, forKey: CodingKeys.reciepeintId)
    try container.encode(self.message, forKey: CodingKeys.message)
    try container.encode(self.attachedImageURL, forKey: CodingKeys.attachedImageURL)
  }
  
  init(){
    
  }
}

private extension ObjectMessage {
	
  enum ContentMode {
		case text
		case image
		case location
	}
  
  enum CodingKeys: CodingKey {
    case id
    case reciepeintId
    case type
    case message
    case attachedImageURL
    case attachedLocation
  }
}
