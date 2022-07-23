//
//  UIView.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import UIKit

protocol Identifiable {
    static var identity: String { get }
}

extension UIView: Identifiable {
    static var identity: String {
        return String(describing: self)
    }
}
