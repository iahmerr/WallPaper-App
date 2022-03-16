//
//  AppColor.swift
//  Wallpaper-App
//
//  Created by Ahmer Hassan on 06/03/2022.
//

import Foundation
import UIKit

public enum AppColorType {
    case primary
    case primaryDark
    case redLight
    case tileSoft
}

public extension UIColor {
    static func appColor(ofType colorType: AppColorType) -> UIColor {
        switch colorType {
        case  .primary:                 return #colorLiteral(red: 0.368627451, green: 0.2078431373, blue: 0.6941176471, alpha: 1)
        case .redLight:                 return #colorLiteral(red: 0.9803921569, green: 0.3137254902, blue: 0.4156862745, alpha: 0.1)
        case .primaryDark:              return #colorLiteral(red: 0.1529999971, green: 0.1330000013, blue: 0.3840000033, alpha: 1)
        case .tileSoft:                 return #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        }
    }
    
    static var primary: UIColor {
        return appColor(ofType: .primary)
    }
    
    static var redLight: UIColor {
        return appColor(ofType: .redLight)
    }
    
    static var primaryDark: UIColor {
        return appColor(ofType: .primaryDark)
    }
    
    static var tileSoft: UIColor {
        return appColor(ofType: .tileSoft)
    }
}
