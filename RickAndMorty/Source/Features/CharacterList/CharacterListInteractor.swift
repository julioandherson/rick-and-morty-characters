//
//  CharacterListInteractor.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 10/05/21.
//

import Foundation

protocol CharacterListDataStoreProtocol {
    
    var character: Character? { get set }
}

protocol CharacterListInteractorProtocol: CharacterListDataStoreProtocol {
    
    func fetchCharacter()
    
    func fetchNextPage()
    
    func select(at index: Int)
}

class CharacterListInteractor: CharacterListInteractorProtocol {

    // MARK: - VIP Properties
    
    var presenter: CharacterListPresenterProtocol!
    
    // MARK: - Public Properties
    
    var character: Character?
    
    // MARK: - Private Properties
    
    private let characterWorker: CharacterWorkerProtocol
    
    private var characterList: [Character] = []
    
    private var currentPage = 1
    
    private var totalPages = 0
    
    // MARK: - Inits
    
    init() {
        characterWorker = CharacterWorker()
    }
    
    init(characterWorker: CharacterWorkerProtocol) {
        self.characterWorker = characterWorker
    }
    
    // MARK: - Public Functions
    
    func fetchCharacter() {
        presenter.showLoading()
        
        characterWorker.fetchCharacter(page: currentPage) { [weak self] result in
            switch result {
            case .success(let characterResponse):
                self?.didFetchSuccess(characterResponse)
            case .failure(let error):
                self?.didFetchFailure(error)
            }
        }
    }
    
    func fetchNextPage() {
        if currentPage + 1 < totalPages {
            currentPage += 1
            fetchCharacter()
        }
    }
    
    func select(at index: Int) {
        character = characterList[index]
    }
    
    // MARK: - Private Functions

    private func didFetchSuccess(_ response: CharacterListResponse) {
        presenter.hideLoading()
        
        totalPages = response.info.pages

        let characterList = response.results
        self.characterList.append(contentsOf: characterList)
        presenter.showCharacterList(characterList)
    }
    
    private func didFetchFailure(_ error: CharacterError) {
        presenter.hideLoading()
        // Presenter show error
    }
}
