//
//  Observable.swift
//  The Movie DB
//
//  Created by Anton Hoang on 06.03.2021.
//

import Foundation

final class Observable<ObservableType> {
  
  typealias Observer = (ObservableType) -> Void
  fileprivate var observer: Observer?
  
  init(_ value: ObservableType) {
    self.value = value
  }
  
  var value: ObservableType {
    didSet {
      observer?(value)
    }
  }
  
  func bind(observer: Observer?) {
    self.observer = observer
    observer?(value)
  }
  
  func accept(value: ObservableType) {
    self.value = value
  }
}

