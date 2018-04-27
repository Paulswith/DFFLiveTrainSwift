//
//  DLTitlelView.swift
//  DouyuLive
//
//  Created by dobby on 2018/4/27.
//  Copyright © 2018 dobby. All rights reserved.
//

import UIKit

let kTitleScrollViewH = CGFloat(35) // titleView的高度

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
    private var contentViewWidth:CGFloat = 0
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
//        var kTitleX = CGFloat(0)
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
            btn.frame = CGRect.init(x: contentViewWidth, y: CGFloat(0), width: eachTitleW, height: kTitleScrollViewH)
            _scrollView.addSubview(btn)
            contentViewWidth += eachTitleW
            self.titleButtonArray.append(btn)
        }
        _scrollView.contentSize = CGSize.init(width: contentViewWidth, height: kTitleScrollViewH)
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
        
        // 根据按钮点击的位置,展示移动动画 算法代码如下
        let calX = button.frame.maxX
        switch  calX{
            // 把大概率放前面, 减少计算
        case kScreenTwoThirdW ..< (contentViewWidth-kScreenHalfW):  //  [2/3屏,总长 - 1/2屏),移动到中间
            let offset = CGPoint.init(x: (button.frame.origin.x - kScreenHalfW), y: 0)
            _scrollView.setContentOffset(offset, animated: true)
        case 0 ..< kScreenTwoThirdW:                                // [0, 2/3屏), 挪到头
            _scrollView.setContentOffset(CGPoint.init(x: 0, y: 0), animated: true)
        case (contentViewWidth-kScreenHalfW) ... contentViewWidth: // [总长 - 1/2屏, 总长],挪到尾
            let offset = CGPoint.init(x: (contentViewWidth - kScreenW), y: 0)
            _scrollView.setContentOffset(offset, animated: true)
        default:
            print("NoneThing")
        }
    }
}
