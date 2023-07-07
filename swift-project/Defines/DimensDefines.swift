//
//  DimensDefines.swift
//  transpost
//
//  Created by 田耀琦 on 2019/9/1.
//  Copyright © 2019 田耀琦. All rights reserved.
//

import Foundation

import UIKit

/*!
*  @brief  //!!!: 屏幕尺寸
*/

let TYScreenWidth = UIScreen.main.bounds.size.width
let TYScreenHeight = UIScreen.main.bounds.size.height
let TYStatusBarHeight = UIApplication.shared.statusBarFrame.size.height
let TYTopBarHeight = TYStatusBarHeight + 44.0
/**
 当前dev分支
 */

let TY_IPhoneX_S = UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? CGSize.init(width: 1125, height: 2436).equalTo(UIScreen.main.currentMode!.size) : false
let TY_IPhoneXR = UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? CGSize.init(width: 828, height: 1792).equalTo(UIScreen.main.currentMode!.size) : false
let TY_IPhoneXSMax = UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? CGSize.init(width: 1242, height: 2688).equalTo(UIScreen.main.currentMode!.size) : false
let TY_IPhoneXSeries : Bool = (TY_IPhoneX_S || TY_IPhoneXR || TY_IPhoneXSMax)
let TY_IPhone5_5S = UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? CGSize.init(width: 320, height: 568).equalTo(UIScreen.main.currentMode!.size) : false

let TYUnSafe_FooterHeight = TY_IPhoneXSeries ? 34.0 : 0
let TYUnSafe_HeaderHeight = TY_IPhoneXSeries ? 44.0 : 20

let TYBottomView_Height = 45.0;
let TYTopBar_Height = TYStatusBarHeight + 44.0

/// 高于iOS9
let iOS_9 = ProcessInfo.processInfo.isOperatingSystemAtLeast(OperatingSystemVersion(majorVersion: 9, minorVersion: 0, patchVersion: 0))

/// 高于某个版本
func iOS_atLeast(m: Int) -> Bool {return ProcessInfo.processInfo.isOperatingSystemAtLeast(OperatingSystemVersion(majorVersion: 9, minorVersion: 0, patchVersion: 0))}

