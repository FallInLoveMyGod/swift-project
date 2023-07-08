//
//  UtilDefine.swift
//  swift_pub
//
//  Created by 田耀琦 on 2019/11/18.
//  Copyright © 2019 田耀琦. All rights reserved.
//

import Foundation
import UIKit

/**
 默认颜色
 */
func RGBColor(r :CGFloat ,g:CGFloat,b:CGFloat, alpha: CGFloat? = 1) -> UIColor{
    return UIColor.init(_colorLiteralRed: Float(r / 255.0), green:Float(g / 255.0) , blue:Float (b / 255.0), alpha: Float(alpha!))
}

func HEXColor(_ h:Int, alpha:CGFloat? = 1) ->UIColor {
    return RGBColor(r: CGFloat(((h)>>16) & 0xFF), g: CGFloat(((h)>>8) & 0xFF), b:  CGFloat((h) & 0xFF), alpha: alpha)
}

let Color_999999 = HEXColor(0x999999, alpha: 0.9)
let Color_Shadwon = RGBColor(r: 0x0, g: 0x0, b: 0x0, alpha: 0.3)

/**
 默认字体
 */
func Font(_ fontSize: CGFloat, fontWeight: UIFont.Weight? = .regular) -> UIFont {
    return UIFont.systemFont(ofSize: fontSize, weight: fontWeight!)
}

let defaultFont = Font(14, fontWeight: .regular);

/**
 日志打印 🌟 ✨
 */
#if DEBUG
public func printx(items: Any..., filename: String = #file, function: String = #function, line: Int = #line) {
    print("\n🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟\n File: \((filename as NSString).lastPathComponent)\n Line: \(line)\n Method: \(function)\n",items,"\n✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨")
}
#else
public func printx(items: Any..., filename: String = #file, function: String = #function, line: Int = #line) { }
#endif
