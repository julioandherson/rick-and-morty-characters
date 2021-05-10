//
//  CharacterListResponse.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 10/05/21.
//

struct CharacterListResponse: Decodable {
    
    let info: CharacterInfoResponse
    
    let results: [Character]
}
