//
//  HomeViewModel.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import Foundation

protocol HomeViewModelProtocol {
  func fetchLatestMovies()
  func fetchPopularMovies()
  func fetchTopRatedMovies()
  func fetchUpcomingMovies()
  func fetchNowPlayingMovies()
}

final class HomeViewModel: HomeViewModelProtocol {
  
  let repository: HomeRepositoryProtocol
  
  init(repository: HomeRepositoryProtocol) {
    self.repository = repository
    fetchAllMovies()
  }
  
  func fetchAllMovies() {
    let group = DispatchGroup()
    var items = [MovieVO]()
    group.enter()
    repository.fetchMovies(with: .getPopularMovies, handler: .some { item in
      items.append(contentsOf: item)
      group.leave()
    })
    
    group.enter()
    repository.fetchMovies(with: .getTopRatedMovies, handler: .some { item in
      items.append(contentsOf: item)
      group.leave()
    })
    
    group.enter()
    repository.fetchMovies(with: .getUpcomingMovies, handler: .some { item in
      items.append(contentsOf: item)
      group.leave()
    })
    
    group.enter()
    repository.fetchMovies(with: .getNowPlayingMovies, handler: .some { item in
      items.append(contentsOf: item)
      group.leave()
    })
    
    group.notify(queue: .main, work: DispatchWorkItem(qos: .background, flags: .barrier, block: {
      print(items)
      print("FINISH")
    }))
  }
  
  func loadImage(imageURL: URL) {
    
    var data: Data?
    let queue = DispatchQueue.global(qos: .utility)
    
    let workItem = DispatchWorkItem {
      do {
        data = try Data(contentsOf: imageURL)
      } catch let error {
        print(error)
      }
    }
    
    queue.async(execute: workItem)
    workItem.notify(queue: .main) {
      if let imageData = data {
        
      }
    }
  }
  
  func fetchLatestMovies() {
    
    repository.fetchMovies(with: .getLatestMovies, handler: .some {
      item in
      print("-------------> 5", item)
    })
  }
  
  func fetchPopularMovies() {
    repository.fetchMovies(with: .getPopularMovies, handler: .some {
      item in
      print("-------------> 2", item)
    })
  }
  
  func fetchTopRatedMovies() {
    repository.fetchMovies(with: .getTopRatedMovies, handler: .some {
      item in
      print("-------------> 3", item)
    })
  }
  
  func fetchUpcomingMovies() {
    repository.fetchMovies(with: .getUpcomingMovies, handler: .some {
      item in
      print("-------------> 4", item)
    })
  }
  
  func fetchNowPlayingMovies() {
    repository.fetchMovies(with: .getNowPlayingMovies, handler: .some {
      item in
      print("-------------> 1", item)

    })
  }
}
