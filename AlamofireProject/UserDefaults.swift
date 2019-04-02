//
//  UserDefaults.swift
//  AlamofireProject
//
//  Created by MacBook Pro on 28/03/2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import Foundation


extension UserDefaults {
    
    enum UserDefaultsKeys: String {
        case isLoggedIn
    }
    
    func setIsLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        synchronize()
}
    func isLoggedIn() -> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
}
