//
//  DLTitlelView.swift
//  DouyuLive
//
//  Created by dobby on 2018/4/27.
//  Copyright © 2018 dobby. All rights reserved.
//

import UIKit

let kTitleScrollViewH = CGFloat(30)
class DLTitlelView: UIView {
    // scrollview
    private lazy var _scrollView:UIScrollView = {
        let scrollView = UIScrollView.init()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        scrollView.backgroundColor = UIColor.navigColor
        return scrollView
    }()
    private var touchBtnMark:UIButton?
    private var titleButtonArray = [UIButton]()
    private var titles:[String]
    init(frame: CGRect, titles:[String]) {
        self.titles = titles
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        // 添加scrollview
        addSubview(_scrollView)
        _scrollView.frame = bounds
        
        //FIXME: ***********字体在选中状态需要改变***********
        // 设置子按钮
        var kTitleX = CGFloat(0)
        for (tag, var btnName) in self.titles.enumerated() {
            let btn = UIButton.init(type: .custom)
            btn.setTitle(btnName, for: .normal)
            let font = UIFont.monospacedDigitSystemFont(ofSize: 14, weight: .thin)
            btn.addTarget(self, action: #selector(tap(_:)), for: .touchDown)
            btnName = "  \(btnName)  "
            btn.titleLabel?.font = font
            btn.tintColor = UIColor.white
            btn.tag = tag
            // 获取长度ß
            let eachTitleW = CGFloat(btnName.contentSize(withFont:font).width)
            btn.frame = CGRect.init(x: kTitleX, y: CGFloat(0), width: eachTitleW, height: kTitleScrollViewH)
            _scrollView.addSubview(btn)
            kTitleX += eachTitleW
            self.titleButtonArray.append(btn)
        }
        _scrollView.contentSize = CGSize.init(width: kTitleX, height: kTitleScrollViewH)
        guard self.titleButtonArray.count == 0 else {
            self.tap(self.titleButtonArray[0])
            return
        }
        
    }
    @objc func tap(_ button:UIButton) {
        // 干掉之前的状态
        self.touchBtnMark?.isSelected = false
        self.touchBtnMark?.titleLabel?.font = UIFont.monospacedDigitSystemFont(ofSize: 14, weight: .thin)
        // 更新新按钮状态后保存
        button.isSelected = true
        button.titleLabel?.font = UIFont.monospacedDigitSystemFont(ofSize: 14, weight: .heavy)
        self.touchBtnMark = button
        
    }
}
