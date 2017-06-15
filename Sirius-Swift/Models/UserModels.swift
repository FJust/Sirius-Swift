//
//  UserModels.swift
//  Sirius-Swift
//
//  Created by PF on 2017/6/9.
//  Copyright © 2017年 PF. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectiveC

struct LoginInfoModel {
    
    init(_ json: JSON) {
        hxName      = json["hxName"].stringValue
        userId      = json["userId"].stringValue
        hxPassword  = json["hxPassword"].stringValue
        loginToken  = json["loginToken"].stringValue

    }
    
    var hxName: String
    var userId: String
    var hxPassword: String
    var loginToken: String
}
