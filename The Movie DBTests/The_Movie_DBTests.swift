//
//  The_Movie_DBTests.swift
//  The Movie DBTests
//
//  Created by Anton Hoang on 21.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//
@testable import The_Movie_DB
import XCTest

final class MockNetworkManager: NetworkManagerProtocol {
    func sendDataRequest<T>(endPoint: EndPointType, response: T.Type, handler: DataHandler<T>) where T : Decodable, T : Encodable {
        
        guard let request = buildRequestWithURL(endPoint: endPoint) else {
            XCTFail("URL is nil, check buildRequestWithURL() return type");
            return
        }
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let _ = response else { XCTFail("Invalid URL, check Request Item"); return }
            guard let data = data else { XCTFail("Invalid URL, check Request Item"); return }
              
            if let error = error {
                XCTFail(error.localizedDescription)
            }
            
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                XCTAssertNotNil(json)
                handler?(.success(json))
            } catch let error {
                XCTFail(error.localizedDescription)
                handler?(.failure(error))
            }
        }
        task.resume()
    }
}

class The_Movie_DBTests: XCTestCase {
    
    let mockNetworkManager = MockNetworkManager()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testHomeResponse() {
        let endPoint = RequestItem.getPopularMovies
        mockNetworkManager.sendDataRequest(endPoint: endPoint, response: MovieData.self) { _ in }
    }
}
