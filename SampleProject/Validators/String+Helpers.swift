//
//  String+Helpers.swift
//  assetplus
//
//  Created by Sayeed Munawar Hussain on 08/09/16.
//  Copyright © 2016 Sayeed Munawar Hussain. All rights reserved.
//

import Foundation

extension String {
    
    var length : Int {
        
        get {
            return characters.count
        }
    }
    
    var containsSpaces: Bool {
        
        get {
            return (self as NSString).rangeOfCharacter(from: NSCharacterSet.whitespaces).location != NSNotFound
        }
    }
}
