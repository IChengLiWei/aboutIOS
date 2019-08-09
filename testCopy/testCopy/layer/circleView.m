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
