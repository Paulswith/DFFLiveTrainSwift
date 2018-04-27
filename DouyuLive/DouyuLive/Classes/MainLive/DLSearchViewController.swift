//
//  DLSearchViewController.swift
//  DouyuLive
//
//  Created by dobby on 2018/4/26.
//  Copyright © 2018 dobby. All rights reserved.
//

import UIKit

let defaultSearchContent = ["第一条", "第二条", "第三条"] // 轮播搜索文本

class DLSearchViewController: UINavigationController {
    
    private var baseNavigationView:UIView? // 未初始化需要 "?"
    private var navigSearchView:UIView?
    private var searchBarLabel:UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNewNavigationBar()
        timerChangeSearchContent(defaultSearchContent)
    }
}


extension DLSearchViewController {
    func setUpNewNavigationBar() {
        let defiCommonColor = UIColor.navigColor
        let kNavigH = navigationBar.bounds.height + 20 // +20是为了状态栏也同色
        // Step~1: 设置导航栏的底层View
        baseNavigationView = UIView.init(frame:CGRect.init(x: 0, y: 0,
                                                           width: kScreenW, height: kNavigH))
        baseNavigationView?.frame.origin = CGPoint.init(x: 0, y: -20) // 状态栏也要设置颜色,向上走20
        baseNavigationView?.backgroundColor = defiCommonColor
        navigationBar.addSubview(baseNavigationView!)
        // Step~2: 设置view上按钮
        setupSubBarView()
        // Step~3: 设置搜索框上的东东
        setupSubSearchView()
    }
    
    func setupSubBarView() {
        // 2.1 头像按钮
        let kProfileX = CGFloat(0)
        let kProfileY = CGFloat(20)
        let kProfileW = CGFloat(50)
        let kProfileH = (baseNavigationView?.bounds.height)! - 20.0
        let profileBtn = UIButton.init(frame: CGRect.init(x: kProfileX, y: kProfileY,
                                                          width: kProfileW, height: kProfileH))
        profileBtn.setImage(UIImage.init(named: "image_changeNickname_nickname"), for: .normal)
        baseNavigationView?.addSubview(profileBtn)
        
        // 2.2 历史
        let kHisBtnX = kScreenW
        let kHisBtnY = kProfileY
        let kHisBtnW = kProfileW
        let kHisBtnH = kProfileH
        let kHisLeftInsets = CGFloat(-100) // 先往右边按屏幕宽设置,然后再向左偏双倍宽
        let historyBtn = UIButton.init(frame: CGRect.init(x: kHisBtnX, y: kHisBtnY,
                                                          width: kHisBtnW, height: kHisBtnH))
        historyBtn.setImage(UIImage.init(named: "btn_nav_history"), for: .normal)
        historyBtn.imageEdgeInsets = UIEdgeInsets.init(top: 0, left:kHisLeftInsets,
                                                       bottom: 0, right: 0)
        baseNavigationView?.addSubview(historyBtn)
        
        // 2.3 搜索框
        let InsetTopBottom = CGFloat(8) // 设置上下间距
        let kSearchX = profileBtn.frame.maxX
        let kSearchY = kProfileY + InsetTopBottom
        let kSearchW = historyBtn.frame.minX - kSearchX - CGFloat(50)
        let kSearchH = kProfileH - InsetTopBottom*2 // 因为高度少了那部分也来到了这里, 所以需要*2
        navigSearchView = UIView.init(frame: CGRect.init(x: kSearchX, y: kSearchY,
                                                        width: kSearchW, height: kSearchH))
        navigSearchView?.backgroundColor = UIColor.defiColor(238, 142, 90)
        baseNavigationView?.addSubview(navigSearchView!)
    }
    
    func setupSubSearchView() {
        // 1搜索小按钮
        let kIconX = CGFloat(0)
        let kIconY = CGFloat(0)
        let kIconW = CGFloat(50)
        let kIconH = (navigSearchView?.frame.height)!
        let searchIcon = UIImageView.init(image: UIImage.init(named: "btn_nav_search"))
        searchIcon.frame = CGRect.init(x: kIconX, y: kIconY,
                                       width: kIconW, height: kIconH)
        searchIcon.sizeToFit()
        searchIcon.center.y = (navigSearchView?.frame.height)! / 2  // 居中
        navigSearchView?.addSubview(searchIcon)
        // 2二维码框框
        
        let kScanX = (navigSearchView?.frame.width)! - 25
        let kScanY = CGFloat(0)
        let kScanW = CGFloat(25)
        let kScanH = kIconH
        let scanBtn = UIButton.init(frame: CGRect.init(x: kScanX, y: kScanY,
                                                       width: kScanW, height: kScanH))
        scanBtn.setImage(UIImage.init(named: "btn_nav_scan"), for: .normal)
        scanBtn.sizeToFit()
        scanBtn.center.y = (navigSearchView?.frame.height)! / 2 // 居中
        navigSearchView?.addSubview(scanBtn)
        // 3搜索原文本
        let kSearchContentX = kIconW
        let kSearchContentY = CGFloat(0)
        let kSearchContentW = (navigSearchView?.bounds.width)! - kScanW - kIconW
        let kSearchContentH = (navigSearchView?.bounds.height)!
        
        searchBarLabel = UILabel.init(frame: CGRect.init(x: kSearchContentX, y: kSearchContentY,
                                                          width: kSearchContentW, height: kSearchContentH))
        searchBarLabel?.center.y = (navigSearchView?.frame.height)! / 2 // 居中
        searchBarLabel?.font = UIFont.systemFont(ofSize: 12)
        searchBarLabel?.textColor = UIColor.defiColor(248, 216, 195)
        if defaultSearchContent.count > 0 {
            searchBarLabel?.text = defaultSearchContent[0]
        }
        navigSearchView?.addSubview(searchBarLabel!)
        
        
    }
    
    // Step~4: 启动搜索框默认文本的定时器
    func timerChangeSearchContent(_ contentArray:[String]) {
        let maxCount = contentArray.count
        var indexer = 1
        guard maxCount > 1 else {
            return
        }
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true, block: { (_) in
            UIView.animate(withDuration: 0.5, animations: {                 // 默认在主线程的
                self.searchBarLabel?.text = defaultSearchContent[indexer]
            }, completion: { (_) in
                // 每次动画完加一, 如果加完等于了总数量, 从头开始
                indexer += 1
                guard indexer < maxCount else {
                    indexer = 0
                    return
                }
            })
        })
    }
    
    
}
