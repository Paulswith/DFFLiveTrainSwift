//
//  DLTabBarViewController.swift
//  DouyuLive
//
//  Created by dobby on 2018/4/26.
//  Copyright © 2018 dobby. All rights reserved.
//

import UIKit

class DLTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubItem(DLMainLiveController.init(),
                     normalImageName: "tab_recommend_normal",
                     hoverImageName: "tab_recommend_hover")
        setupSubItem(DLMainVIdeoViewController.init(),
                     normalImageName: "tab_message_normal",
                     hoverImageName: "tab_message_hover")
        setupSubItem(DLMainFollowViewController.init(),
                     normalImageName: "tab_group_normal",
                     hoverImageName: "tab_group_hover")
        setupSubItem(DLMainFishBarViewController.init(),
                     normalImageName: "tab_group_normal",
                     hoverImageName: "tab_group_hover")
        setupSubItem(DLMainDiscoverViewController.init(),
                     normalImageName: "tab_me_normal",
                     hoverImageName: "tab_me_hover")
    }
}

extension DLTabBarViewController {
    func setupSubItem(_ subViewController:UIViewController, normalImageName:String?, hoverImageName:String?)  {
        subViewController.tabBarItem.image = UIImage.init(named:normalImageName!)
        // 让它下移10个像素
        subViewController.tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, -10, 0)
        subViewController.tabBarItem.selectedImage = UIImage.init(named: hoverImageName!)
        self.addChildViewController(subViewController)
    }
}

