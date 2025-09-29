//
//  JokeModel.swift
//  JSON-TableView-GU
//
//  Created by Jaimin Raval on 29/09/25.
//

import Foundation

struct JokeModel: Codable {
    var id: Int
    var type: String
    var setup: String
    var punchline: String
}
