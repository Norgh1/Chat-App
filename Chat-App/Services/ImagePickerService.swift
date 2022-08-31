//
//  ImagePickerService.swift
//  Chat-App
//
//  Created by Nor Gh on 30.08.22.
//

import Foundation
import UIKit

final class ImagePickerService {
  
  static let imagePicker = ImagePickerService()
  
  func showImagePickerController(sourceType: UIImagePickerController.SourceType) {
    let imagePicker = UIImagePickerController()
    imagePicker.sourceType = sourceType
    imagePicker.allowsEditing = true
    //imagePicker.delegate = Self
    
  }
//  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//    if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
//      
//    }
//    
//  }
}




