//
//  TYHomeController.swift
//  swift_pub
//
//  Created by 田耀琦 on 2019/11/21.
//  Copyright © 2019 田耀琦. All rights reserved.
//

import UIKit

class TYHomeController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labView();
    }
    
    func labView()  {
        let view1 = LabelView.init(frame: CGRectZero, ["aa", "bbbbbbbbbb", "aa", "bbbbbbbbbb", "aaa","aaa","aaa","cfadfdas","fadsfadsf","gagasdgfads"],isSingleSelect: false);
        view1.selectBtnIndexs = [1,3];
        self.view.addSubview(view1);
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.pushViewController(TYTableWebController(), animated: true);
    }
}

