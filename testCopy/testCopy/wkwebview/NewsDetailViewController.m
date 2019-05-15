//
//  NewsDetailViewController.m
//  
//
//  Created by Air on 2018/12/4.
//

#import "NewsDetailViewController.h"
#import <Masonry.h>


@interface NewsDetailViewController ()<WKNavigationDelegate>
@property (strong, nonatomic) WKWebView *webview;
@property (weak, nonatomic) IBOutlet UIView *webcontentview;

@end

@implementation NewsDetailViewController


#pragma mark -Life
- (void)viewDidLoad {
    [super viewDidLoad];
    self.webview=[[WKWebView alloc] init];
    self.webview.scrollView.scrollEnabled=NO;
    [self.webcontentview addSubview:self.webview];
    [self.webview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(0));
        make.top.height.left.right.mas_equalTo(self.webcontentview);
        
    }];
    // Do any additional setup after loading the view from its nib.
    self.title=@"文章详细";
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    self.webview.scrollView.bounces=NO;
    self.webview.navigationDelegate=self;
   

 
}



- (void)viewWillAppear:(BOOL)animated{
    
}
-(void)viewWillDisappear:(BOOL)animated{
 
}
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    //    self.webView.hidden=YES;
  
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    
   
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
  
    [webView evaluateJavaScript:@"document.body.offsetHeight" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        CGFloat height = [result doubleValue] + 20;
    
        [self.webview mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(height);
        }];
    }];
    
  
    
}
#pragma mark -AFN
#pragma mark -delegate
#pragma mark -event

- (IBAction)clickNextBtn:(id)sender {
   
    
  
   
 
    
}
- (IBAction)clickLastBtn:(id)sender {
    
}


@end
