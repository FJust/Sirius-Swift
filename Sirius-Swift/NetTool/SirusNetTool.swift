//
//  SirusNetTool.swift
//  Sirius-Swift
//
//  Created by PF on 2017/6/7.
//  Copyright © 2017年 PF. All rights reserved.
//

import UIKit
import Alamofire



struct SirusNetTool {
    static let instance = SirusNetTool()
    
//    var rooter = Roo
//        var request: Alamofire.Request = Alamofire.request(<#T##url: URLConvertible##URLConvertible#>)
    
    func requestAPI() -> Alamofire.DataRequest {
        let request:Alamofire.DataRequest = Alamofire.request("www.baidu.com", method: .get, parameters: nil, encoding: Alamofire.URLEncoding.default, headers: nil).responseJSON { response in
            println(response)
        }
        
        return request
    }
}

struct Router: URLRequestConvertible {
    
    static let timeoutInterval = 10.0
    
    func asURLRequest() throws -> URLRequest {
        let url = try host.asURL()
        let request = URLRequest(url: url.appendingPathComponent(path), cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: timeoutInterval)
        return try encoding.encode(request, with: parameters)
    }
    
    init(host: Configuration.APIHost,
         path: Configuration.APIPath,
         method: Alamofire.HTTPMethod = .get,
         parameters: Alamofire.Parameters? = nil,
         encoding: Alamofire.ParameterEncoding = Alamofire.URLEncoding.default,
         timeoutInterval: TimeInterval = Router.timeoutInterval,
         headers: Alamofire.HTTPHeaders? = nil) {
        self.host = host.rawValue
        self.path = path.rawValue
        self.method = method
        self.timeoutInterval = timeoutInterval
        self.encoding = encoding
        parameters?.forEach {
            self.parameters[$0] = $1
        }
        headers?.forEach {
            self.headers[$0] = $1
        }
    }
    var parameters: Alamofire.Parameters = {
        
        return ["token": "dd7b1f297cd912ca742180f12433320d", "userId": 180, "client": "iphone"]
    }()
    
    var headers: Alamofire.HTTPHeaders = {
        
        return [:]
    }()
    
    var host: String
    var path: String
    var method: HTTPMethod
    var timeoutInterval: TimeInterval
    var encoding: Alamofire.ParameterEncoding
}
