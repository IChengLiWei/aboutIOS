//
//  DrewPictureVC.m
//  testCopy
//
//  Created by Air on 2019/8/14.
//  Copyright © 2019 Air. All rights reserved.
//

#import "DrewPictureVC.h"
#import "DrewViewView.h"
@interface DrewPictureVC ()
@property(nonatomic,strong)DrewViewView * theView;
@end

@implementation DrewPictureVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _theView=[[DrewViewView alloc] init];
    _theView.frame=self.view.bounds;
    [self.view addSubview:_theView];
    // Do any additional setup after loading the view from its nib.
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
