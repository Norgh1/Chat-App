	//
	//  ObjectMessage.swift
	//  Chat-App
	//
	//  Created by Nor Gh on 28.07.22.
	//

import Foundation
import CoreLocation

final class ObjectMessage {
	
	let id = UUID().uuidString
	var reciepeintId = UUID().uuidString
	var type = ContentMode.text
	var message: String?
	var attachedImageURL: String?
	var attachedLocation = CLLocationCoordinate2D()
	
}

extension ObjectMessage {
	
	enum ContentMode {
		case text
		case image
		case location
	}
}
