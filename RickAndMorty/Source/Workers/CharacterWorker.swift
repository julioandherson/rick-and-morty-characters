//
//  CharacterWorker.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 10/05/21.
//

import Foundation

typealias CharacterListResult = (Result<CharacterListResponse, CharacterError>) -> Void

protocol CharacterWorkerProtocol {
    
    func fetchCharacter(page: Int, completion: @escaping CharacterListResult)
}

class CharacterWorker: CharacterWorkerProtocol {
    
    private let baseURL = "https://rickandmortyapi.com/api/character"
    
    func fetchCharacter(page: Int, completion: @escaping CharacterListResult) {
        let url = "\(baseURL)/?page=\(page)"
        
        NetworkingManager.request(url: url) { result in
            completion(result)
        }
    }
}
