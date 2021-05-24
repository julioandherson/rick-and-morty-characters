//
//  CharacterListViewDelegate.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 23/05/21.
//

import Foundation

protocol CharacterListViewDelegate: AnyObject {
    
    func selectCharacter(at index: Int)
}
