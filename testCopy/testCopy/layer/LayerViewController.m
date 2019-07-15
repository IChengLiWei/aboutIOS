//
//  LayerViewController.m
//  testCopy
//
//  Created by Air on 2019/7/15.
//  Copyright © 2019 Air. All rights reserved.
//

#import "LayerViewController.h"
#import <Masonry.h>
@interface LayerViewController ()

@end

@implementation LayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self aboutLayer];
    // Do any additional setup after loading the view.
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
    
    
    
    
    [newView.superview layoutIfNeeded];
    UIView *contentView=[[UIView alloc] initWithFrame:newView.bounds];
    contentView.backgroundColor=[UIColor greenColor];
    [newView addSubview:contentView];
    newView.layer.shadowOpacity=0.8;
    newView.layer.shadowColor=[UIColor blackColor].CGColor;
    newView.layer.shadowOffset=CGSizeMake(0, 7);
    newView.layer.shadowRadius=10;
    newView.layer.cornerRadius=100;
    
    
    CALayer *circleLayer=[CALayer layer];
    circleLayer.cornerRadius=100;
    circleLayer.masksToBounds=YES;
    circleLayer.frame=newView.frame;
    circleLayer.backgroundColor=[UIColor redColor].CGColor;
    
    [self.view.layer addSublayer:circleLayer];
    
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
