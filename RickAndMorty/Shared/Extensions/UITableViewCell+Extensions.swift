//
//  UITableViewCell+Extensions.swift
//  RickAndMorty
//
//  Created by Julio Oliveira on 12/05/21.
//

import UIKit

extension UITableViewCell {
    
    static func registerOn(_ tableView: UITableView) {
        let reuseIdentifier = String(describing: self.self)
        tableView.register(self.self, forCellReuseIdentifier: reuseIdentifier)
    }
}

