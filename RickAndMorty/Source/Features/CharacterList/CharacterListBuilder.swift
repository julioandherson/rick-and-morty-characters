//
//  CharacterListBuilder.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 10/05/21.
//

import UIKit

struct CharacterListBuilder {
    
    static func build() -> UIViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CharacterListViewController")
            as? CharacterListViewController ?? CharacterListViewController()

        let interactor = CharacterListInteractor()
        let presenter = CharacterListPresenter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}
