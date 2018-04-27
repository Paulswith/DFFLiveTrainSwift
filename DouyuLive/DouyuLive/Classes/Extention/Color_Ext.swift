//
//  Color_Ext.swift
//  DouyuLive
//
//  Created by dobby on 2018/4/26.
//  Copyright © 2018 dobby. All rights reserved.
//

import UIKit

extension UIColor {
    public class var randomColor:UIColor {
        get {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor.init(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
    
    public class var navigColor:UIColor {
        get {
            return UIColor.defiColor(238,120,59)
        }
    }
    
    public class func defiColor(_ R:CGFloat, _ G:CGFloat, _ B:CGFloat, alpha:CGFloat=1.0) -> UIColor {
        return UIColor.init(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: alpha)
    }
    
}
