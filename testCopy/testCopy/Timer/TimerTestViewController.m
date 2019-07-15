//
//  TimerTestViewController.m
//  testCopy
//
//  Created by Air on 2019/7/12.
//  Copyright © 2019 Air. All rights reserved.
//

#import "TimerTestViewController.h"

@interface TimerTestViewController ()
@property(nonatomic,strong)NSTimer * timer;
@property(nonatomic,assign)int  count;
@end

@implementation TimerTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self TimerTest];
}
-(void)TimerTest{
    UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(200, 200, 100, 30)];
 
    _count=100;
  
    lab.tag=100;
    lab.text=[NSString stringWithFormat:@"%d",_count];
    lab.textColor=[UIColor blackColor];
    [self.view addSubview:lab];
    __weak typeof(self)weakself=self;
    NSTimer *timer =[NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        weakself.count--;
         lab.text=[NSString stringWithFormat:@"%d",weakself.count];
        
    }];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer=timer;
    [self pause:nil];
    UIButton *centerBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    [centerBtn setTitle:@"开始" forState:UIControlStateNormal];
    [centerBtn addTarget:self action:@selector(fire:) forControlEvents:UIControlEventTouchUpInside];
    centerBtn.frame=CGRectMake(100, 300, 80, 30);
    
    [self.view addSubview:centerBtn];
    
    UIButton *centerBtn2=[UIButton buttonWithType:UIButtonTypeSystem];
    [centerBtn2 setTitle:@"暂停" forState:UIControlStateNormal];
    [centerBtn2 addTarget:self action:@selector(pause:) forControlEvents:UIControlEventTouchUpInside];
    centerBtn2.frame=CGRectMake(200, 300, 80, 30);
    
    [self.view addSubview:centerBtn2];
    
    
    
    
    
}

-(void)fire:(UIButton*)sender{
    [self.timer setFireDate:[NSDate distantPast]];
}
-(void)pause:(UIButton*)sender{
    [self.timer setFireDate:[NSDate distantFuture]];
}
- (void)dealloc
{
    [self.timer invalidate];
    self.timer = nil;
    NSLog(@"dealloc");
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
