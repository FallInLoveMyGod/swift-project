//
//  TYTestController.swift
//  swift-project
//
//  Created by 田耀琦 on 2023/8/14.
//

import UIKit

class TYTestController: BaseViewController {
    
    var superCanScroll: Bool = true;
    var childCanScroll: Bool = false;
    var maxOffset: CGFloat = 400
    
    lazy var bottomScrollView: BaseScrollView = {
        let scrollView = BaseScrollView(frame: CGRectMake(0, 0, TYScreenWidth, TYScreenHeight - TYTopBarHeight));
        scrollView.contentSize = CGSize(width: TYScreenWidth, height:400 + TYScreenHeight);
        scrollView.delegate = self;
        return scrollView;
    }();
    
    lazy var scrollHeaderView: UIView = {
        let temp = UIView(frame: CGRect(x: 0, y: 0, width: TYScreenWidth, height: 400));
        temp.backgroundColor = .gray;
        return temp;
    }();
    
    lazy var topTableView: UITableView = {
        let tableView = UITableView(frame: CGRectMake(0, 400, TYScreenWidth, TYScreenHeight - TYTopBarHeight), style: .plain)
        tableView.delegate = self;
        tableView.dataSource = self;
        return tableView;
    }();

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
        
    func setupUI() {
        self.view.addSubview(self.bottomScrollView);
        self.bottomScrollView.addSubview(self.scrollHeaderView);
        self.bottomScrollView.addSubview(self.topTableView);
    }
}

extension TYTestController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "UITableViewCell")
        cell.textLabel!.text = String(format: "index: %d", indexPath.row);
        return cell;
    }
}

extension TYTestController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView == self.bottomScrollView) {
            if !superCanScroll {
                scrollView.contentOffset.y = maxOffset;
                childCanScroll = true;
            }
            else {
                if (scrollView.contentOffset.y > maxOffset) {
                    scrollView.contentOffset.y = maxOffset;
                    superCanScroll = false;
                    childCanScroll = true;
                }
            }
        }
        else if (scrollView == self.topTableView) {
            if (!childCanScroll) {
                scrollView.contentOffset.y = 0;
            }
            else {
                if (scrollView.contentOffset.y <= 0) {
                    childCanScroll = false;
                    superCanScroll = true;
                }
            }
        }
    }
}
