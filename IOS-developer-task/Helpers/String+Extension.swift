//
//  String+Extension.swift
//  IOS-developer-task
//
//  Created by Elsaadany on 25/12/2021.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "\(self)_comment")
    }
    
    func htmlAttributedString() -> NSAttributedString? {
        guard let data = self.data(using: .utf8) else {
            return nil
        }
        
        return try? NSAttributedString(
            data: data,
            options: [.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil
        )
    }
}
