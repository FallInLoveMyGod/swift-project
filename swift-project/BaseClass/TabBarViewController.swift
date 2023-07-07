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
        
        self.creatNavc(viewController: TYHomeController(), defaultIcon: "biaoqianlan_ask_default", title: "首页", selectIcon: "biaoqianlan_ask_action");
        self.creatNavc(viewController: TYShopController(), defaultIcon: "biaoqianlan_shop_default", title: "商城", selectIcon: "biaoqianlan_shop_action");
        self.creatNavc(viewController: TYUseController(), defaultIcon: "biaoqianlan_Report_default", title: "其他", selectIcon: "biaoqianlan_Report_action");
        self.creatNavc(viewController: TYPersonalController(), defaultIcon: "tabbar_wode", title: "个人中心", selectIcon: "tabbar_wode_select");
    
    }
    
    func creatNavc(viewController: UIViewController, defaultIcon: String, title: String, selectIcon: String) {
        let nav: BaseNavigationController = BaseNavigationController(rootViewController: viewController);
        nav.title = title;
        viewController.title = title;
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
