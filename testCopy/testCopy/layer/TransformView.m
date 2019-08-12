//
//  TransformView.m
//  testCopy
//
//  Created by Air on 2019/8/12.
//  Copyright © 2019 Air. All rights reserved.
//

#import "TransformView.h"

@implementation TransformView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews{
    [super layoutSubviews];
 
}
- (void)drawRect:(CGRect)rect{
    CGFloat distance=110;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(175, 100)];
    [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [path moveToPoint:CGPointMake(150, 125)];
    [path addLineToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(125, 225)];
    [path moveToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(175, 225)];
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(200, 150)];
    
    [path moveToPoint:CGPointMake(175+distance, 100)];
    [path addArcWithCenter:CGPointMake(150+distance, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [path moveToPoint:CGPointMake(150+distance, 125)];
    [path addLineToPoint:CGPointMake(150+distance, 175)];
    [path addLineToPoint:CGPointMake(125+distance, 225)];
    [path moveToPoint:CGPointMake(150+distance, 175)];
    [path addLineToPoint:CGPointMake(175+distance, 225)];
    
    [path moveToPoint:CGPointMake(100+distance, 150)];
    [path addLineToPoint:CGPointMake(200+distance, 150)];
    
    [path moveToPoint:CGPointMake(100, 50)];
    [path addLineToPoint:CGPointMake(200+distance, 50)];
    [path addLineToPoint:CGPointMake(200+distance+50, 125)];
    [path addLineToPoint:CGPointMake(200+distance+50, 250)];
    [path addLineToPoint:CGPointMake(50, 250)];
     [path addLineToPoint:CGPointMake(50, 125)];
     [path addLineToPoint:CGPointMake(100, 50)];
    //define path parameters
    CGRect rect2 = CGRectMake(10, 10, 100, 100);
    CGSize radii = CGSizeMake(25, 25);
    UIRectCorner corners = UIRectCornerTopRight | UIRectCornerBottomRight | UIRectCornerBottomLeft;
    //create path
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRoundedRect:rect2 byRoundingCorners:corners cornerRadii:radii];
    
    //create shape layer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor purpleColor].CGColor;
    shapeLayer.lineWidth = 5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    
    CAShapeLayer *shapeLayer2 = [CAShapeLayer layer];
    shapeLayer2.strokeColor = [UIColor redColor].CGColor;
    shapeLayer2.fillColor = [UIColor purpleColor].CGColor;
    shapeLayer2.lineWidth = 5;
    shapeLayer2.lineJoin = kCALineJoinRound;
    shapeLayer2.lineCap = kCALineCapRound;
    shapeLayer2.path = path2.CGPath;
    
    [self.layer addSublayer:shapeLayer];
    [self.layer addSublayer:shapeLayer2];
}

@end
