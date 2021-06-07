//
//  CharacterListPresenter.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 10/05/21.
//

import Foundation

protocol CharacterListPresenterProtocol {
    
    func showCharacterList(_ characterList: [Character])
    
    func showLoading()
    
    func hideLoading()
}

class CharacterListPresenter: CharacterListPresenterProtocol {
    
    // MARK: - VIP Properties
    
    weak var viewController: CharacterListViewControllerProtocol!
    
    // MARK: - Public Functions
    
    func showCharacterList(_ characterList: [Character]) {
        viewController.showCharacterList(characterList)
    }
    
    func showLoading() {
        viewController.showLoading()
    }
    
    func hideLoading() {
        viewController.hideLoading()
    }
}
