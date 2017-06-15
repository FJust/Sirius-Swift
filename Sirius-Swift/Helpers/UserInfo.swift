//
//  UserInfo.swift
//  Sirius-Swift
//
//  Created by PF on 2017/6/8.
//  Copyright © 2017年 PF. All rights reserved.
//

import UIKit
import Realm
import RealmSwift
import SwiftyJSON

class UserInfo: Object {
    
    required init(_ json: JSON) {
        super.init()
        
        accessToken             = json["token"].stringValue
        id                      = json["id"].int64Value
        phoneNumber             = json["username"].stringValue
        name                    = json["nickname"].stringValue
        nickname                = json["nickname"].stringValue
        avaterPath              = json["avater"].stringValue
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init() {
        super.init()
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    dynamic var accessToken: String         = ""
    dynamic var phoneNumber: String         = ""
    dynamic var id: Int64                   = 0
    dynamic var name: String                = ""
    dynamic var nickname: String            = ""
    dynamic var avaterPath: String          = ""
}
