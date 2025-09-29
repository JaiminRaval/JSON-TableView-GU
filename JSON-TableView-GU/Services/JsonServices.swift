//
//  JsonServices.swift
//  JSON-TableView-GU
//
//  Created by Jaimin Raval on 29/09/25.
//

import Foundation


final class JsonServices {
    public static let shared = JsonServices()
    
    func readJSON(filename: String) -> [JokeModel] {
                var arr: [JokeModel] = []
                guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
                        return arr
                }
                do {
                    let data = try Data(contentsOf: url)
                    arr = try JSONDecoder().decode([JokeModel].self, from: data)
                } catch let err as NSError {
                    print("Error decoding JSON file:  \(err)")
                    return arr
                }
                return arr
            }
}
