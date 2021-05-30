//
//  CharacterDetailsInteractor.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 30/05/21.
//

import Foundation

protocol CharacterDetailsDataStoreProtocol {
    
    var character: Character! { get set }
}

protocol CharacterDetailsInteractorProtocol {
    
    func fetchCharacterDetails()
}

class CharacterDetailsInteractor: CharacterDetailsInteractorProtocol, CharacterDetailsDataStoreProtocol {
    
    // MARK: - VIP Properties
    
    var presenter: CharacterDetailsPresenterProtocol!
    
    // MARK: - Public Properties
    
    var character: Character!
    
    // MARK: - Public Functions
    
    func fetchCharacterDetails() {
        presenter.showDetails(character)
    }
}
