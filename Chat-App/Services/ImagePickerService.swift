//
//  ImagePickerService.swift
//  Chat-App
//
//  Created by Nor Gh on 30.08.22.
//

import Foundation
import UIKit

final class ImagePickerService  {
  
  func showImagePickerController(sourceType: UIImagePickerController.SourceType) {
    let imagePickerController = UIImagePickerController()
    imagePickerController.sourceType = sourceType
  }
  
  
  
}
