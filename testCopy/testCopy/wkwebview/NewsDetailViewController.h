//
//  NewsDetailViewController.h
//  
//
//  Created by Air on 2018/12/4.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NewsDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(strong, nonatomic)NSString *articleID;
@property (weak, nonatomic) IBOutlet UIImageView *logoImg;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLab;
@property (weak, nonatomic) IBOutlet UILabel *introduceLab;
@property (weak, nonatomic) IBOutlet UILabel *articleTotalLab;
@property (weak, nonatomic) IBOutlet UILabel *broseTotalLab;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *broseLab;
@property (weak, nonatomic) IBOutlet UILabel *pinglunLab;
@property (weak, nonatomic) IBOutlet UILabel *biaoqianLab;

@property (weak, nonatomic) IBOutlet UILabel *fabiaoLab;
@property (weak, nonatomic) IBOutlet UILabel *wenzhangLab;

@property (weak, nonatomic) IBOutlet UIButton *lastBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;


@end

NS_ASSUME_NONNULL_END
