//
//  Character.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 10/05/21.
//

struct Character: Decodable {
    
    let id: Int
    
    let name: String
    
    let status: String
    
    let species: String
    
    let type: String
    
    let gender: String
    
    let origin: [String: String]?
    
    let location: [String: String]?
    
    let image: String
    
    let episodes: [String]?
}
