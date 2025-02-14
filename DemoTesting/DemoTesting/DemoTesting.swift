//
//  DemoTesting.swift
//  DemoTesting
//
//  Created by Renuka Pandey on 14/02/25.
//

import Testing

@testable import Demo

struct DemoTesting {

    private let networkManager = NetworkManager()
    let testURL = "https://jsonplaceholder.typicode.com/posts/1"

    //1st Building Block (@Test), 2nd Building Block (#expect)
    @Test("Check is network manager is instantiated") mutating func checkNetworkManager() {
        #expect(networkManager != nil)
    }
    
    @Test("Check if the URL is correctly formed") func checkURL() {
        #expect(testURL == "https://jsonplaceholder.typicode.com/posts/1")
    }
    
    //3rd Building Block (#require)
    @Test("Network is not initialized properly, it should stop the further test. With proper url request, API should return success with some data")
    func validateAPISuccess() async throws {
        let serviceManager = try #require(networkManager)
        serviceManager.fetchData(from: testURL) { result in
            switch result {
            case .success(let data):
                #expect(data != nil)
                #expect(data.count>0)
            case .failure:
                #expect(Bool(false))
            }
        }
    }
    
    @Test("Test should fail if URL is invalid")
    func ivalidateAPISuccess() async throws {
        let serviceManager = try #require(networkManager)
        serviceManager.fetchData(from: testURL) { result in
            switch result {
            case .success:
                #expect(Bool(false))
            case .failure(let error):
                #expect(error == .badResponse)
            }
        }
    }

    @Test("Decoding is successful") func checkDecoding() async throws {
        let jsonString = """
        {
            "id": 1,
            "title": "Test Post",
            "body": "This is a test post.",
            "isDefault": true
        }
        """
        
        let data = jsonString.data(using: .utf8)!
        let result: Result<Post, NetworkError> = networkManager.decode(data, to: Post.self)

        switch result {
        case .success(let post):
            let data = try #require(post)
            #expect(data.id == 1)
            #expect(data.title == "Test Post")
            #expect(data.isDefault == true)
        case .failure:
            #expect(Bool(false))
        }
    }
    
}

struct Post: Decodable {
    let id: Int
    let title: String
    let body: String
    let isDefault: Bool
}


