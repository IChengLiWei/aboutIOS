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
@property(nonatomic,strong)CALayer * tansSlayer;

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
    self.tansSlayer=[CALayer layer];
  
    self.tansSlayer.backgroundColor=[UIColor purpleColor].CGColor;
    [self.tansView.layer addSublayer:self.tansSlayer];
    
    
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
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
   self.tansSlayer.frame=self.tansView.bounds;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self transaction];
 
}
  //事务 UIView动画与block动画块中都添加了事务
/*
 当CALayer的属性被修改时候，它会调用-actionForKey:
 1.CALayerDelegate协议指定的-actionForLayer:forKey  UIView对他关联的Laer实现了这个方法并且返回了Nil;
 2.图层接着检查包含属性名称对应行为映射的actions字典
 3.图层接着在它的style字典接着搜索属性名
 4.定义了每个属性的标准行为的-defaultActionForKey:方法。
 
 */
-(void)transaction{
    
    [CATransaction begin];
    //set the animation duration to 1 second
    [CATransaction setAnimationDuration:1.0];
    [CATransaction setCompletionBlock:^{
        //rotate the layer 90 degrees
         [CATransaction setAnimationDuration:3.0];
        CGAffineTransform transform = self.tansSlayer.affineTransform;
        transform = CGAffineTransformRotate(transform, M_PI_2);
        self.tansSlayer.affineTransform = transform;
    }];
    //隐式动画,单独作用于子图层
    self.tansSlayer.backgroundColor=[UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0].CGColor;
    [CATransaction commit];
    
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
