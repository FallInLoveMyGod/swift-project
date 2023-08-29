//
//  BaseScrollView.swift
//  swift-project
//
//  Created by 田耀琦 on 2023/8/14.
//

import UIKit

class BaseScrollView: UIScrollView, UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true;
    }
    
}
