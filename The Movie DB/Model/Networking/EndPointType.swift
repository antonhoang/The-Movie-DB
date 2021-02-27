//
//  EndPointType.swift
//  The Movie DB
//
//  Created by Anton Hoang on 27.02.2021.
//

import Foundation

protocol EndPointType {
  var baseURL: String { get }
  var path: String { get }
  var httpMethod: HTTPMethod { get }
  var headers: [String: String] { get }
}
