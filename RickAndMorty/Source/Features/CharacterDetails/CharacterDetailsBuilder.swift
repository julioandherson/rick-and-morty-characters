//
//  CharacterDetailsBuilder.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 30/05/21.
//

import UIKit

struct CharacterDetailsBuilder {
    
    // MARK: - Public Functions

    static func build(_ character: Character) -> UIViewController {
        let viewController = CharacterDetailsViewController()
        let interactor = CharacterDetailsInteractor()
        let presenter = CharacterDetailsPresenter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        interactor.character = character
        presenter.viewController = viewController
        
        return viewController
    }
}

