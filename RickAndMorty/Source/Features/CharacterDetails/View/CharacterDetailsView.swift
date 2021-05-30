//
//  CharacterDetailsView.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 30/05/21.
//

import UIKit
import SnapKit

class CharacterDetailsView: UIView {
    
    // MARK: - User Interface Components
    
    private lazy var name: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    // MARK: - Inits
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Functions
    
    func setup(_ character: Character) {
        name.text = character.name
    }
}

// MARK: - ViewCodeProtocol Extension

extension CharacterDetailsView: ViewCodeProtocol {
    func setupSubviews() {
        addSubview(name)
    }
    
    func setupConstraints() {
        name.snp.makeConstraints { make in
            make.top.left.equalTo(safeAreaLayoutGuide).inset(16)
            make.bottom.right.equalTo(safeAreaLayoutGuide).offset(16)
        }
    }
    
    func setupComponents() {
        backgroundColor = .white
    }
}
