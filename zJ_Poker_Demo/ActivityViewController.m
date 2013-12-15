//
//  ActivityViewController.m
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-11.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "ActivityViewController.h"
#import "SIAlertView.h"


@interface ActivityViewController ()

@end

@implementation ActivityViewController


@synthesize activityImage = _activityImage;
@synthesize backButton = _backButton;
@synthesize firstActivityButton = _firstActivityButton;
@synthesize secondActivityButton = _secondActivityButton;
@synthesize thirdActivityButton = _thirdActivityButton;
@synthesize fourthActivityButton = _fourthActivityButton;
@synthesize receiveAwardsButton = _receiveAwardsButton;

@synthesize activityLabel = _activityLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _lastTouchNumber = -1;
    
    [self _initBackGround];
    [self _initBackButton];
    [self _initActivityButton];
    [self _initReceiveAwardsButton];
    
	// Do any additional setup after loading the view.
}

- (void) _initBackGround
{
    
    _backGroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenHeight, ScreenWidth)];
    [_backGroundImage setImage:[UIImage imageNamed:@"二级页面_底.jpg"]];
    [_backGroundImage setUserInteractionEnabled:YES];
    [self.view addSubview:_backGroundImage];
    
    _titleBarImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenHeight, 45)];
    [_titleBarImage setImage:[UIImage imageNamed:@"二级页面_标题.png"]];
    [_titleBarImage setUserInteractionEnabled:YES];
    [self.view addSubview:_titleBarImage];
    
    _labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    [_labelTitle setCenter:CGPointMake(ScreenHeight/2, 17)];
    [_labelTitle setTextColor:[UIColor whiteColor]];
    [_labelTitle setText:@"云顶山庄"];
    _labelTitle.textAlignment = NSTextAlignmentCenter;
    [_labelTitle setFont:[UIFont systemFontOfSize:20.0]];
    [self.view addSubview:_labelTitle];
    
    _activityBGImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 45, ScreenHeight - 10,ScreenWidth - 95 )];
    [_activityBGImage setImage:[UIImage imageNamed:@"活动背景.png"]];
    [self.view addSubview:_activityBGImage];
    
    _activityImage = [[UIImageView alloc]initWithFrame:CGRectMake(50, 80, 150, 150)];
    [_activityImage setBackgroundColor:[UIColor orangeColor]];
    _activityImage.layer.cornerRadius = 5.0;
    _activityImage.layer.masksToBounds = YES;
    [_activityImage setImage:[UIImage imageNamed:@"活动框.png"]];
    [self.view addSubview:_activityImage];
    
    _activityLabel = [[UILabel alloc] initWithFrame:CGRectMake(250, 90, 150, 100)];
    [_activityLabel setText:@"小盲5千场，每玩牌70局送蓝钻石，蓝钻石有木有！赶紧玩呀！玩呀！呀！"];
    [_activityLabel setNumberOfLines:0];
    [self.view addSubview:_activityLabel];

    _footBarImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, _activityBGImage.bottom - 5, ScreenHeight - 10,50 )];
    [_footBarImage setImage:[UIImage imageNamed:@"底条背景.png"]];
    [self.view addSubview:_footBarImage];
    
}

- (void)_initBackButton
{
    _backButton = [[UIButton alloc] initWithFrame:CGRectMake(3, 5, 40, 25)];
    [_backButton setImage:[UIImage imageNamed:@"Roomlist_backBtn.png"] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
}
- (void) backAction:(UIButton *) button
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) _initReceiveAwardsButton
{
    _receiveAwardsButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenHeight - 120, ScreenWidth - 100, 100, 30)];
    [_receiveAwardsButton setTitle:@"领取奖励" forState:UIControlStateNormal];
    [_receiveAwardsButton quickStart];
    [_receiveAwardsButton addTarget:self action:@selector(receiveAwardsAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_receiveAwardsButton];
}
- (void) receiveAwardsAction:(UIButton *)button
{
    SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:@"" andMessage:@"你已经在小盲5千场玩牌0局，再玩70局即可领取奖励"];
    [alertView addButtonWithTitle:@"Cancel"
                             type:SIAlertViewButtonTypeCancel
                          handler:^(SIAlertView *alertView) {
                              NSLog(@"Cancel Clicked");
                          }];
    [alertView addButtonWithTitle:@"OK"
                             type:SIAlertViewButtonTypeDefault
                          handler:^(SIAlertView *alertView) {
                              NSLog(@"OK Clicked");
                              
                          }];
    alertView.titleColor = [UIColor blueColor];
    alertView.cornerRadius = 10;
    alertView.buttonFont = [UIFont boldSystemFontOfSize:15];
    alertView.transitionStyle = SIAlertViewTransitionStyleBounce;
    [alertView show];
}

