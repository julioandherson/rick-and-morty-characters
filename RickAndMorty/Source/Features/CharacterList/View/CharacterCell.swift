//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 12/05/21.
//

import UIKit
import SnapKit

enum CharacterStatus: String {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

class CharacterCell: UITableViewCell {
        
    // MARK: - User Interface Components
    
    private lazy var characterImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var name: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var statusIndicator: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var status: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var species: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var gender: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    // MARK: - Public Properties
    
    static let identifier = String(describing: CharacterCell.self)
    
    
    // MARK: - Inits

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Functions
    
    func setup(character: Character) {
        characterImage.load(url: character.image)
        name.text = character.name
        
        let characterStatus = CharacterStatus(rawValue: character.status)
        status.text = characterStatus?.rawValue.capitalized
        
        switch characterStatus {
        case .alive:
            statusIndicator.image = #imageLiteral(resourceName: "GreenFilledCircle")
        case .dead:
            statusIndicator.image = #imageLiteral(resourceName: "RedFilledCircle")
        default:
            statusIndicator.image = #imageLiteral(resourceName: "GrayFilledCircle")
        }
        
        species.text = " - \(character.species)"
        gender.text = character.gender
    }
}

// MARK: - ViewCodeProtocol Extension

extension CharacterCell: ViewCodeProtocol {

    func setupSubviews() {
        addSubview(characterImage)
        addSubview(name)
        addSubview(statusIndicator)
        addSubview(status)
        addSubview(species)
        addSubview(gender)
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
            make.top.equalTo(safeAreaLayoutGuide).inset(16)
        }
        
        statusIndicator.snp.makeConstraints { make in
            make.height.equalTo(12)
            make.width.equalTo(12)
            make.left.equalTo(characterImage.snp.right).offset(8)
            make.top.equalTo(name.snp.bottom).offset(8)
        }
        
        status.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(6)
            make.left.equalTo(statusIndicator.snp.right).offset(4)
        }
        
        species.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(6)
            make.left.equalTo(status.snp.right).offset(0)
        }
        
        gender.snp.makeConstraints { make in
            make.left.equalTo(characterImage.snp.right).offset(8)
            make.top.equalTo(statusIndicator.snp.bottom).offset(6)
        }
    }
    
    func setupComponents() {
        backgroundColor = .white
        selectionStyle = .none
    }
}
