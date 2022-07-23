//
//  UITableView+Identifiable.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(cellType: T.Type) {
        let nibFile = UINib(nibName: T.identity, bundle: nil)
        self.register(nibFile, forCellReuseIdentifier: T.identity)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(withCellType type: T.Type = T.self, forIndexPath indexPath: IndexPath) -> T  {
        guard let cell = dequeueReusableCell(withIdentifier: type.identity, for: indexPath) as? T else { fatalError(type.identity) }

        return cell
    }
}
