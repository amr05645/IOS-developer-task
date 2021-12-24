//
//  ReusableView.swift
//  IOS-developer-task
//
//  Created by Elsaadany on 24/12/2021.
//

import Foundation

protocol ReusableView: AnyObject {}

extension ReusableView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
