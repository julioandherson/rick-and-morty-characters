//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 12/05/21.
//

import UIKit
import SnapKit

class CharacterListView: UIView {
    
    // MARK: - User Interface Components
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = true
        return tableView
    }()
    
    // MARK: - Private Properties
    
    private var characterList: [Character] = []
    
    private unowned let delegate: CharacterListViewDelegate
    
    // MARK: - Inits
    
    init(_ delegate: CharacterListViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Functions
    
    func setup(_ characterList: [Character] ) {
        self.characterList = characterList
        tableView.reloadData()
    }
    
    // MARK: - Private Functions
    
    private func selectCharacter(at index: Int) {
        delegate.selectCharacter(at: index)
    }
}

// MARK: - ViewCodeProtocol Extension

extension CharacterListView: ViewCodeProtocol {

    func setupSubviews() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    func setupComponents() {
        backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        CharacterCell.registerOn(tableView)
    }
}

// MARK: - UITableViewDelegate Extension

extension CharacterListView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = CharacterCell.identifier
        
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: identifier, for: indexPath) as? CharacterCell
        else { return UITableViewCell() }
        
        cell.setup(character: characterList[indexPath.item])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectCharacter(at: indexPath.item)
    }
}

// MARK: - UITableViewDataSource Extension

extension CharacterListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterList.count
    }
}
