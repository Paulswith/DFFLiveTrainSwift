//
//  String_Ext.swift
//  DouyuLive
//
//  Created by dobby on 2018/4/27.
//  Copyright © 2018 dobby. All rights reserved.
//

import UIKit



extension String {
    public func contentSize() -> CGSize{
        let reSize:CGRect = self.boundingRect(with: CGSize.init(width: 320, height: 990), options: NSStringDrawingOptions.usesFontLeading,
                                     attributes: nil, context: nil)
        print(reSize)
        return reSize.size
    }
}
