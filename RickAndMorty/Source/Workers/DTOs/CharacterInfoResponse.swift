//
//  CharacterInfoResponse.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 10/05/21.
//

import Foundation

struct CharacterInfoResponse: Decodable {
    
    let count: Int
    
    let pages: Int
    
    let next: String?

    let previous: String?
}
