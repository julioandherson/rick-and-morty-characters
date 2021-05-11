//
//  CharacterListInteractor.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 10/05/21.
//

import Foundation

protocol CharacterListInteractorProtocol {
    
    func fetchCharacter()
}

class CharacterListInteractor: CharacterListInteractorProtocol {

    // MARK: - VIP Properties
    
    var presenter: CharacterListPresenterProtocol!
    
    private let characterWorker: CharacterWorkerProtocol
    
    init() {
        characterWorker = CharacterWorker()
    }
    
    init(characterWorker: CharacterWorkerProtocol) {
        self.characterWorker = characterWorker
    }
    
    func fetchCharacter() {
        characterWorker.fetchCharacter { [weak self] result in
            switch result {
            case .success(let characterResponse):
                self?.didFetchSuccess(characterResponse)
            case .failure(let error):
                self?.didFetchFailure(error)
            }
        }
    }
    
    // MARK: - Private Functions
    private func didFetchSuccess(_ response: CharacterListResponse) {
        let characterList = response.results
        presenter.showCharacterList(characterList)
    }
    
    private func didFetchFailure(_ error: CharacterError) {
        // Presenter show error
    }
}
