//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 12/05/21.
//

import UIKit
import SnapKit

class CharacterListView: UIView {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 100
        tableView.allowsSelection = false
        return tableView
    }()
    
    private var characterList: [Character] = []
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ characterList: [Character] ) {
        self.characterList = characterList
        tableView.reloadData()
    }
}

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

extension CharacterListView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = CharacterCell.identifier
        
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: identifier, for: indexPath) as? CharacterCell
        else { return UITableViewCell() }
        
        cell.setup(character: characterList[indexPath.item])
        
        return cell
    }
}
