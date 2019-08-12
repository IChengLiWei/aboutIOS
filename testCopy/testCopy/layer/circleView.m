//
//  circleView.m
//  testCopy
//
//  Created by Air on 2019/8/7.
//  Copyright © 2019 Air. All rights reserved.
//

#import "circleView.h"

@implementation circleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.backgroundColor=[UIColor greenColor].CGColor;
    }
    return self;
}
//当视图出现在屏幕上时, 自动调用
- (void)drawRect:(CGRect)rect{
   
    NSLog(@"drawRect");
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self cycleAndShadow:self];
 
}
//添加外边框
-(void)redBorder{
    self.layer.borderWidth=1.0f;
    self.layer.borderColor=[UIColor redColor].CGColor;
}
//切圆并且添加阴影
-(void)cycleAndShadow:(UIView*)clipView{
    CGFloat halfHeight =clipView.frame.size.height/2;
    clipView.layer.cornerRadius=halfHeight;
    clipView.layer.masksToBounds=YES;
    CALayer *shadowLayer=[CALayer layer];
    shadowLayer.frame=clipView.layer.frame;
    shadowLayer.backgroundColor=[UIColor whiteColor].CGColor;
    shadowLayer.shadowOpacity=0.8;//透明度
    shadowLayer.shadowColor=[UIColor blackColor].CGColor;
    shadowLayer.shadowOffset=CGSizeMake(0, 7);
    shadowLayer.shadowRadius=10;//阴影模糊度 越大越模糊
    shadowLayer.cornerRadius=halfHeight;
    [clipView.superview.layer insertSublayer:shadowLayer below:clipView.layer];
}
//- (void)displayLayer:(CALayer *)layer{
//    NSLog(@"displaydisplay");
//}
//
//- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
//    layer.backgroundColor=[UIColor greenColor].CGColor;
//    CGContextSetLineWidth(ctx, 10.0f);
//    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
//    CGContextStrokeEllipseInRect(ctx, layer.bounds);
//    NSLog(@"drawLayer");
//}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
