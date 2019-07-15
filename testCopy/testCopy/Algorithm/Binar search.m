//
//  Binar search.m
//  testCopy
//
//  Created by Air on 2019/5/15.
//  Copyright © 2019 Air. All rights reserved.
//

#import "Binar search.h"

@interface Binar_search ()

@end

@implementation Binar_search
//位运算 2^n次方
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];

    [self logArrayFunction:@[@1,@4,@9,@10,@2,@3,@59].mutableCopy];

}
//循环
-(NSInteger)binarySearch:(double)key inArr:(NSArray*)arr{
    if (arr.count<1) {
        return -1;
    }
    NSInteger low=0;
    NSInteger high=arr.count-1;
    while (low<=high) {
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
//递归
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



- (void)logArrayFunction:(NSMutableArray *)arr {
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
}


- (void)logArray:(NSMutableArray *)arr {
 
    for (int i = 0; i < arr.count; i++) {
        for (int j = i+1; j < arr.count; j++) {
            if ([arr[i] intValue] > [arr[j] intValue]) {
                [arr exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
        [self logArr:arr];
    }
}
//打印数组
- (void)logArr:(NSMutableArray * )array {
    NSString * str = @"";
    for (NSNumber * value in array) {
        str = [str stringByAppendingString:[NSString stringWithFormat:@"%zd ",[value integerValue]]];
    }
    NSLog(@"%@",str);
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

