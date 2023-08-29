//
//  WebViewCell.h
//  iCloudDemo
//
//  Created by 田耀琦 on 2023/7/4.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

typedef void (^Reload)(void);

@interface WebViewCell : UITableViewCell <WKUIDelegate, WKNavigationDelegate>

@property (nonatomic, strong)WKWebView *webView;

@property (nonatomic, copy)Reload reload;

@property (nonatomic, assign)CGFloat height;

@property (nonatomic, strong)NSString *path;

@end

NS_ASSUME_NONNULL_END
