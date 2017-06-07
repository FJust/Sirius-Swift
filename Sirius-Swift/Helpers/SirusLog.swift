//
//  SirusLog.swift
//  Sirius-Swift
//
//  Created by PF on 2017/6/7.
//  Copyright © 2017年 PF. All rights reserved.
//

import Foundation

func println(_ item: Any...) {
    #if DEBUG
        print(item)
    #endif
}
