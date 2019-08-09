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
#import "TimerTestViewController.h"
#import "LayerViewController.h"
#import "GCDViewController.h"
#import "AnimationViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong, nonatomic)NSString *strongStr;
@property(copy, nonatomic)NSString *cStr;

@property(copy, nonatomic)NSMutableString *mStr;
@end

@implementation ViewController





/*什么时候发生深copy,什么时候发生浅copy
 1. copy出来的字符串一定是不可变字符串，如果传入的是可变字符串，会发生深拷贝为不可变字符串，否则为浅拷贝(传入不可变字符串)。
 2. mutablecopy，一定是深拷贝，拷贝出来的一定是可变字符串或者数组，即使传入的是不可变字符串或者数组。
 3. NSString的原因在于使改字符串不可变
 4. 如果mutable使用Copy,则会导致崩溃,因为深copy已经将对象换为不可变对象
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self CopyTest];
 
   
  
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)CopyTest{
    NSMutableString *mutStr=[[NSMutableString alloc] initWithFormat:@"啦啦啦"];
    self.strongStr=mutStr;
    mutStr=nil;

    NSLog(@"%@,---指向对象的内存%p---指向对象的内存%p",self.strongStr,self.strongStr,mutStr);
 
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
        {
            cell.textLabel.text=@"冒泡排序";
            
        }
            break;
        case 1:
        {
            cell.textLabel.text=@"定时器";
            
        }
            break;
        case 2:
        {
            cell.textLabel.text=@"Layer变换";
            
        }
            break;
        case 3:
        {
            cell.textLabel.text=@"GCD线程实现";
            
        }
            break;
        case 4:
        {
            cell.textLabel.text=@"wkWebView高度";
            
        }
            break;
        case 5:
        {
            cell.textLabel.text=@"动画";
            
        }
            break;
            
        default:
            break;
    }
    
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
           
            Binar_search *nextVC=[[Binar_search alloc] init];
            [self.navigationController pushViewController:nextVC animated:YES];
        }
            break;
        case 1:
        {
            TimerTestViewController *nextVC=[[TimerTestViewController alloc] init];
            [self.navigationController pushViewController:nextVC animated:YES];
            
        }
            break;
        case 2:
        {
            LayerViewController *nextVC=[[LayerViewController alloc] init];
            [self.navigationController pushViewController:nextVC animated:YES];
            
        }
            break;
        case 3:
        {
            GCDViewController *nextVC=[[GCDViewController alloc] init];
            [self.navigationController pushViewController:nextVC animated:YES];
            
        }
        break;
        case 4:
        {
            NewsDetailViewController *nextVC=[[ NewsDetailViewController alloc] init];
            [self.navigationController pushViewController:nextVC animated:YES];
            
        }
            break;
        case 5:
        {
            AnimationViewController *nextVC=[[ AnimationViewController alloc] init];
            [self.navigationController pushViewController:nextVC animated:YES];
            
        }
            break;
}
}
@end
