//
//  User.swift
//  Homework2
//
//  Created by Igor Vedeneev on 01/06/2018.
//  Copyright © 2018 AGIMA Education. All rights reserved.
//

import Foundation

struct User {
    let identifier: String
    let name: String
    let lastName: String
    let companyName: String
    
    init(from dictionary: [String : Any]) {
        identifier = dictionary["guid"] as? String ?? ""
        companyName = dictionary["company"] as? String ?? ""
        
        guard let nameDict = dictionary["name"] as? [String : Any] else {
            name = ""
            lastName = ""
            return
        }
        
        name = nameDict["first"] as? String ?? ""
        lastName = nameDict["last"] as? String ?? ""
    }
}

