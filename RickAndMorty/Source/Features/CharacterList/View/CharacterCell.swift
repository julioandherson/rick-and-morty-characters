//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 12/05/21.
//

import UIKit
import SnapKit

class CharacterCell: UITableViewCell {
    
    private lazy var characterImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var name: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    static let identifier = String(describing: CharacterCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(character: Character) {
        characterImage.load(url: character.image)
        name.text = character.name
    }
}

extension CharacterCell: ViewCodeProtocol {

    func setupSubviews() {
        addSubview(characterImage)
        addSubview(name)
    }
    
    func setupConstraints() {
        characterImage.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(100)
            make.top.left.equalTo(safeAreaLayoutGuide).offset(16)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(16)
        }

        name.snp.makeConstraints { make in
            make.left.equalTo(characterImage.snp.right).offset(8)
            make.top.equalTo(safeAreaLayoutGuide).inset(8)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(8)
        }
    }
    
    func setupComponents() {
        backgroundColor = .white
    }
}
