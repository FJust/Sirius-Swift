//
//  RecentsController.swift
//  Sirius-Swift
//
//  Created by PF on 2017/6/7.
//  Copyright © 2017年 PF. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RecentsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        RequestAPI(host: .crmService,
                   path: .login,
                   parameters: ["phone": "11111111126",
                                "password": "96e79218965eb72c92a549dd5a330112",
                                "loginType": "2",
                                "deviceName": UIDevice.current.model]
            ).response { (data) in
                let json = JSON(data.data!)
                println(json.dictionaryValue)
        }
        
//        println(a!, a?.rawValue)
        
//        Alamofire.request("www.baidu.com").responseJSON { response in
//            println(response.request)  // original URL request
//            print(response.response) // HTTP URL response
//            print(response.data)     // server data
//            print(response.result)   // result of response serialization
//            
//            if let JSON = response.result.value {
//                print("JSON: \(JSON)")
//            }
//        }
//        let cache = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
//        let _ = cache.map {
//            println($0)
//        }
//        println(cache)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
