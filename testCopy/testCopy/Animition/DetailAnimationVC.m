//
//  DetailAnimationVC.m
//  testCopy
//
//  Created by Air on 2019/8/5.
//  Copyright © 2019 Air. All rights reserved.
//
#define buttonName @[@"位移",@"缩放",@"透明度",@"旋转",@"圆角",@"spring动画",@"备用"]
#define buttonName2 @[@"震动",@"path位移",@"转场渐变",@"转场覆盖",@"转场推出",@"转场揭开",@"转场水波",@"转场立体旋转",@"转场撕开",@"转场丢弃",@"自定义转场1"]

#import "DetailAnimationVC.h"
#import <Masonry.h>
@interface DetailAnimationVC ()<CAAnimationDelegate>
@property(nonatomic,strong)CALayer *aniLayer;
//
@property(nonatomic,strong)CADisplayLink *displayLink;
@end

@implementation DetailAnimationVC
//



- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"暂停动画" forState:UIControlStateNormal];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(30);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@80);
        make.height.equalTo(@40);
    }];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor=[UIColor whiteColor];
 
        switch (self.index) {
            case 0:
                [self viewbeginAnimation];
                break;
            case 1:
                [self viewBlockAnimation];
                break;
            case 2:
                [self configBaseAnimationLayer];
                break;
                
            case 3:
               [self configBaseAnimationLayer];
                 break;
                
            default:
                break;
        }

    
    // Do any additional setup after loading the view.
}
//begin commit 代码段 执行view的位置大小的变换
-(void)viewbeginAnimation{
    
    UIView *coreView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:coreView];
    
    coreView.backgroundColor=[UIColor redColor];

    [UIView beginAnimations:@"beginCommitView" context:nil];//必须 开始动画
    [UIView setAnimationDuration:5];//必须 设置的动画执行时间
    [UIView setAnimationRepeatCount:MAXFLOAT];//设置动画重复次数
    [UIView setAnimationRepeatAutoreverses:YES];//设置动画是否往返执行
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];//设置动画时间曲线 UIViewAnimationCurve
    coreView.frame=CGRectMake(100, 100, 200, 200);
    coreView.backgroundColor=[UIColor blueColor];
    [UIView commitAnimations];//必须
        [self.view layoutIfNeeded];
}
/*uiviewBlock动画
usingSpringWithDamping:0.0-1.0(数值越大d,动画停止越快) initialSpringVelocity:0.5f 数值越大初始速度越大 options: UIViewAnimationOptionRepeat(动画是否重复) | UIViewAnimationOptionAutoreverse(动画原路径返回)
*/
-(void)viewBlockAnimation{
    UIView *coreView=[[UIView alloc] init];
    [self.view addSubview:coreView];
    [coreView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view);
        make.height.width.mas_equalTo(@100);
    }];
    [self.view layoutIfNeeded];
    coreView.backgroundColor=[UIColor redColor];
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.8f initialSpringVelocity:5.0f options: UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse   animations:^{
        [coreView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.view).offset(150);
            make.bottom.mas_equalTo(self.view).offset(-150);
            make.height.width.mas_equalTo(@100);
        }];
            [self.view layoutIfNeeded];
    } completion:nil];
  
}
/**
 核心动画操作的是CALayer
 核心动画遵循CAMediaTiming协议
 核心动画分为 属性动画 转场动画以及动画组,
 属性动画(虚类)分为 基本动画和关键帧动画
 阻尼动画继承于基本动画
 http://www.cocoachina.com/articles/19612
 */
//基本动画配置

-(void)configBaseAnimationLayer{
    //主要操作的UI
    self.aniLayer = [[CALayer alloc] init];
    _aniLayer.frame = CGRectMake(200, 10, 100, 100);
   // _aniLayer.position = self.view.center;
    _aniLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:_aniLayer];
    NSArray *tempArr;
    if(self.index==2){
        tempArr=buttonName;
    }else if (self.index==3){
        
         tempArr=buttonName2;
    }
    
    //选项按钮
    for (int i = 0; i < tempArr.count; i++) {
        UIButton *aniButton = [UIButton buttonWithType:UIButtonTypeCustom];
        aniButton.tag = i;
        [aniButton setTitle:tempArr[i] forState:UIControlStateNormal];
        aniButton.exclusiveTouch = YES;
        aniButton.frame = CGRectMake(10, 50 + 60 * i, 100, 50);
        aniButton.backgroundColor = [UIColor blueColor];
        [aniButton addTarget:self action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
      
        
        
        [self.view addSubview:aniButton];
    }
    
}

