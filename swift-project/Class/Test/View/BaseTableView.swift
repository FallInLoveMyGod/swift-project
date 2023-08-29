//
//  BaseTableView.swift
//  swift-project
//
//  Created by 田耀琦 on 2023/8/14.
//

import UIKit

class BaseTableView: UITableView, UIGestureRecognizerDelegate {

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true;
    }
    
//    - (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
//    {
//        return ([[touch.view class] isSubclassOfClass:[UIButton class]]) ? NO : YES;
//    }

}
