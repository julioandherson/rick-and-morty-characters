//
//  CharacterListBuilder.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 10/05/21.
//

import UIKit

struct CharacterListBuilder {
    
    // MARK: - Public Functions
    
    static func build() -> UIViewController {
        let viewController = CharacterListViewController()
        let interactor = CharacterListInteractor()
        let presenter = CharacterListPresenter()
        let router = CharacterListRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}
