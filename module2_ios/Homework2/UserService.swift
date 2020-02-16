//
//  UserService.swift
//  Homework2
//
//  Created by Igor Vedeneev on 01/06/2018.
//  Copyright © 2018 AGIMA Education. All rights reserved.
//

import Foundation

final class UserService {
    func loadUsers(completion:(([User]) -> Void)) {
        guard let passPath = Bundle.main.path(forResource: "data", ofType: "json"),
            let jsonData = NSData(contentsOfFile: passPath),
            let jsonArray = try? JSONSerialization.jsonObject(with: jsonData as Data, options: []) as? [[String : Any]]  else {
                completion([])
            return
        }
        
        guard let users = jsonArray?.map({ (json) -> User in
            return User(from: json)
        }) else {
            completion([])
            return
            
        }
        
        completion(users)
    }
}
