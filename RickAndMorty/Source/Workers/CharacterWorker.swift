//
//  CharacterWorker.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 10/05/21.
//

import Foundation

typealias CharacterListResult = (Result<CharacterListResponse, CharacterError>) -> Void

protocol CharacterWorkerProtocol {
    
    func fetchCharacter(completion: @escaping CharacterListResult)
}

class CharacterWorker: CharacterWorkerProtocol {
    
    let url = "https://rickandmortyapi.com/api/character"
    
    func fetchCharacter(completion: @escaping CharacterListResult) {
        NetworkingManager.request(url: url) { result in
            completion(result)
        }
    }
}
