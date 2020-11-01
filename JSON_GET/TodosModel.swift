//
//  TodosModel.swift
//  JSON_GET
//
//  Created by Nikhil Balne on 28/10/20.
//

import Foundation

struct TodoResponse: Decodable {
    let userID, id: Int
    let title: String
    let completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}
