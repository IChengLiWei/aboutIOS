//
//  AnimationViewController.m
//  testCopy
//
//  Created by Air on 2019/7/16.
//  Copyright © 2019 Air. All rights reserved.
//

#import "AnimationViewController.h"
#import "DetailAnimationVC.h"
#import "CAEmitterLayerVCViewController.h"
@interface AnimationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tabView;
@property(nonatomic,strong)NSArray * section1;

@property(nonatomic,strong)NSArray * section2;

@property(nonatomic,strong)NSArray * section3;
@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self.tabView reloadData];
    self.section1=@[@"代码段动画",@"block动画之spring动画",@"基本动画",@"帧动画",@"特殊动画"];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

        return self.section1.count;
  
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.textLabel.text=[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    cell.contentView.backgroundColor=[UIColor lightGrayColor];
    cell.textLabel.text=self.section1[indexPath.row];
 
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==4) {
        CAEmitterLayerVCViewController *next=[[CAEmitterLayerVCViewController alloc] init];
        [self.navigationController pushViewController:next animated:YES];
        return;
    }
    
    DetailAnimationVC *nextVC=[[DetailAnimationVC alloc] init];
    nextVC.index=indexPath.row;
    [self.navigationController pushViewController:nextVC animated:YES];
}
- (UITableView *)tabView{
    if (!_tabView) {
        _tabView=[[UITableView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_tabView];
        
        _tabView.delegate=self;
        _tabView.dataSource=self;
        
        _tabView.separatorStyle=UITableViewCellSeparatorStyleNone;
        [_tabView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [self.view addSubview:_tabView];
        
    }
    return _tabView;
}

#pragma -mark 动画


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
