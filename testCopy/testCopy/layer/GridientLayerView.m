//
//  GridientLayerView.m
//  testCopy
//
//  Created by Air on 2019/8/15.
//  Copyright © 2019 Air. All rights reserved.

//渐变色layer

#import "GridientLayerView.h"

@implementation GridientLayerView
+(Class)layerClass{
    
    return [CAGradientLayer class];
}

-(void)drawRect:(CGRect)rect{
    CAGradientLayer *jianbianLayer=( CAGradientLayer *)self.layer;
    CGColorRef color=[UIColor redColor].CGColor;
    jianbianLayer.colors=@[(__bridge id)color,(__bridge id)[UIColor yellowColor].CGColor,(__bridge id)[UIColor greenColor].CGColor,(__bridge id)color];
   jianbianLayer.locations=@ [ @ 0.01,
                                   @0.05,
                                  @ 0.19,
                                 @0.20,
                            
                            
                              
                              ];
    jianbianLayer.startPoint = CGPointMake(0.0,0.0);
    jianbianLayer.endPoint =CGPointMake(1.0 , 1.0);

 
}
-(void)addAnimation{
    CABasicAnimation *locAni=[CABasicAnimation animationWithKeyPath:@"locations"];
   
    locAni.toValue=@[@1.5,@1.51,@1.76,@1.77];
    locAni.duration = 2.0;
    locAni.repeatCount = MAXFLOAT;
    [self.layer addAnimation:locAni forKey:@"gradi"];
    

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self addAnimation];
}
@end
