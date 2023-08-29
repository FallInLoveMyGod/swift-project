//
//  TYTableWebController.swift
//  swift-project
//
//  Created by 田耀琦 on 2023/8/14.
//

import UIKit
import WebKit
class TYTableWebController: BaseViewController {
    
    
    var superCanScroll: Bool = true;
    var childCanScroll: Bool = false;
    var maxOffset: CGFloat = TYScreenHeight - TYTopBarHeight - 400
    var webView: WKWebView?
    
    lazy var scrollHeaderView: UIView = {
        let temp = UIView(frame: CGRect(x: 0, y: 0, width: TYScreenWidth, height: TYScreenHeight - TYTopBarHeight - 400));
        temp.backgroundColor = .gray;
        return temp;
    }();
    
    lazy var bottomTableView: BaseTableView = {
        let tableView = BaseTableView(frame: CGRectMake(0, 0, TYScreenWidth, TYScreenHeight - TYTopBarHeight), style: .plain)
        tableView.delegate = self;
        tableView.dataSource = self;
        return tableView;
    }();

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.bottomTableView.tableHeaderView = self.scrollHeaderView;
        self.view.addSubview(self.bottomTableView);
    }
    
    deinit {
       webView = nil;
    }
}

extension TYTableWebController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "WebViewCell") as? WebViewCell
        if cell == nil {
            cell = WebViewCell(style: .default, reuseIdentifier: "WebViewCell")
        }
//        cell!.path = "https://blog.csdn.net/fei2636/article/details/77847047";
        self.webView = cell!.webView;
        self.webView?.scrollView.delegate = self;
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TYScreenHeight - TYTopBarHeight;
    }
    
}

extension TYTableWebController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView == self.bottomTableView) {
            if !superCanScroll {
                scrollView.contentOffset.y = maxOffset;
                childCanScroll = true;
            }
            else {
                if (scrollView.contentOffset.y >= maxOffset) {
                    scrollView.contentOffset.y = maxOffset;
                    superCanScroll = false;
                    childCanScroll = true;
                }
            }
        }
        else if (scrollView.superview == self.webView) {
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


