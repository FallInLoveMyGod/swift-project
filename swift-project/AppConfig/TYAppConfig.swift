//
//  TYAppConfig.swift
//  transpost
//
//  Created by 田耀琦 on 2019/9/1.
//  Copyright © 2019 田耀琦. All rights reserved.
//

import Foundation

var token : String = "dc01fe525ad14d879720e54db0743f37";

var environments : TYEnvironmentState = .release

enum TYEnvironmentState : Int{
    case develop = 100
    case pre_pruduct = 400
    case release = 0
}

class TYEnvironmentConfig {
    public class func host()  -> String {
        switch environments {
        case .develop:
            return "https://teststore.meiyibao.com"
        case .pre_pruduct:
            return "https://prestore.meiyibao.com"
        case .release:
            return "https://api.meiyibao.com"
        }
    }
}