-(void)tapAction:(UIButton*)button{
    if(self.index==2){
         [self basicAnimationWithTag:button.tag];
    }else if(self.index==3){
        [self keyFrameAnimationWithTag:button.tag];
    }else{
          [self transAimation:button.tag];
    }
   
}
-(void)transAimation:(NSInteger)tag{
    
}


-(void)keyFrameAnimationWithTag:(NSInteger)tag{
    CAKeyframeAnimation *keyFrameAni = nil;
    CATransition * transiAni=nil;
    switch (tag){
            
        case 0:
        {
            keyFrameAni = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
            keyFrameAni.duration = 1;
            keyFrameAni.values = @[@(-(4) / 180.0*M_PI),@((4) / 180.0*M_PI),@(-(4) / 180.0*M_PI)];
            keyFrameAni.repeatCount=MAXFLOAT;
        }
            break;
        case 1:
        {
            //曲线位移
            keyFrameAni = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            UIBezierPath *path = [UIBezierPath bezierPath];
            [path moveToPoint:_aniLayer.position];
            [path addCurveToPoint:CGPointMake(100, 600) controlPoint1:CGPointMake(200, 500) controlPoint2:CGPointMake(300, 400)];
            keyFrameAni.path = path.CGPath;
            keyFrameAni.repeatCount=3;
            keyFrameAni.duration = 5;
        }
            break;
        case 2:
        {//转场1
           transiAni = [CATransition animation];
            transiAni.type = kCATransitionFade;
            transiAni.subtype = kCATransitionFromLeft;
           transiAni.duration = 1.5;
          
        
        }
            break;
        case 3:
        {//转场1
            transiAni = [CATransition animation];
            transiAni.type = kCATransitionMoveIn;
            transiAni.subtype = kCATransitionFromLeft;
            transiAni.duration = 1.5;
          
            
        }
                  break;
        case 4:
        {//转场1
            transiAni = [CATransition animation];
            transiAni.type = kCATransitionPush;
            transiAni.subtype = kCATransitionFromLeft;
            transiAni.duration = 1.5;
          
            
        }
                  break;
        case 5:
        {//转场1
            transiAni = [CATransition animation];
            transiAni.type = kCATransitionReveal;
            transiAni.subtype = kCATransitionFromBottom;
            transiAni.duration = 1.5;
           
          
            
        }
            
                  break;
        case 6:
        {//转场1
            transiAni = [CATransition animation];
            transiAni.type = @"rippleEffect";
            transiAni.subtype = kCATransitionFromBottom;
            transiAni.duration = 1.5;
            
            
        }
                    break;
        case 7:
        {//转场1
            transiAni = [CATransition animation];
            transiAni.type = @"cube";
            transiAni.subtype = kCATransitionFromBottom;
            transiAni.duration = 1.5;
            
            
        }
                    break;
        case 8:
        {//转场1
            transiAni = [CATransition animation];
            transiAni.type = @"pageCurl";
            transiAni.subtype = kCATransitionFromBottom;
            transiAni.duration = 1.5;
            
            
        }
            
            break;
        case 9:
        {//转场1
            transiAni = [CATransition animation];
            transiAni.type = @"suckEffect";
            transiAni.subtype = kCATransitionFromBottom;
            transiAni.duration = 1.5;
            
            
        }
            
            break;
        case 10:
        {//转场1
            
            
            [self performTransition];
            return;
            
        }
            
            break;
            
        default:
            break;
          
    }
      [_aniLayer addAnimation:keyFrameAni forKey:@"keyFrameAnimation"];

    self.aniLayer.backgroundColor=[UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0].CGColor;
          [self.aniLayer addAnimation:transiAni forKey:@"TransitionFade"];
}
- (IBAction)performTransition
{
    //preserve the current view snapshot
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, YES, 0.0);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *coverImage = UIGraphicsGetImageFromCurrentImageContext();
    //insert snapshot view in front of this one
    UIView *coverView = [[UIImageView alloc] initWithImage:coverImage];
    coverView.frame = self.view.bounds;
    [self.view addSubview:coverView];
    //update the view (we'll simply randomize the layer background color)
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    //perform animation (anything you like)
   CATransition *  transiAni = [CATransition animation];
    transiAni.type = @"suckEffect";
    transiAni.subtype = kCATransitionFromBottom;
    transiAni.duration = 1.5;
    [coverView removeFromSuperview];
    [self.view.layer addAnimation:transiAni forKey:@"TransitionFade"];
}
-(void)basicAnimationWithTag:(NSInteger)tag{
    CABasicAnimation *basicAni = nil;
    switch (tag) {
        case 0:
            //初始化动画并设置keyPath
            basicAni = [CABasicAnimation animationWithKeyPath:@"position"];
            //到达位置
            basicAni.byValue = [NSValue valueWithCGPoint:CGPointMake(0, 300)];
            break;
        case 1:
            //初始化动画并设置keyPath
            basicAni = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
        
            //到达缩放
            basicAni.toValue = @(3.0f);
            break;
        case 2:
            //初始化动画并设置keyPath
            basicAni = [CABasicAnimation animationWithKeyPath:@"opacity"];
            //透明度
            basicAni.toValue=@(0.1f);
            break;
        case 3:
            //初始化动画并设置keyPath
            basicAni = [CABasicAnimation animationWithKeyPath:@"transform"];
            //3D
            basicAni.toValue=[NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2+M_PI_4, 0,0 , 1)];
            _aniLayer.anchorPoint=CGPointMake(0.5, 0.0);
            break;
        case 4:
            //初始化动画并设置keyPath
            basicAni = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
            //圆角
            basicAni.toValue=@(50);
            break;
        case 5:
            [self springAnimation];
            break;
        case 6:
            basicAni = [CABasicAnimation animationWithKeyPath:@"bounds"];
            basicAni.toValue=[NSValue valueWithCGRect:CGRectMake(0, 0, 100, 300)];
            break;
        default:
            break;
    }
    if (!basicAni) {
        return;
    }
    //设置代理
    basicAni.delegate = self;
    //延时执行
    //basicAni.beginTime = CACurrentMediaTime() + 2;
    //动画时间
    basicAni.duration = 1;
    //动画节奏
    basicAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //动画速率
    //basicAni.speed = 0.1;
    //图层是否显示执行后的动画执行后的位置以及状态
    basicAni.removedOnCompletion = NO;
    basicAni.fillMode = kCAFillModeForwards;
    //动画完成后是否以动画形式回到初始值
    basicAni.autoreverses = YES;
    //动画时间偏移
    //basicAni.timeOffset = 0.5;
    //添加动画
    [_aniLayer addAnimation:basicAni forKey:NSStringFromSelector(_cmd)];
}
//暂停动画
-(void)animationPause{
    //获取当前layer的动画媒体时间
    CFTimeInterval interval = [_aniLayer convertTime:CACurrentMediaTime() fromLayer:nil];
    //设置时间偏移量,保证停留在当前位置
    _aniLayer.timeOffset = interval;
    //暂定动画
    _aniLayer.speed = 0;
}
//恢复动画
-(void)animationResume{
    //获取暂停的时间
    CFTimeInterval beginTime = CACurrentMediaTime() - _aniLayer.timeOffset;
    //设置偏移量
    _aniLayer.timeOffset = 0;
    //设置开始时间
    _aniLayer.beginTime = beginTime;
    //开始动画
    _aniLayer.speed = 1;
}
//停止动画
-(void)animationStop{
    [_aniLayer removeAllAnimations];
    [_aniLayer removeAnimationForKey:@"groupAnimation"];
}
/**
 CASpringAnimation是iOS9才引入的动画类，效果类似于UIView的spring动画，不过比其增加了质量，劲度系数等属性的扩展，继承于CABaseAnimation
 mass：质量（影响弹簧的惯性，质量越大，弹簧惯性越大，运动的幅度越大）
 stiffness：弹性系数（弹性系数越大，弹簧的运动越快）
 damping：阻尼系数（阻尼系数越大，弹簧的停止越快）
 initialVelocity：初始速率（弹簧动画的初始速度大小，弹簧运动的初始方向与初始速率的正负一致，若初始速率为0，表示忽略该属性）
 settlingDuration：结算时间（根据动画参数估算弹簧开始运动到停止的时间，动画设置的时间最好根据此时间来设置
*/

-(void)springAnimation{
    CASpringAnimation *springAni = [CASpringAnimation animationWithKeyPath:@"position"];
    
    springAni.damping = 5;
    springAni.stiffness = 50;
    springAni.mass = 3;
    springAni.initialVelocity = 1;
    springAni.byValue = [NSValue valueWithCGPoint:CGPointMake(0, 250)];
    springAni.duration = springAni.settlingDuration;
    
    springAni.fillMode=kCAFillModeForwards;
    springAni.removedOnCompletion=NO;
    

    [_aniLayer addAnimation:springAni forKey:@"springAnimation"];
}


-(void)clickBtn:(UIButton*)sender{
  
}



#pragma mark - CAAnimationDelegate
-(void)animationDidStart:(CAAnimation *)anim{
    
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
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
