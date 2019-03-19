//
//  HexColor.swift
//
//  Created by Tasuku Maeda
//

import UIKit

public class HexColor {
    
    public static func createColor(_ hex: String, _ alpha: Float = 1) -> UIColor? {
        var scanTargetHexStr = hex
        if scanTargetHexStr.hasPrefix("#") {
            scanTargetHexStr.remove(at: scanTargetHexStr.startIndex)
        }
        if scanTargetHexStr.count != 6 {
            return nil
        }
        var rgbInt = UInt32()
        Scanner(string: scanTargetHexStr).scanHexInt32(&rgbInt)
        let redInt = rgbInt >> 16
        let greenInt = (rgbInt  >> 8) & 0xff
        let blueInt = rgbInt & 0xff
        return UIColor(red: CGFloat(redInt) / 255.0,
                       green: CGFloat(greenInt) / 255.0,
                       blue: CGFloat(blueInt) / 255.0,
                       alpha: CGFloat(alpha))
    }
    
    public static func toHex(_ color: UIColor) -> String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        let redInt = UInt32(red * 255)
        let greenInt = UInt32(green * 255)
        let blueInt = UInt32(blue * 255)
        let rgbInt = UInt32((redInt << 16) | (greenInt << 8) | blueInt)
        var resultStr = String(rgbInt, radix: 16, uppercase: true)
        let rgbStrLength:Int = 6
        if resultStr.count < rgbStrLength {
            var paddingStr = ""
            for _ in 0 ..< (rgbStrLength - resultStr.count) {
                paddingStr += "0"
            }
            resultStr = paddingStr + resultStr
        }
        return resultStr
    }
}
