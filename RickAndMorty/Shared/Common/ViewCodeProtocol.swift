//
//  ViewCodeProtocol.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 12/05/21.
//

import Foundation

protocol ViewCodeProtocol {
    
    func setupSubviews()
    
    func setupConstraints()
    
    func setupComponents()
}

extension ViewCodeProtocol {
    
    func setupUI() {
        setupSubviews()
        setupConstraints()
        setupComponents()
    }
    
    func setupComponents() {}
}
