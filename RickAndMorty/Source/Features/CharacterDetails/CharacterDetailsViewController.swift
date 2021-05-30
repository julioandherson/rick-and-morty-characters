//
//  CharacterDetailsViewController.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 30/05/21.
//

import UIKit

protocol CharacterDetailsViewControllerProtocol: AnyObject {
 
    func showCharacterDetails(_ character: Character)
}

class CharacterDetailsViewController: UIViewController {
    
    // MARK: - VIP Properties
    
    var interactor: CharacterDetailsInteractorProtocol!
    
    // MARK: - Private Properties
    
    private lazy var characterDetailsView: CharacterDetailsView = {
        return CharacterDetailsView()
    }()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = characterDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.fetchCharacterDetails()
    }
}

// MARK: - Extension CharacterDetailsViewControllerProtocol

extension CharacterDetailsViewController: CharacterDetailsViewControllerProtocol {
    
    func showCharacterDetails(_ character: Character) {
        characterDetailsView.setup(character)
    }
}
