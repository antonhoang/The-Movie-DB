//
//  HomeViewModel.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import Foundation

protocol HomeViewModelProtocol {
  var items: Observable<[MovieVO]> { get }
}

final class HomeViewModel: HomeViewModelProtocol {
  
  let repository: HomeRepositoryProtocol
  private(set) var items: Observable<[MovieVO]> = Observable([])
  var allMovies: [MovieVO] = []

  init(repository: HomeRepositoryProtocol) {
    self.repository = repository
    fetchAllMovies()
  }
  
  func fetchAllMovies() {
    let group = DispatchGroup()
    group.enter()
    repository.fetchMovies(with: .getPopularMovies, handler: .some { [weak self] item in
      self?.allMovies.append(contentsOf: item)
      group.leave()
    }, imageTypeSize: .poster)
    
    group.enter()
    repository.fetchMovies(with: .getTopRatedMovies, handler: .some { [weak self] item in
      self?.allMovies.append(contentsOf: item)
      group.leave()
    }, imageTypeSize: .poster)
    
    group.enter()
    repository.fetchMovies(with: .getUpcomingMovies, handler: .some { [weak self] item in
      self?.allMovies.append(contentsOf: item)
      group.leave()
    }, imageTypeSize: .poster)
    
    group.enter()
    repository.fetchMovies(with: .getNowPlayingMovies, handler: .some { [weak self] item in
      self?.allMovies.append(contentsOf: item)
      group.leave()
    }, imageTypeSize: .poster)
    
    group.notify(queue: .main, work: DispatchWorkItem(qos: .background, flags: .barrier, block: { [weak self] in
      self?.items.value = self?.allMovies ?? []
    }))
  }
}
