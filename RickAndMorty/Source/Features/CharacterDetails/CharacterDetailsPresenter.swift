//
//  CharacterDetailsPresenter.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 30/05/21.
//

import Foundation

protocol CharacterDetailsPresenterProtocol {
    
    func showDetails(_ character: Character)
}

class CharacterDetailsPresenter: CharacterDetailsPresenterProtocol {
    
    // MARK: - VIP Properties
    
    weak var viewController: CharacterDetailsViewControllerProtocol!
    
    // MARK: - Public Properties
    
    func showDetails(_ character: Character) {
        viewController.showCharacterDetails(character)
    }
}
