//
//  PostData.swift
//  H4XOR News
//
//  Created by Joao Victor on 25/07/22.
//

import Foundation


struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
