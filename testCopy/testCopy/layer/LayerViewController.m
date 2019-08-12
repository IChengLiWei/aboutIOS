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
#import "TransformView.h"
@interface LayerViewController ()<CALayerDelegate>
@property(nonatomic,strong)circleView * testView;
@property(nonatomic,strong)UIView * tansView;
@property(nonatomic,strong)TransformView *shapeView;
@end

@implementation LayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor=[UIColor whiteColor];
    self.testView=[[circleView alloc] init];
    [self.view addSubview:self.testView];
    [self.testView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(10);
        make.height.width.equalTo(@100);
    }];
    
    //mask图层,content属性,
    self.testView.layer.contents=(id)[UIImage imageNamed:@"headlogo"].CGImage;
    CALayer *maskLayer=[CALayer layer];
    maskLayer.frame=self.imageView.bounds;
    maskLayer.contents=(id)[UIImage imageNamed:@"headlogo"].CGImage;
    self.imageView.layer.mask=maskLayer;
    
    //组透明 layer.shouldRasterize=yes ,layer.rasterizationscale
    
    // Do any additional setup after loading the view.
    self.tansView=[[UIView alloc] init];
    self.tansView.backgroundColor=[UIColor greenColor];
    [self.view addSubview:self.tansView];
    [self.tansView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.testView.mas_bottom).offset(20);
        make.height.width.equalTo(@100);
        make.centerX.equalTo(self.view);
    }];
    
    
    self.shapeView=[[TransformView alloc] init];
   
    [self.view addSubview:self.shapeView];
     self.shapeView.backgroundColor=[UIColor lightGrayColor];
    [self.shapeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
        make.width.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

        //core Graphices的框架
//        CGAffineTransform transForm=CGAffineTransformRotate(CGAffineTransformIdentity, M_PI_2);
//
//        self.tansView.layer.affineTransform=transForm;
        //CATransform3D
        CATransform3D transform = CATransform3DIdentity;
        //apply perspective
        transform.m34 = - 1.0 / 500.0;
        //rotate by 45 degrees along the Y axis
        transform = CATransform3DTranslate(transform, 100, 0, 100);
        self.tansView.layer.transform=transform;
        //self.tansView.layer.doubleSided=NO;

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
