//
//  SiriusCache.swift
//  Sirius-Swift
//
//  Created by PF on 2017/6/8.
//  Copyright © 2017年 PF. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

extension Realm {

    convenience init(dbName: Realm.DBName) throws {
        do {
            try self.init(configuration: Realm.Configuration().config(with: dbName))
        } catch let error {
            println(error.localizedDescription)
            throw error
        }
    }
    
    struct DBName: RawRepresentable {
        
        var rawValue: String

        static var user: Realm.DBName {
            return  Realm.DBName(rawValue: "")
        }
        
        static let `public` = Realm.DBName.init(rawValue: "public")
    }
    
}

extension Realm.Configuration {
    func config(with dbName: Realm.DBName) -> Realm.Configuration {
        
        var config = self
        config.fileURL = fileURL(with: dbName)
        config.schemaVersion = 1
        return config
    }
    
    func fileURL(with dbName: Realm.DBName) -> URL? {
        
        try? FileManager.default.createDirectory(at: Realm.Configuration.realmDirectory, withIntermediateDirectories: true, attributes: nil)
        
        return Realm.Configuration.realmDirectory.appendingPathComponent(dbName.rawValue).appendingPathExtension("realm")
    }
    
    static let realmDirectory = SandBox.caches.appendingPathComponent("Realm")
}


struct SandBox {
    
    static let documents: URL = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
    
    static let caches: URL = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0])
}
