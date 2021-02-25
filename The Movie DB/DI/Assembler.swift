//
//  Assembler.swift
//  The Movie DB
//
//  Created by Anton Hoang on 25.02.2021.
//

import Foundation
import UIKit

protocol AssemblerProtocol {
  associatedtype VC
  func assembly() -> VC
}
