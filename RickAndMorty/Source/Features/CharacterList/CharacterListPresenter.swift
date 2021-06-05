//
//  CharacterListPresenter.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 10/05/21.
//

import Foundation

protocol CharacterListPresenterProtocol {
    
    func showCharacterList(_ characterList: [Character])
}

class CharacterListPresenter: CharacterListPresenterProtocol {
    
    // MARK: - VIP Properties
    
    weak var viewController: CharacterListViewControllerProtocol!
    
    // MARK: - Public Functions
    
    func showCharacterList(_ characterList: [Character]) {
        viewController.showCharacterList(characterList)
    }
}
