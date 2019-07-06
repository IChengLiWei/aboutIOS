//
//  ViewController.m
//  testCopy
//
//  Created by Air on 2019/4/18.
//  Copyright © 2019 Air. All rights reserved.
//

#import "ViewController.h"
#import "NewsDetailViewController.h"
#import "Binar search.h"
#import <Masonry.h>
@interface ViewController ()
@property(strong, nonatomic)NSString *strongStr;
@property(copy, nonatomic)NSString *cStr;

@property(copy, nonatomic)NSMutableString *mStr;
@property(assign, nonatomic)NSInteger testCount;
@end

@implementation ViewController
- (IBAction)gonext:(id)sender {
    NewsDetailViewController *nextvc=[[NewsDetailViewController alloc] init];
    [self.navigationController pushViewController:nextvc animated:YES];
}

- (IBAction)gotoBInery:(id)sender {
    Binar_search *nextVC=[[Binar_search alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
}





/*什么时候发生深copy,什么时候发生浅copy
 1. copy出来的字符串一定是不可变字符串，如果传入的是可变字符串，会发生深拷贝为不可变字符串，否则为浅拷贝(传入不可变字符串)。
 2. mutablecopy，一定是深拷贝，拷贝出来的一定是可变字符串或者数组，即使传入的是不可变字符串或者数组。
 3. NSString的原因在于使改字符串不可变
 4. 如果mutable使用Copy,则会导致崩溃,因为深copy已经将对象换为不可变对象
 */
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self CopyTest];
//    [self GCDtest];
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
  
   
  
    
    
    
    
    
  
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)CopyTest{
    NSMutableString *mutStr=[[NSMutableString alloc] initWithFormat:@"啦啦啦"];
    self.strongStr=mutStr;
    mutStr=nil;

  
    
    
    NSLog(@"%@,---指向对象的内存%p---指向对象的内存%p",self.strongStr,self.strongStr,mutStr);
 
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
         NSLog(@"%ld",self.testCount);
    });
    
   
    
    
    
    
}


@end
