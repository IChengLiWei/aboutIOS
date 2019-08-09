//
//  LayerViewController.m
//  testCopy
//
//  Created by Air on 2019/7/15.
//  Copyright © 2019 Air. All rights reserved.
//

#import "LayerViewController.h"
#import "circleView.h"
#import <Masonry.h>
@interface LayerViewController ()<CALayerDelegate>

@property(nonatomic,strong)circleView * testView;
@property(nonatomic,strong)UIView * view1;
@property(nonatomic,strong)UIView * view2;
@end

@implementation LayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor=[UIColor whiteColor];
    [self aboutLayer];
    // Do any additional setup after loading the view.
}

- (void)viewDidLayoutSubviews{
    NSLog(@"layoutsubview:%@",NSStringFromCGRect(self.view1.frame));
    //如果设置了 self.edgesForExtendedLayout = UIRectEdgeNone;mas 且是中心  Frame需要在viewDidLayoutSubviews设置
        [self cycleAndShadow:self.view1];
}
//uilayer的显示

-(void)aboutLayer{
    UIView *newView=[[UIView alloc] init];
    newView.backgroundColor=[UIColor purpleColor];
    [self.view addSubview:newView];
    [newView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self.view);
        make.height.width.equalTo(@200);
    }];
    self.view1=newView;
//    newView.center=self.view.center;
//    newView.bounds=CGRectMake(0, 0, 200, 200);
  
    /*
    UIImageView *contImg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headlogo"]];
    contImg.contentMode=UIViewContentModeScaleAspectFill;
    
    [newView addSubview:contImg];
    [contImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self.view);
        make.height.width.equalTo(@200);
    }];
    */
  
   
    UIView *contentView=[[UIView alloc] init];
    contentView.backgroundColor=[UIColor  redColor];

    [newView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.centerX.centerY.equalTo(self.view);

        make.height.width.equalTo(@200);
    }];
        [self cycleAndShadow:newView];
    /*
     UIViewContentModeScaleToFill, // 根据宽高, 自动填充 kCAGravityResizeAspectFill
     UIViewContentModeScaleAspectFill, // 根据最大一边缩放, 自动填充, 多余剪掉 kCAGravityResize
     UIViewContentModeScaleAspectFit, // 根据最大一边缩放, 不填充 kCAGravityResizeAspect
      */
    UIImage *image=[UIImage imageNamed:@"headlogo"];
    contentView.layer.contents=(id)image.CGImage;
    contentView.layer.contentsGravity=kCAGravityResize;
    contentView.layer.contentsScale=image.scale;
   
    //自定义View
    circleView *customView=[[circleView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    customView.layer.backgroundColor=[UIColor greenColor].CGColor;
    [self.view addSubview:customView];
    self.testView=customView;
 
}
//切圆并且添加阴影
-(void)cycleAndShadow:(UIView*)clipView{
    CGFloat halfHeight =clipView.frame.size.height/2;
    clipView.layer.cornerRadius=halfHeight;
    clipView.layer.masksToBounds=YES;
    CALayer *shadowLayer=[CALayer layer];
    shadowLayer.frame=clipView.layer.frame;
    shadowLayer.backgroundColor=[UIColor whiteColor].CGColor;
    shadowLayer.shadowOpacity=0.8;
    shadowLayer.shadowColor=[UIColor blackColor].CGColor;
    shadowLayer.shadowOffset=CGSizeMake(0, 7);
    shadowLayer.shadowRadius=10;
    shadowLayer.cornerRadius=halfHeight;
    [clipView.superview.layer insertSublayer:shadowLayer below:clipView.layer];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.testView setNeedsDisplay];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
