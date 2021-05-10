//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 04/05/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // MOCK TEST
        let worker = CharacterWorker().fetchCharacter() { result in
            switch result {
            case .success(let characterResponse):
                print("SUCCESS: \(characterResponse)")
            case .failure(let error):
                print("ERROR: \(error)")
            }
        }
    }
}

