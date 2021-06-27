//
//  CharacterListViewController.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 10/05/21.
//

import UIKit

protocol CharacterListViewControllerProtocol: AnyObject {
    
    func showCharacterList(_ characterList: [Character])
    
    func showLoading()
    
    func hideLoading()
}

class CharacterListViewController: UIViewController {
    
    // MARK: - VIP Properties
    
    var interactor: CharacterListInteractorProtocol!
    
    var router: CharacterListRouterProtocol!
    
    // MARK: - Private Properties
    
    private lazy var characterListView: CharacterListView = {
        return CharacterListView(self)
    }()

    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = characterListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor.fetchCharacter()
    }
    
    // MARK: - Private Functions
    
    private func fetchNextPage() {
        interactor.fetchNextPage()
    }
}

// MARK: - CharacterListViewControllerProtocol Extension

extension CharacterListViewController: CharacterListViewControllerProtocol {

    func showCharacterList(_ characterList: [Character]) {
        print(characterList)
        characterListView.setup(characterList)
    }
}

// MARK: - CharacterListViewDelegate Extension

extension CharacterListViewController: CharacterListViewDelegate {

    func selectCharacter(at index: Int) {
        interactor.select(at: index)
        router.proceedToCharacterDetails()
    }
    
    func didDisplayEndList() {
        fetchNextPage()
    }
}
