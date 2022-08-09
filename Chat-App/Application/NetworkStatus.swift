//
//  NetworkStatus.swift
//  Chat-App
//
//  Created by Henry Aslanyan on 8/9/22.
//

import Foundation

enum NetworkStatus<T> {
  case success(T?)
  case noConnection
  case generalError
}
