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
    // Do any additional setup after loading the view.
    NSArray *arr=@[@1,@4,@9,@10,@2,@3,@59];
   NSArray* newArr= [self maopaoPaixu:[NSMutableArray arrayWithArray:arr]];
    NSLog(@"%@iiiii%@",arr,newArr);
//    NSInteger result= [self binarySearch:90 inArr:newArr];
//    NSInteger result2=[self binarySearch:90 inArr:newArr low:0 high:arr.count];
//    NSLog(@"%ld,%ld",(long)result,(long)result2);
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



-(NSArray*) maopaoPaixu:(NSMutableArray*)originArr{

    for (int i=0; i<originArr.count; i++) {
        for (int j=0; j<originArr.count-i; j++) {
            if (originArr[j]>originArr[j+1]) {
                
                int temp=[originArr[j] intValue];
                originArr[j]=originArr[j+1];
                originArr[j+1]=@(temp);
            }
        }
    }
    return originArr;
    
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

