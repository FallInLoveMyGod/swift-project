//
//  BaseViewController.swift
//  swift_pub
//
//  Created by 田耀琦 on 2019/11/18.
//  Copyright © 2019 田耀琦. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configViewColor();
    }
    
    func configViewColor() {
        self.edgesForExtendedLayout = []
        self.view.backgroundColor = UIColor.HexColor(0xF7F7F7)
    }
}
