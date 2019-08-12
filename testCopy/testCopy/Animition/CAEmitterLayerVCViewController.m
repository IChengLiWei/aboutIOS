//
//  CAEmitterLayerVCViewController.m
//  testCopy
//
//  Created by Air on 2019/8/12.
//  Copyright © 2019 Air. All rights reserved.
//

#import "CAEmitterLayerVCViewController.h"

@interface CAEmitterLayerVCViewController ()

@end

@implementation CAEmitterLayerVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor lightGrayColor];
  
    // Do any additional setup after loading the view from its nib.
}
- (void)viewDidLayoutSubviews{
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = self.view.bounds;
    [self.view.layer addSublayer:emitter];

    //configure emitter
    emitter.renderMode = kCAEmitterLayerAdditive;
    emitter.emitterPosition = CGPointMake(emitter.frame.size.width / 2.0, emitter.frame.size.height / 2.0);

    //create a particle template
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"ziyuan"].CGImage;
    cell.birthRate = 1000;
    cell.lifetime = 2;
    cell.color = [UIColor blueColor].CGColor;
    cell.alphaSpeed = -0.3;
    cell.velocity = 10000;
    cell.velocityRange = 100;
    cell.emissionRange = M_PI * 2.0;

    //add particle template to emitter
    emitter.emitterCells = @[cell];
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
