//
//  SiriusDefaults.swift
//  Sirius-Swift
//
//  Created by PF on 2017/6/8.
//  Copyright © 2017年 PF. All rights reserved.
//

import Foundation

private let userIdKey   = "userId"
private let loginTokenKey  = "loginToken"

struct SiriusDefaults {
    
    static let defaults = UserDefaults(suiteName: "oakbarrel-sirius")!
    
    public static var userId: String {
        set {
            defaults.setValue(newValue, forKey: userIdKey)
        }
        get {
            guard let value = defaults.value(forKey: userIdKey) as? String else {
                return "-1"
            }
            return value
        }
    }
    
    public static var loginToken: String {
        set {
            defaults.setValue(newValue, forKey: loginTokenKey)
        }
        get {
            guard let value = defaults.value(forKey: loginTokenKey) as? String else {
                return "-1"
            }
            return value
        }
    }
    
}


struct Test<Type>: RawRepresentable {
    
    typealias RawValue = String
    
    var rawValue: String
    
    init(rawValue: Test.RawValue) {
        self.rawValue = rawValue
    }
}

extension UserDefaults {
    subscript(key: Test<String>) -> String {
        set {
            set(newValue, forKey: key.rawValue)
        }
        get {
            if let value = value(forKey: key.rawValue) as? String {
                return value
            }
            return "-1"
        }
    }
}
