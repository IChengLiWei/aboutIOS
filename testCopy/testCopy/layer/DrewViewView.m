//
//  DrewViewView.m
//  testCopy
//
//  Created by Air on 2019/8/14.
//  Copyright © 2019 Air. All rights reserved.
//

#import "DrewViewView.h"
@interface DrewViewView ()

@property (nonatomic, strong) UIBezierPath *path;

@end
@implementation DrewViewView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor=[UIColor blackColor];
        self.path = [[UIBezierPath alloc] init];
        CAShapeLayer *shapeLayer = (CAShapeLayer *)self.layer;
        shapeLayer.strokeColor = [UIColor redColor].CGColor;
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.lineJoin = kCALineJoinRound;
        shapeLayer.lineCap = kCALineCapRound;
        shapeLayer.lineWidth = 5;
    }
    return self;
}
+ (Class)layerClass
{
    //this makes our view create a CAShapeLayer
    //instead of a CALayer for its backing layer
    return [CAShapeLayer class];
}
- (void)awakeFromNib
{
    //create a mutable path
    [super awakeFromNib];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //get the starting point
    CGPoint point = [[touches anyObject] locationInView:self];
    
    //move the path drawing cursor to the starting point
    [self.path moveToPoint:point];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //get the current point
    CGPoint point = [[touches anyObject] locationInView:self];
    
    //add a new line segment to our path
    [self.path addLineToPoint:point];
    
    //redraw the view
     ((CAShapeLayer *)self.layer).path = self.path.CGPath;
}


@end
