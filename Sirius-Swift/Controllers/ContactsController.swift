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
import RealmSwift

class User: Object {
    dynamic var id   = ""
    dynamic var name = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class ContactsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let r = Router(host: Configuration.APIHost.crmService, path: Configuration.APIPath.users, parameters: [:])
        Alamofire.request(r).response { data in
//            println(data.data)
            let json = JSON(data.data!)
            println(json.dictionaryValue)
        }
        
        let user = User()
        user.name = "小明"
        user.id = "INFO"
        let realm = try? Realm(fileURL: SandBox.caches.appendingPathExtension("realm"))
        
//        realm?.delete(user)
//       let obj = realm?.object(ofType: User.self, forPrimaryKey: "Info")

//        obj?.name = "大黄"
        
        try! realm?.write {
            
//            realm?.add(obj!, update: true)
            
//            obj?.name = "小学生"
//                        realm?.add(user)
            realm?.add(user, update: true)
//            realm?.create(User.self, value: ["id": "INFO", "name": "balabala"], update: true)
//            user.name = "小红"
//            realm?.add(user, update: true)
//            println("添加数据")
//            realm?.add(realmObj!)
//            user.name = "小小"
//            realm?.add(user, update: false)
        }
        
        try? realm?.write {
            user.name = "大黄"
        }
        
//        realm?.delete(user.self)
        
//        realm?.cancelWrite()
//        print(Configuration.CommonParameters())
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
