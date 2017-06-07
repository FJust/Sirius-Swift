//
//  ContactsController.swift
//  Sirius-Swift
//
//  Created by PF on 2017/6/7.
//  Copyright © 2017年 PF. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ContactsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let r = Router(host: Configuration.APIHost.crmService, path: Configuration.APIPath.users)
        Alamofire.request(r).response { data in
//            println(data.data)
            let json = JSON(data.data!)
            println(json.dictionaryValue)
        }
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
