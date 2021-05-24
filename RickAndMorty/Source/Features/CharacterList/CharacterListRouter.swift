//
//  CharacterListRouter.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 23/05/21.
//

import Foundation

protocol CharacterListRouterProtocol {
    
    func proceedToCharacterDetails()
}

protocol CharacterListDataPassingProtocol {
    
    var dataStore: CharacterListDataStoreProtocol! { get }
}

class CharacterListRouter: CharacterListRouterProtocol, CharacterListDataPassingProtocol {
    
    // MARK: - VIP Properties
    
    weak var viewController: CharacterListViewController!
    
    // MARK: - Public Properties
  
    var dataStore: CharacterListDataStoreProtocol!
    
    // MARK: - Public Functions
    
    func proceedToCharacterDetails() {        
        guard let character = dataStore.character else { return }
        
        print("Character Selected: \(character.name)")
        
        // TODO: Navigate to new screen
    }
}
