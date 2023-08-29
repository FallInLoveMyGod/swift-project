//
//  WebViewCell.m
//  iCloudDemo
//
//  Created by 田耀琦 on 2023/7/4.
//

#import "WebViewCell.h"
@implementation WebViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
//    self.webView.scrollView.scrollEnabled = false;
    [self.contentView addSubview:self.webView];
//    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://blog.csdn.net/fei2636/article/details/77847047"]]];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://crm.yiliangkeji.cn/dashboardH5?active=1&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJ0b2tfdHlwIjoiQUNDRVNTX1RPS0VOIiwidWlkIjoidG0wb2NrZnI3MmlycmFvNGpwOHFtMWwzYzhiZmJrdGMiLCJzY29wZSI6ImF1dGgiLCJ1c3JfdHlwIjoiQVVUSCIsImV4cCI6MTY5NDE0MTUyMSwianRpIjoiMDJ2dDFrNXIyMGgwMCJ9.rclY0aT__nPTz0nTEX4Zpllv2NJ7TzvjbV2jv7cVR6EIEWNl1N0vdGvzf3fQvE21eVX-16Bx-FZg5cPwrFs1UQ&param=%7B%22deptId%22:%5B%5D,%22userId%22:%5B%5D,%22endTime%22:%222023-08-27%22,%22timeType%22:0,%22organizationId%22:%5B19972%5D,%22type%22:2,%22startTime%22:%222023-08-21%22%7D"]]];
}

- (void)setPath:(NSString *)path {
    if (path.length != 0 && ![path isEqual:_path]) {
        _path = path;
        NSURL *url = [NSURL fileURLWithPath:path];
        [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    }
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
//    [webView evaluateJavaScript:@"document.body.scrollHeight" completionHandler:^(id _Nullable height, NSError * _Nullable error) {
//        CGFloat h = [height floatValue];
//        if (h != self.height) {
//            self.height = h;
//            [
//            self.reload();
//        }
//    }];
    return;
    NSDictionary *dict = @{@"xAxis": @[@"0-15", @"16-20", @"21-25", @"26-30", @"30+"],
                           @"xValue": @[@80, @150, @120, @39, @100]};
    NSDictionary *dict1 = @{
                           @"xAxis": @[@"0-15",@"16-20",@"21-25",@"26-30",@"30+"],
                           @"xValue": @[@(80), @(150), @(120), @(39), @(100)]
                           };
    NSString *json = [self xfunc_dictionaryToJSONString:dict];
    NSString *json2 = [self xfunc_dictionaryToJSONString:dict1];
    [webView evaluateJavaScript:[NSString stringWithFormat:@"updateDate(1,%@)",json2] completionHandler:^(id _Nullable resualt, NSError * _Nullable error) {
        NSLog(@"-- %@ -- %@",resualt,error);
    }];
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"--- %f", self.webView.scrollView.contentSize.height);
}

- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView {
    
}

- (WKWebView *)webView {
    if (!_webView) {
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        configuration.selectionGranularity = WKSelectionGranularityDynamic;
        configuration.allowsInlineMediaPlayback = YES;
        /// 注册JS
        WKUserContentController *userContentController = [[WKUserContentController alloc] init];
        configuration.userContentController = userContentController;
        WKPreferences *preferences = [WKPreferences new];
        //是否支持JavaScript
        preferences.javaScriptEnabled = YES;
        //不通过用户交互，是否可以打开窗口
        preferences.javaScriptCanOpenWindowsAutomatically = YES;
        configuration.preferences = preferences;
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, 414, 724) configuration:configuration];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
    }
    return _webView;
}

- (NSString *)xfunc_dictionaryToJSONString:(NSDictionary *)dictionary
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *jsonTemp = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSString *jsonResult = [jsonTemp stringByReplacingOccurrencesOfString:@" " withString:@""];
    return jsonResult;
}

- (void)dealloc {
    [self.webView.configuration.userContentController removeAllUserScripts];
    [_webView removeFromSuperview];
    _webView = nil;
}

@end
