//
//  EndPointType.swift
//  The Movie DB
//
//  Created by Anton Hoang on 27.02.2021.
//

import Foundation

protocol EndPointType {
  var scheme: String { get }
  var host: String { get }
  var path: String { get }
  var httpMethod: HTTPMethod { get }
  var headers: [String: String]? { get }
  var queryParameters: [String: String]? { get }
}
