//
//  LabelView.swift
//  swift-project
//
//  Created by 田耀琦 on 2023/7/8.
//  A flexible view that has any labels with auto height.
//

import UIKit

class LabelView: UIView {
    
    var datasource: [String] = [] {
        didSet {
            layoutSubView();
        }
    }
    var viewWidth: CGFloat = UIScreen.main.bounds.size.width;
    var itemHeight:CGFloat = 20;
    var isOneSelect: Bool = true;
    private var btnArray: [UIButton] = [];
    var selectBtnIndexs: [Int] = [] {
        didSet {
            for (index, item) in self.btnArray.enumerated() {
                if self.selectBtnIndexs.contains(index) {
                    self.selectBtn(btn: item, isSelect: true)
                }
                else {
                    self.selectBtn(btn: item, isSelect: false)
                }
            }
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, _ arr: [String], itemBackColor:UIColor? = .white, itemSelectColor:UIColor? = .blue, isSingleSelect:Bool = true) {
        super.init(frame: frame)
        if (frame != CGRectZero) {
            self.viewWidth = frame.width;
        }
        self.isOneSelect = isSingleSelect;
        self.backgroundColor = .white
        self.datasource = arr;
        layoutSubView();
    }
    
    func layoutSubView() {
        self.subviews.forEach { subView in
              subView.removeFromSuperview()
        }
        btnArray.removeAll();
        if self.datasource.isEmpty {
            printx(items: "数组为空")
            return;
        }
        var x: CGFloat = 0;
        var y: CGFloat = 10;
        for (index,item) in self.datasource.enumerated() {
            let size = item.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]);
            let itemButton = UIButton(type: .custom)
            itemButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            itemButton.layer.cornerRadius = 10;
            itemButton.layer.borderWidth = 0.5;
            itemButton.layer.borderColor = HEXColor(0x666666).cgColor
            itemButton.layer.masksToBounds = true;
            if size.width + 10.0 + x + 20 > self.viewWidth {
                x = 0;
                y += itemHeight+10.0;
            }
            itemButton.frame = CGRect(x: x+10.0, y: y, width: size.width + 20, height: itemHeight);
            x = x+10.0+size.width+20;
            itemButton.setTitle(item, for: .normal);
            itemButton.setTitleColor(HEXColor(0x666666), for: .normal)
            itemButton.addTarget(self, action: #selector(itemClick(btn:)), for: .touchUpInside)
            self.addSubview(itemButton);
            btnArray.append(itemButton);
        }
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.viewWidth, height: y+30+10);
    }
    
    func selectItem() {
        
    }
    
    @objc func itemClick(btn: UIButton) {
        let index = self.btnArray.firstIndex(of: btn)
        if self.isOneSelect {
            for item in self.selectBtnIndexs {
                let selectBtn = self.btnArray[item];
                self.selectBtn(btn: selectBtn, isSelect: false);
            }
        }
        if self.selectBtnIndexs.contains(index!) {
            self.selectBtn(btn: btn, isSelect: false)
            self.selectBtnIndexs.removeAll { str in
                str == index;
            }
        }
        else {
            self.selectBtn(btn: btn, isSelect: true)
            self.selectBtnIndexs.append(index!);
        }
    }
    
    func selectBtn(btn: UIButton, isSelect: Bool) {
        if isSelect {
            btn.layer.borderColor = UIColor.white.cgColor
            btn.backgroundColor = HEXColor(0x666666)
            btn.setTitleColor(.white, for: .normal)
        }
        else {
            btn.layer.borderColor = HEXColor(0x666666).cgColor
            btn.backgroundColor = .white
            btn.setTitleColor(HEXColor(0x666666), for: .normal)
        }
    }
}


