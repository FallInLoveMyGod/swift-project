//
//  BaseTableController.swift
//  swift_pub
//
//  Created by 田耀琦 on 2019/11/18.
//  Copyright © 2019 田耀琦. All rights reserved.
//

import UIKit
import MJRefresh
import MBProgressHUD
import DZNEmptyDataSet

class BaseTableController: BaseViewController, UITableViewDelegate, UITableViewDataSource, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    var page : Int = 0;
    var rows : Int = 30;
    
    var hasHeader : Bool?{
        didSet{
            self.mytable.mj_header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(refreshData));
        }
    }
    
    var hasFooter : Bool?{
        didSet{
            self.mytable.mj_footer = MJRefreshAutoNormalFooter.init(refreshingTarget: self, refreshingAction: #selector(loadMoreData))
        }
    }
    
    lazy var dataSource : Array<Any> = {
        let _dataSource = Array<Any>();
        return _dataSource;
    }()

    lazy var mytable : UITableView = {
        let _mytable = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: TYScreenWidth, height: TYScreenHeight), style: UITableView.Style.grouped)
        _mytable.delegate = self;
        _mytable.dataSource = self;
        _mytable.estimatedRowHeight = 0;
        _mytable.rowHeight = UITableView.automaticDimension;
        _mytable.estimatedSectionFooterHeight = 0.01;
        _mytable.estimatedSectionHeaderHeight = 0.01;
        _mytable.emptyDataSetSource = self;
        _mytable.emptyDataSetDelegate = self;
        return _mytable;
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.mytable);

    }
    
    @objc func refreshData() -> Void {
        page = 0;
        self .requestData();
    }
        
    @objc func loadMoreData() -> Void {
        page += 1;
        self .requestData();
    }
    
    func requestData() -> Void {
        
    }
        
    func endRefresh() -> Void {
        if self.mytable.mj_footer.isRefreshing {
            self.mytable.mj_footer.endRefreshing()
        }
        if self.mytable.mj_header.isRefreshing {
            self.mytable.mj_header.endRefreshing()
            }
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell();
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    //MARK: DZNEmptyDataSetSource,DZNEmptyDataSetDelegate
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return UIImage.init(named: "")
    }
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let title : String = "";
        return NSAttributedString.init(string: title);
    }
    
    func emptyDataSetShouldAnimateImageView(_ scrollView: UIScrollView!) -> Bool {
        return true;
    }

}