- (void)_initActivityButton
{
    _slideImage = [[UIImageView alloc] initWithFrame:CGRectMake(_footBarImage.left, _footBarImage.top - 9, 122, 57)];
    [_slideImage setImage:[UIImage imageNamed:@"指针左.png"]];
    [self.view addSubview:_slideImage];
    
    _firstActivityButton = [[UIButton alloc] initWithFrame:CGRectMake(15, ScreenWidth - 50, 105, 40)];
    [_firstActivityButton nomal];
    _firstActivityButton.tag = 101;
    [_firstActivityButton addTarget:self action:@selector(activityButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_firstActivityButton];
    
    _secondActivityButton = [[UIButton alloc] initWithFrame:CGRectMake(_firstActivityButton.right + 10, ScreenWidth - 50, 105, 40)];
    [_secondActivityButton nomal];
    _secondActivityButton.tag = 102;
    [_secondActivityButton addTarget:self action:@selector(activityButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_secondActivityButton];
    
    _thirdActivityButton = [[UIButton alloc] initWithFrame:CGRectMake(_secondActivityButton.right + 10, ScreenWidth - 50, 105, 40)];
    [_thirdActivityButton nomal];
    _thirdActivityButton.tag = 103;
    [_thirdActivityButton addTarget:self action:@selector(activityButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self setButtonInvalid:_thirdActivityButton];
    [self.view addSubview:_thirdActivityButton];
    
    _fourthActivityButton = [[UIButton alloc] initWithFrame:CGRectMake(_thirdActivityButton.right + 10, ScreenWidth - 50, 105, 40)];
    [_fourthActivityButton nomal];
    _fourthActivityButton.tag = 104;
    [_fourthActivityButton addTarget:self action:@selector(activityButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_fourthActivityButton];
}

- (void) activityButtonAction:(UIButton *)button
{
    NSInteger soy = button.tag;
    if(soy != _lastTouchNumber){
        if(soy == 101){
            [_slideImage setImage:[UIImage imageNamed:@"指针左.png"]];
            [_activityImage setBackgroundColor:[UIColor orangeColor]];
            _slideImage.width = 122;
            [_activityLabel setText:@"小盲5千场，每玩牌70局送蓝钻石，蓝钻石有木有！赶紧玩呀！玩呀！呀！"];
            [_labelTitle setText:@"云顶山庄"];
            [UIView animateWithDuration:0.25 animations:^{
                _slideImage.left = _footBarImage.left;
                _slideImage.width = 122;

            }];
        }
        else if (soy == 104){
            [_slideImage setImage:[UIImage imageNamed:@"指针右.png"]];
            [_activityImage setBackgroundColor:[UIColor grayColor]];
            _slideImage.width = 122;
            [_activityLabel setText:@"小盲50K场次，每玩牌120局，奖励一颗黄钻石！赶紧玩呀！玩呀！呀！"];
            [_labelTitle setText:@"蒙特卡罗"];
            [UIView animateWithDuration:0.25 animations:^{
                _slideImage.right = _footBarImage.right;

            }];
        }
        else{
            [_slideImage setImage:[UIImage imageNamed:@"指针中.png"]];
            [_activityImage setBackgroundColor:[UIColor blackColor]];
            _slideImage.width = button.width  + 10;
            [_activityLabel setText:@"全场每玩牌100局送红钻石，红钻石有木有！赶紧玩呀！玩呀！呀！"];
            [_labelTitle setText:@"皇家圣殿"];
            [UIView animateWithDuration:0.25 animations:^{
                _slideImage.left = button.left - 5;
                            }];
        }
        
        _lastTouchNumber = soy;
    }else{
        NSLog(@"%@",@"nothing happen");
    }
    
}

- (void) setButtonInvalid:(UIButton *)button{
    button.alpha = 0.4;
    button.enabled = NO;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
