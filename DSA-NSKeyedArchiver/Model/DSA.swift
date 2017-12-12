//
//  DSA.swift
//  DSA-NSKeyedArchiver
//
//  Created by C4Q on 12/12/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import Foundation

enum DSAPropertyKeys: String {
    case title
    case description
}

class DSA: NSObject, NSCoding {
    var dsaTitle: String
    var dsaDescription: String
    
    //saving to documents folder
    func encode(with aCoder: NSCoder) {
        aCoder.encode(dsaTitle, forKey: DSAPropertyKeys.title.rawValue)
        aCoder.encode(dsaDescription, forKey: DSAPropertyKeys.description.rawValue)
    }
    //loading to the app
    required convenience init?(coder aDecoder: NSCoder) {
        guard let title = aDecoder.decodeObject(forKey: DSAPropertyKeys.title.rawValue) as? String,
            let description = aDecoder.decodeObject(forKey: DSAPropertyKeys.description.rawValue) as? String else { return nil}
        self.init(title: title, description: description)
    }
    
    //designated initializer
    init(title: String, description: String) {
        self.dsaTitle = title
        self.dsaDescription = description
    }
}

//Two methods of saving NSArchiver 1. Codable and 2. NSObject
