//
//  SirusSource.swift
//  Sirius-Swift
//
//  Created by PF on 2017/6/7.
//  Copyright © 2017年 PF. All rights reserved.
//

import UIKit
import DeviceKit

struct Configuration {
    static let easemobKey = "1173170316115850#caifuqiaotest"
    /*
     self.homepage = @"https://o.service.caifuqiao.cn/";
     self.config   = @"https://c.service.caifuqiao.cn/";
     self.product  = @"https://p.service.caifuqiao.cn/";
     self.trade    = @"https://t.service.caifuqiao.cn/";
     self.focus    = @"https://u.service.caifuqiao.cn/";
     self.user     = @"https://u.service.caifuqiao.cn/";
     self.tool     = @"https://tools.service.caifuqiao.cn/";
     self.web      = @"https://weixin.caifuqiao.cn/";
     self.crm          = @"https://crm.caifuqiao.cn/";
     self.crmService   = @"https://crm.service.caifuqiao.cn/";
     */
    enum APIHost: String {
        case user       = "https://u.service.caifuqiao.cn/";
        case web        = "https://weixin.caifuqiao.cn/"
        case crm        = "https://crm.caifuqiao.cn/"
        case crmService = "https://crm.service.caifuqiao.cn/"
    }
    
    enum APIPath: String {
        case users  = "bd/service/users"
        case login  = "proxy/user/login/send"
    }
    
    struct CommonParameters {
        let client  = "iphone"
        let app     = "crm"
        let uuid    = UUID().uuidString
    }
}

