//
//  Character.swift
//  RickAndMorty-Swift
//
//  Created by Emir Alkal on 26.12.2022.
//

import Foundation

struct CharacterCollection: Decodable {
    let results: [Character]
    let info: Info
}

struct Info: Decodable {
    let next: String?
}

struct Character: Decodable {
    let id: Int
    let name: String
    let image: String
}
