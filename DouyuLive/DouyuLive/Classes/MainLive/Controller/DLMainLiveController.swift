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
    private var _titleView:DLTitlelView = {
        let titleView = DLTitlelView.init(frame: CGRect.init(x: 0, y: 64,
                                                             width: kScreenW, height: kTitleScrollViewH), titles: kindEach)
        titleView.backgroundColor = UIColor.randomColor
        return titleView
    }()
    private var _titleNameArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.randomColor
        automaticallyAdjustsScrollViewInsets = false
////        setupTitleScrollView()
//        let titleView = DLTitlelView.init(frame: CGRect.init(x: 0, y: 64, width: view.frame.width, height: kTitleScrollViewH), titles: kindEach)
//        titleView.backgroundColor = UIColor.randomColor
        view.addSubview(_titleView)
    }
    
}

