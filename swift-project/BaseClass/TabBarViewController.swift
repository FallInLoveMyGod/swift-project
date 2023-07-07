//
//  TabBarViewController.swift
//  swift_pub
//
//  Created by 田耀琦 on 2019/11/21.
//  Copyright © 2019 田耀琦. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.creatNavc(viewController: TYHomeController(), defaultIcon: "", title: "首页", selectIcon: "");
        self.creatNavc(viewController: TYShopController(), defaultIcon: "", title: "商城", selectIcon: "");
        self.creatNavc(viewController: TYUseController(), defaultIcon: "", title: "其他", selectIcon: "");
        self.creatNavc(viewController: TYPersonalController(), defaultIcon: "", title: "个人中心", selectIcon: "");
    
    }
    
    func creatNavc(viewController: UIViewController, defaultIcon: String, title: String, selectIcon: String) {
        let nav: BaseNavigationController = BaseNavigationController(rootViewController: viewController);
        nav.title = title;
        nav.tabBarItem.image = UIImage.init(named: defaultIcon);
        nav.tabBarItem.selectedImage = UIImage.init(named: selectIcon);
        self.addChild(nav);
    }
    
    // 设置全局的 NavBar  TabBar
    func configNavBarAndTabBar() {
        if #available(iOS 10, *) {
            
        }
        else {
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: UIControl.State.normal)
        }
    }

    

}
