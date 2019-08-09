//
//  GCDViewController.m
//  testCopy
//
//  Created by Air on 2019/7/15.
//  Copyright © 2019 Air. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()
@property(nonatomic,assign)int testCount;
@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        self.view.backgroundColor=[UIColor whiteColor];
    [self GCDtest];
}
-(void)GCDtest{
    
    dispatch_group_t thegroup=dispatch_group_create();
    dispatch_queue_t thequeue=dispatch_queue_create("curent", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_async(thegroup, thequeue, ^{
        
        self.testCount+=1;
        NSLog(@"%@",[NSThread currentThread]);
    });
    dispatch_group_async(thegroup, thequeue, ^{
        
        self.testCount+=2;
        NSLog(@"%@",[NSThread currentThread]);
    });
    dispatch_group_notify(thegroup, dispatch_get_main_queue(), ^{
        NSLog(@"%d",self.testCount);
    });
    
    
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
