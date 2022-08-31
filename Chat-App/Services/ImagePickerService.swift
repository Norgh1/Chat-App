//
//  ImagePickerService.swift
//  Chat-App
//
//  Created by Nor Gh on 30.08.22.
//

import Foundation
import UIKit

final class ImagePickerService: NSObject {
  
  private let imagePicker = UIImagePickerController()
  private var completion: ((UIImage) -> Void)?
  
  func show(sourceType: UIImagePickerController.SourceType, from controller: UIViewController, completion: @escaping (UIImage) -> Void) {
    imagePicker.sourceType = sourceType
    imagePicker.allowsEditing = true
    imagePicker.delegate = self
    self.completion = completion
    controller.present(imagePicker, animated: true)
  }
}

extension ImagePickerService: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = info[.editedImage] as? UIImage {
      completion?(image)
    }
    picker.dismiss(animated: true)
  }
}
