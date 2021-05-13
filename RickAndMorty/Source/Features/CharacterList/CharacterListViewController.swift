//
//  CharacterListViewController.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 10/05/21.
//

import UIKit

protocol CharacterListViewControllerProtocol: AnyObject {
    
    func showCharacterList(_ characterList: [Character])
}

class CharacterListViewController: UIViewController {
    
    // MARK: - VIP Properties
    
    var interactor: CharacterListInteractorProtocol!
    
    private let characterListView = CharacterListView()

    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = characterListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor.fetchCharacter()
    }
}

extension CharacterListViewController: CharacterListViewControllerProtocol {

    func showCharacterList(_ characterList: [Character]) {
        print("Characters: \(characterList)")
        characterListView.setup(characterList)
    }
}
