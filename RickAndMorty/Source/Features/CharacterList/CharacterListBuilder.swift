//
//  CharacterListBuilder.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 10/05/21.
//

import UIKit

struct CharacterListBuilder {
    
    static func build() -> UIViewController {
        let viewController = CharacterListViewController()
        let interactor = CharacterListInteractor()
        let presenter = CharacterListPresenter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}
