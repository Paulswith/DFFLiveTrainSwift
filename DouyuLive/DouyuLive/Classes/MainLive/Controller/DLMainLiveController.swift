//
//  DLMainLiveController.swift
//  DouyuLive
//
//  Created by dobby on 2018/4/26.
//  Copyright © 2018 dobby. All rights reserved.
//

import UIKit

let kindEach = ["天天打老虎", "天搜索天", "天天打", "天天打搜索老", "天天打A", "天天打AA",
                "天天打老虎", "天天", "天天打","天天搜索打A","天搜索天打A","天天打搜索A"]


class DLMainLiveController: DLSearchViewController {
    private var _titleScrollView:UIScrollView?
    
    private var _titleNameArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.randomColor
        automaticallyAdjustsScrollViewInsets = false
//        setupTitleScrollView()
        let titleView = DLTitlelView.init(frame: CGRect.init(x: 0, y: 64, width: view.frame.width, height: kTitleScrollViewH), titles: kindEach)
        titleView.backgroundColor = UIColor.randomColor
        view.addSubview(titleView)
    }
    
}



extension DLMainLiveController {
    /*
    func setupTitleScrollView() {
        var titleViewLong = CGFloat(0)
        // 0. 添加左右空格. 计算总长度
        for var subTitleName in kindEach {
            subTitleName = " \(subTitleName) "
            _titleNameArray.append(subTitleName)
            titleViewLong += subTitleName.contentSize().width
        }
        
        // 1. 计算总厂, 布局scrollview
        _titleScrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 64,
                                                              width: Int(titleViewLong), height: kTitleScrollViewH))
        _titleScrollView?.showsHorizontalScrollIndicator = true
        _titleScrollView?.backgroundColor = UIColor.navigColor
        view.addSubview(_titleScrollView!)
        
        // 2.添加按钮
        var kTitleX = CGFloat(0)
        for (tag, btnName) in _titleNameArray.enumerated() {
            let btn = UIButton.init(type: .custom)
//            btn.titleLabel!.text = btnName
            btn.setTitle(btnName, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.setTitleColor(UIColor.white, for: .selected)
//            btn.backgroundColor = UIColor.randomColor
            btn.tag = tag
            // 获取长度ß
            let eachTitleW = CGFloat(btnName.contentSize().width)
            btn.frame = CGRect.init(x: kTitleX, y: CGFloat(0), width: eachTitleW, height: CGFloat(kTitleScrollViewH))
            _titleScrollView?.addSubview(btn)
            _titleScrollView?.contentSize =  CGSize.init(width: titleViewLong, height: CGFloat(kTitleScrollViewH))
            _titleScrollView?.scrollsToTop = false
            kTitleX += eachTitleW
        }
    }
 */
}
