//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 12/05/21.
//

import UIKit
import SnapKit
import Kingfisher

class CharacterCell: UITableViewCell {
    
    private lazy var characterImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var name: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16)
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
        characterImage.kf.setImage(with: URL(string: character.image))
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
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.top.left.equalTo(8)
            make.bottom.right.equalTo(8)
        }

        name.snp.makeConstraints { make in
            make.left.equalTo(characterImage).offset(16)
            make.top.equalTo(8)
            make.bottom.equalTo(8)
        }
    }
}
