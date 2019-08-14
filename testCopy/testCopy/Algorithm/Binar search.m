//
//  Binar search.m
//  testCopy
//
//  Created by Air on 2019/5/15.
//  Copyright © 2019 Air. All rights reserved.
//

#import "Binar search.h"

@interface Binar_search ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView  * collectionView;
@property(nonatomic,copy)NSMutableArray * dataArr;
@end

@implementation Binar_search

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];

}
-(void)configUI{
    UIButton *startBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    [startBtn setTitle:@"开始生成随机数" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startClick:) forControlEvents:UIControlEventTouchUpInside];
    startBtn.frame=CGRectMake(20,CGRectGetMaxY(self.collectionView.frame)+20, 120, 40 );
    [self.view addSubview:startBtn];
    UIButton *paixuBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    [paixuBtn setTitle:@"开始排序" forState:UIControlStateNormal];
    [paixuBtn addTarget:self action:@selector(paixu:) forControlEvents:UIControlEventTouchUpInside];
    paixuBtn.frame=CGRectMake(CGRectGetMaxX(startBtn.frame),CGRectGetMaxY(self.collectionView.frame)+20, 120, 40 );
    [self.view addSubview:paixuBtn];
    
    UIButton *binerKeyBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    [binerKeyBtn setTitle:@"折半查找到所在位置" forState:UIControlStateNormal];
    [binerKeyBtn addTarget:self action:@selector(searchKey:) forControlEvents:UIControlEventTouchUpInside];
    binerKeyBtn.frame=CGRectMake(20,CGRectGetMaxY(startBtn.frame)+20, 120, 40 );
    [self.view addSubview:binerKeyBtn];
    
}
-(void)startClick:(UIButton *)sender{
    [self.dataArr removeAllObjects];
    [self randArr];
    
}
-(void)paixu:(UIButton*)sender{
    
    [self logArrayFunction:self.dataArr];
    [self.collectionView reloadData];
}
-(void)searchKey:(UIButton*)sender{
   NSInteger local=[self binarySearch:85 inArr:self.dataArr];
    [self.dataArr addObject:[NSString stringWithFormat:@"%ld",(long)local]];
    [self.collectionView reloadData];
   
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UILabel *lab =[[UILabel alloc] initWithFrame:CGRectMake(0,  0, 30  , 80)];
    lab.text=@"123";
    [self.view addSubview:lab];
}

//生成随机数组
-(void)randArr{
    NSMutableSet *set=[NSMutableSet setWithCapacity:10];
    while (set.count<10) {
        NSInteger value=arc4random()%21+80;
        [set addObject:[NSString stringWithFormat:@"%ld",(long)value]];
    }
    [self.dataArr addObjectsFromArray:set.allObjects];
    [self.collectionView reloadData];
    
}
    
    
//循环二分查找
-(NSInteger)binarySearch:(double)key inArr:(NSArray*)arr{
    if (arr.count<1) {
        return -1;
    }
    NSInteger low=0;
    NSInteger high=arr.count-1;
    while (low<high) {
        //位运算 2^n次方
            NSInteger mid = low+((high-low)>>1);
        double midNumber= [arr[mid] doubleValue];
        if (midNumber==key) {
            return mid;
        }else if(midNumber<key){
            low=mid+1;
            
        }else{
            high=mid-1;
        }
    }
    
    return -1;
    
    
}
//递归二分查找
-(NSInteger)binarySearch:(double)key inArr:(NSArray*)arr low:(NSInteger)low high:(NSInteger)high
{
    if (arr.count<1) {
        return -1;
    }
    
    if (low>high) {
        return -1;
    }
  
    
    NSInteger mid = low+((high-low)>>1);
    
        double midNumber= [arr[mid] doubleValue];
        if (midNumber==key) {
            return mid;
        }else if(midNumber<key){
          low=mid+1;
       return  [self binarySearch:key inArr:arr low:low high:high];
            
        }else{
            high=mid-1;
         return    [self binarySearch:key inArr:arr low:low high:high];
        }
}



- (NSArray*)logArrayFunction:(NSMutableArray *)arr {
    int count  = 0;
    int forcount  = 0;
    for (int i = 0; i < arr.count; i++) {
        forcount++;
        for (int j = (int)arr.count-2; j >= i; j--) {
            count++;
            if ([arr[j] intValue]< [arr[j+1] intValue]) {
                [arr exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
        [self logArr:arr];
     
    }
   
    NSLog(@"循环次数：%d",forcount);
    NSLog(@"共%d次比较",count);
     return  arr;
}



//打印数组
- (void)logArr:(NSMutableArray * )array {
    NSString * str = @"";
    for (NSNumber * value in array) {
        str = [str stringByAppendingString:[NSString stringWithFormat:@"%zd ",[value integerValue]]];
    }
    NSLog(@"%@",str);
}
    
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UILabel * cLab=[cell.contentView viewWithTag:999];
    if (!cLab) {
        UILabel *lab=[[UILabel alloc] initWithFrame:cell.contentView.bounds];
        lab.tag=999;
        lab.backgroundColor=[UIColor greenColor];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.textColor=[UIColor blackColor];
        [cell.contentView addSubview:lab];
        cLab=lab;
    }
    cLab.text=self.dataArr[indexPath.row];
 
    
    return cell;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
        return self.dataArr.count;
    }
    - (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
        return 1;
    }
- (UICollectionView *)collectionView{
    
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
        layout.itemSize=CGSizeMake(80, 30);
        layout.sectionInset=UIEdgeInsetsMake(10, 10, 10, 10);
        layout.minimumLineSpacing=10;
        layout.minimumInteritemSpacing=20;
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 400) collectionViewLayout:layout];
        _collectionView.backgroundColor=[UIColor grayColor];
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}
- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr=[[NSMutableArray alloc] init];
        
    }
    return _dataArr;
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

