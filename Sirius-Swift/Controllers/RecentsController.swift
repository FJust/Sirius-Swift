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
import RxSwift
import RxCocoa

struct Speaker {
    let name: String
    let twitterHandle: String
//    var image: UIImage?
    
    init(name: String, twitterHandle: String) {
        self.name = name
        self.twitterHandle = twitterHandle
//        image = UIImage(named: name.stringByReplacingOccurrencesOfString(" ", withString: ""))
    }
}

struct SpeakerListViewModel {
    let data = Observable.just([
        Speaker(name: "Ben Sandofsky", twitterHandle: "@sandofsky"),
        Speaker(name: "Carla White", twitterHandle: "@carlawhite"),
        Speaker(name: "Jaimee Newberry", twitterHandle: "@jaimeejaimee"),
        Speaker(name: "Natasha Murashev", twitterHandle: "@natashatherobot"),
        Speaker(name: "Robi Ganguly", twitterHandle: "@rganguly"),
        Speaker(name: "Virginia Roberts",  twitterHandle: "@askvirginia"),
        Speaker(name: "Scott Gardner", twitterHandle: "@scotteg")
        ])
}

class RecentsController: UIViewController {

    @IBOutlet weak var recentConversationTableView: UITableView!
    
    let speakerListViewModel = SpeakerListViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        speakerListViewModel.data
            .bind(to: recentConversationTableView.rx
                .items(cellIdentifier: "recentCell", cellType: RecentConversationCell.self)) { _, speaker, cell in
                    cell.textLabel?.text = speaker.name
                    cell.detailButton?.rx
                        .tap
                        .subscribe(onNext: {
                            print("点击了Button")
                        })
                        .disposed(by: self.disposeBag)
                    
                    cell.detailButton?.rx.controlEvent([.touchUpInside])
                        .subscribe(onNext: {
                        print("点击了按钮")
                        })
                        .disposed(by: self.disposeBag)
                    
            }
            .disposed(by: disposeBag)
        
        recentConversationTableView.rx
        .modelSelected(Speaker.self)
        .subscribe(onNext: {
            print($0.name)
        })
        .disposed(by: disposeBag)
        
//        recentConversationTableView.
        
//    RequestAPI(host: .crmService,
//                   path: .login,
//                   parameters: ["phone": "11111111126",
//                                "password": "96e79218965eb72c92a549dd5a330112",
//                                "loginType": "2",
//                                "deviceName": UIDevice.current.model]
//            ).response { (data) in
//                let json = JSON(data.data!)
//                println(json.dictionaryValue)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
