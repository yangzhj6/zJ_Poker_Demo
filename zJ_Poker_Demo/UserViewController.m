//
//  UserViewController.m
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-11.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "UserViewController.h"


#define degreesToRadians(x) (M_PI*(x)/180.0)
#define gapLenght 18

@interface UserViewController ()

@end

@implementation UserViewController

@synthesize backButton = _backButton;
@synthesize userInfoButton = _userInfoButton;
@synthesize myProductButton = _myProductButton;
@synthesize modifyUserImageButton = _modifyUserImageButton;
@synthesize userInfoScrollView = _userInfoScrollView;
@synthesize scrollContentView = _scrollContentView;
@synthesize modifyButton = _modifyButton;
@synthesize getMoneyButton = _getMoneyButton;
@synthesize getVipButton = _getVipButton;
@synthesize textField = _textField;


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
    
    [self _initBackGroundImage];
    [self _initBackButton];
    [self _initButton];
    [self _initModifyUserImage];
    [self _initUserScrollView];
    [self _initModifyGender];
    [self setUpForDismissKeyboard];
    
	// Do any additional setup after loading the view.
}

- (void) _initBackGroundImage
{
    _backGroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenHeight, ScreenWidth)];
    [_backGroundImage setImage:[UIImage imageNamed:@"Roomlist_BG.jpg"]];
    _backGroundImage.userInteractionEnabled = YES;
    [self.view addSubview:_backGroundImage];
    
    _UserInfoImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenHeight, ScreenWidth)];
    [_UserInfoImage setImage:[UIImage imageNamed:@"friend_backgroudImg.png"]];
    _UserInfoImage.userInteractionEnabled = YES;
    [self.view addSubview:_UserInfoImage];

}

- (void) _initBackButton
{
    
    _backButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenHeight - 40, 10, 30, 30)];
    [_backButton setImage:[UIImage imageNamed:@"friend_mainPageCloseBtn.png"] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
    
}
- (void) backAction:(UIButton *) button
{
    //    [_settingView storeData];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) _initButton
{
//    friend_tabBtnSelected.png
    _userInfoButton =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 35)];
    [_userInfoButton setCenter:CGPointMake(ScreenHeight/2 - _userInfoButton.width/2 -3, 25)];
    [_userInfoButton setImage:[UIImage imageNamed:@"friend_tabBtnSelected.png"] forState:UIControlStateNormal];
    [_userInfoButton.imageView.image setAccessibilityIdentifier:@"tabBtnSelected"];
    UILabel *title1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _userInfoButton.width, _userInfoButton.height)];
    [title1 setCenter:CGPointMake(_userInfoButton.width/2,_userInfoButton.height/2)];
    title1.textAlignment = NSTextAlignmentCenter;
    [title1 setTextColor:[UIColor whiteColor]];
    [title1 setText:@"个人信息"];
    [_userInfoButton addSubview:title1];
    [_userInfoButton addTarget:self action:@selector(userInfoAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_userInfoButton];
    
    _myProductButton =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 35)];
    [_myProductButton setCenter:CGPointMake(ScreenHeight/2 + _myProductButton.width/2 +3, 25)];
    [_myProductButton setImage:[UIImage imageNamed:@"friend_tabBtnNormal.png"] forState:UIControlStateNormal];
    [_myProductButton.imageView.image setAccessibilityIdentifier:@"tabBtnNormal"];
    UILabel *title2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _userInfoButton.width, _userInfoButton.height)];
    [title2 setCenter:CGPointMake(_userInfoButton.width/2,_userInfoButton.height/2)];
    title2.textAlignment = NSTextAlignmentCenter;
    [title2 setTextColor:[UIColor whiteColor]];
    [title2 setText:@"我的道具"];
    [_myProductButton addSubview:title2];
    [_myProductButton addTarget:self action:@selector(myProduckAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_myProductButton];
}
-(void)userInfoAction:(UIButton *)button
{
    if([button.imageView.image.accessibilityIdentifier isEqualToString:@"tabBtnNormal"])
    {
        [button setImage:[UIImage imageNamed:@"friend_tabBtnSelected.png"] forState:UIControlStateNormal];
        [button.imageView.image setAccessibilityIdentifier:@"tabBtnSelected"];
        [_myProductButton setImage:[UIImage imageNamed:@"friend_tabBtnNormal.png"] forState:UIControlStateNormal];
        [_myProductButton.imageView.image setAccessibilityIdentifier:@"tabBtnNormal"];
    }else{
        NSLog(@"%@",@"nothing happen");
    }
}
-(void)myProduckAction:(UIButton *)button
{
    if([button.imageView.image.accessibilityIdentifier isEqualToString:@"tabBtnNormal"])
    {
        [button setImage:[UIImage imageNamed:@"friend_tabBtnSelected.png"] forState:UIControlStateNormal];
        [button.imageView.image setAccessibilityIdentifier:@"tabBtnSelected"];
        [_userInfoButton setImage:[UIImage imageNamed:@"friend_tabBtnNormal.png"] forState:UIControlStateNormal];
        [_userInfoButton.imageView.image setAccessibilityIdentifier:@"tabBtnNormal"];
    }else{
        NSLog(@"%@",@"nothing happen");
    }

}

- (void)_initModifyUserImage
{
    
    _modifyUserImageButton = [[UIButton alloc]initWithFrame:CGRectMake(40, 90, 150, 160)];
    _modifyUserImageButton.layer.cornerRadius = 4.0;
    _modifyUserImageButton.layer.borderWidth = 1.0;
    _modifyUserImageButton.layer.borderColor = [UIColor colorWithRed:0/255.0 green:51/255.0 blue:102/255.0 alpha:1].CGColor;
    _modifyUserImageButton.layer.masksToBounds = YES;
    [_modifyUserImageButton setBackgroundColor:[UIColor clearColor]];
    [_modifyUserImageButton addTarget:self action:@selector(modifyUserImageAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *userImage = [[UIImageView alloc] initWithFrame:_modifyUserImageButton.frame];
    [userImage setImage:[UIImage imageNamed:@"male_head.jpg"]];
    [userImage setUserInteractionEnabled:YES];
    [self.view addSubview:userImage];
    
    UILabel *userlabel = [[UILabel alloc] initWithFrame:CGRectMake(_modifyUserImageButton.left,_modifyUserImageButton.bottom - 30, _modifyUserImageButton.width, 30)];
    [userlabel setTextColor:[UIColor whiteColor]];
    [userlabel setTextAlignment:NSTextAlignmentCenter];
    [userlabel setText:@"点击可修改头像"];
    [userlabel setBackgroundColor:[UIColor grayColor]];
    [userlabel setAlpha:0.5];
    [self.view  addSubview:userlabel];
    
    [self.view addSubview:_modifyUserImageButton];

}
- (void) modifyUserImageAction:(UIButton *)button
{
    NSLog(@"%@",@"我被点击了");
}


- (void) _initUserScrollView
{
    _userInfoScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(_modifyUserImageButton.right + 20, 60, 250, 240)];
    _userInfoScrollView.showsVerticalScrollIndicator = YES;
    _userInfoScrollView.alwaysBounceVertical = YES;
    _userInfoScrollView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    
    [self.view addSubview:_userInfoScrollView];
    
    _scrollContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _userInfoScrollView.width, 350)];
    [_userInfoScrollView setContentSize:CGSizeMake(_userInfoScrollView.width, _scrollContentView.height)];
    [_scrollContentView setBackgroundColor:[UIColor clearColor]];
    [self _initScrollContentView];
    [_userInfoScrollView addSubview:_scrollContentView];
    
//    _textFieldBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 140, 30)];
//    [_textFieldBackground setUserInteractionEnabled:YES];
//    [_textFieldBackground setImage:[UIImage imageNamed:@"pwTextFieldBackground.png"]];
//    [_scrollContentView addSubview:_textFieldBackground];
    
}

-(void)_initScrollContentView
{
    
    NSDictionary *userInfo = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserInfo"];
    
    UIImageView *moneyImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 60, 25, 25)];
    [moneyImage setImage:[UIImage imageNamed:@"user_chips.png"]];
    [_scrollContentView addSubview:moneyImage];
    
    UIImageView *vipImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, moneyImage.bottom + 8, 25, 25)];
    [vipImage setImage:[UIImage imageNamed:@"user_chips.png"]];
    [_scrollContentView addSubview:vipImage];
    
    UIImageView *levelImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, vipImage.bottom + 8, 25, 25)];
    [levelImage setImage:[UIImage imageNamed:@"friend_levelLogo.png"]];
    [_scrollContentView addSubview:levelImage];
    
    UIImageView *IDImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, levelImage.bottom + 8, 24, 24)];
    [IDImage setImage:[UIImage imageNamed:@"modifyInfoID.png"]];
    [_scrollContentView addSubview:IDImage];
    
    _userName = [[UILabel alloc] initWithFrame:CGRectMake(moneyImage.right+gapLenght, moneyImage.top - 30, 200, 25)];
    if([userInfo objectForKey:@"_userName"]){
        NSLog(@"myNAme:%@",[userInfo objectForKey:@"_userName"]);
        [_userName setText:[userInfo objectForKey:@"_userName"]];
    }
    [_scrollContentView addSubview:_userName];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:_userName.frame];
    [btn addTarget:self action:@selector(setNameAction:) forControlEvents:UIControlEventTouchDown];
    [_scrollContentView addSubview:btn];
    
    _userMoney = [[UILabel alloc] initWithFrame:CGRectMake(moneyImage.right+gapLenght, moneyImage.top, 100, 25)];
    [_userMoney setText:@"$16,234"];
    [_scrollContentView addSubview:_userMoney];
    
    _userVIP = [[UILabel alloc] initWithFrame:CGRectMake(vipImage.right+gapLenght, vipImage.top, 180, 25)];
    [_userVIP setText:@"您尚未获得VIP特权"];
    [_scrollContentView addSubview:_userVIP];
    
    _userLevel = [[UILabel alloc] initWithFrame:CGRectMake(levelImage.right+gapLenght, levelImage.top, 40, 25)];
    [_userLevel setText:@"LV.2"];
    [_scrollContentView addSubview:_userLevel];
    
    _userID = [[UILabel alloc] initWithFrame:CGRectMake(IDImage.right+gapLenght, IDImage.top, 100, 25)];
    [_userID setText:@"19325380"];
    [_scrollContentView addSubview:_userID];
    
    UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, _userID.bottom + 5, _scrollContentView.width - 10, 2)];
    [lineImage setImage:[UIImage imageNamed:@"separationLine.png"]];
    [_scrollContentView addSubview:lineImage];
    
    _victoryOrDefeat = [[UILabel alloc] initWithFrame:CGRectMake(50, lineImage.bottom +5, _scrollContentView.width - 70, 25)];
    [_victoryOrDefeat setTextAlignment:NSTextAlignmentLeft];
    [_victoryOrDefeat setText:@"胜       率:  21%"];
    [_scrollContentView addSubview:_victoryOrDefeat];
    
    _maxCard = [[UILabel alloc] initWithFrame:CGRectMake(50, _victoryOrDefeat.bottom + 5, _scrollContentView.width - 70, 25)];
    [_maxCard setTextAlignment:NSTextAlignmentLeft];
    [_maxCard setText:@"最大手牌: 同花顺"];
    [_scrollContentView addSubview:_maxCard];
    
    _maxWin = [[UILabel alloc] initWithFrame:CGRectMake(50, _maxCard.bottom + 5, _scrollContentView.width - 70, 25)];
    [_maxWin setTextAlignment:NSTextAlignmentLeft];
    [_maxWin setText:@"最大赢取: $2078"];
    [_scrollContentView addSubview:_maxWin];
    
    _Innings = [[UILabel alloc] initWithFrame:CGRectMake(50, _maxWin.bottom + 5, _scrollContentView.width - 70, 25)];
    [_Innings setTextAlignment:NSTextAlignmentLeft];
    [_Innings setText:@"已玩局数: 23"];
    [_scrollContentView addSubview:_Innings];
    
    _maxOwn = [[UILabel alloc] initWithFrame:CGRectMake(50, _Innings.bottom + 5, _scrollContentView.width - 70, 25)];
    [_maxOwn setTextAlignment:NSTextAlignmentLeft];
    [_maxOwn setText:@"最高拥有: $20781"];
    [_scrollContentView addSubview:_maxOwn];
    
    
}

- (void) _initModifyGender
{
    
     NSDictionary *userInfo = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserInfo"];
    _ifGenderOpen = NO;

    
    _genderView = [[UIImageView alloc] initWithFrame:CGRectMake(2, 32, 40, 20)];
    [_genderView setImage:[UIImage imageNamed:@"modifyInfoModifySexBGBtn.png"]];
    [_genderView setUserInteractionEnabled:YES];
    [_genderView setHidden:YES];
    [_scrollContentView addSubview:_genderView];
    
     _genderScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(_genderView.left, _genderView.bottom, _genderView.width, 0)];
    _genderScrollView.contentSize = CGSizeMake(_genderScrollView.width, 100);
    UIImageView *genderImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _genderScrollView.width, 100)];
    [genderImg setImage:[UIImage imageNamed:@"modifyInfoModifySexSelectBtn.png"]];
    [_genderScrollView addSubview:genderImg];
    [_scrollContentView addSubview:_genderScrollView];

    UIButton *gendetButton1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [gendetButton1 setCenter:CGPointMake(genderImg.width/2, 15)];
    [gendetButton1 setImage:[UIImage imageNamed:@"male_big.png"] forState:UIControlStateNormal];
    [gendetButton1 addTarget:self action:@selector(modifyGenderAction:) forControlEvents:UIControlEventTouchDown];
    gendetButton1.alpha = 1.0;
    gendetButton1.tag = 101;
    [_genderScrollView addSubview:gendetButton1];
    
    UIButton *gendetButton2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [gendetButton2 setCenter:CGPointMake(genderImg.width/2, gendetButton1.bottom + 25)];
    [gendetButton2 setImage:[UIImage imageNamed:@"female_big.png"] forState:UIControlStateNormal];
    [gendetButton2 addTarget:self action:@selector(modifyGenderAction:) forControlEvents:UIControlEventTouchDown];
    gendetButton2.tag = 102;
    [_genderScrollView addSubview:gendetButton2];
    
    UIButton *gendetButton3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
     [gendetButton3 setCenter:CGPointMake(genderImg.width/2, gendetButton2.bottom + 25)];
    [gendetButton3 setImage:[UIImage imageNamed:@"Secrecy_big.png"] forState:UIControlStateNormal];
    [gendetButton3 addTarget:self action:@selector(modifyGenderAction:) forControlEvents:UIControlEventTouchDown];
    gendetButton3.tag = 103;
    [_genderScrollView addSubview:gendetButton3];
    
    _gender = [[UIButton alloc] initWithFrame:CGRectMake(_genderView.left + 5, _genderView.top, 20, 20)];
    if([userInfo objectForKey:@"gender"]){
        NSLog(@"gender:%@",[userInfo objectForKey:@"gender"]);
        [_gender setImage:[UIImage imageNamed:[userInfo objectForKey:@"gender"]] forState:UIControlStateNormal];
    }
    [_gender setHighlighted:NO];
    _gender.tag = 1001;
    [_gender addTarget:self action:@selector(modifyGenderAction:) forControlEvents:UIControlEventTouchDown];
    [_scrollContentView addSubview:_gender];
    
    _arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(_genderView.left + 25, _genderView.top + 5, 10, 10)];
    [_arrowImage setImage:[UIImage imageNamed:@"modifyInfoModifySexBtn.png"]];
    _arrowImage.transform = CGAffineTransformMakeRotation(degreesToRadians(-90.0));
    [_arrowImage setHidden:YES];
    [_scrollContentView addSubview:_arrowImage];
    
  
}

- (void)modifyGenderAction:(UIButton *)button
{
    NSInteger soy = button.tag;
    [_textField removeFromSuperview];


    if(soy == 101)
    {
        [_gender setImage:[UIImage imageNamed:@"male_big.png"] forState:UIControlStateNormal];
        [_gender.imageView.image setAccessibilityIdentifier:@"male_big.png"];
        [self setNameSuccess];
        _ifGenderOpen = NO;
        [UIView animateWithDuration:0.5 animations:^{
            _genderScrollView.height = 0;
            _arrowImage.transform = CGAffineTransformMakeRotation(degreesToRadians(-90.0));
        }];
        [self performSelector:@selector(donghua) withObject:Nil afterDelay:0.5];
    }
    else if (soy == 102)
    {
        [_gender setImage:[UIImage imageNamed:@"female_big.png"] forState:UIControlStateNormal];
        [_gender.imageView.image setAccessibilityIdentifier:@"female_big.png"];
        [self setNameSuccess];
        _ifGenderOpen = NO;
        [UIView animateWithDuration:0.5 animations:^{
            _genderScrollView.height = 0;
            _arrowImage.transform = CGAffineTransformMakeRotation(degreesToRadians(-90.0));
        }];
        [self performSelector:@selector(donghua) withObject:Nil afterDelay:0.5];

    }
    else if(soy == 103)
    {
        [_gender setImage:[UIImage imageNamed:@"Secrecy_big.png"] forState:UIControlStateNormal];
        [_gender.imageView.image setAccessibilityIdentifier:@"Secrecy_big.png"];
        [self setNameSuccess];
        _ifGenderOpen = NO;
        [UIView animateWithDuration:0.5 animations:^{
            _genderScrollView.height = 0;
            _arrowImage.transform = CGAffineTransformMakeRotation(degreesToRadians(-90.0));
        }];
        [self performSelector:@selector(donghua) withObject:Nil afterDelay:0.5];
    }
    
    if(soy == 1001){
        if(!_ifGenderOpen){
            [_genderView setHidden:NO];
            [_arrowImage setHidden:NO];
            [UIView animateWithDuration:0.5 animations:^{
                _genderScrollView.height = 100;
                _arrowImage.transform = CGAffineTransformMakeRotation(degreesToRadians(0.0));

            }];
            _ifGenderOpen = YES;
            
           
        }
        else{
            [UIView animateWithDuration:0.5 animations:^{
                _genderScrollView.height = 0;
                _arrowImage.transform = CGAffineTransformMakeRotation(degreesToRadians(-90.0));
            }];
            _ifGenderOpen = NO;
            [self performSelector:@selector(donghua) withObject:Nil afterDelay:0.5];
          
        }
    }
    
    
}

- (void) donghua
{
    [_genderView setHidden:YES];
    [_arrowImage setHidden:YES];
}

- (void)setNameAction:(UIButton *)button
{
    [self _setUserName];
}

- (void)_setUserName
{
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(_userName.left - 7, _userName.top, _userName.width, _userName.height)];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.placeholder = @"输入不超过20个字符";
    _textField.font = [UIFont systemFontOfSize:17.0];
    _textField.clearButtonMode = UITextFieldViewModeAlways;
    _textField.text = _userName.text;
    _textField.returnKeyType =UIReturnKeyDone;
    _textField.keyboardType = UIKeyboardTypeDefault;
    _textField.delegate = self;
    [_scrollContentView addSubview:_textField];
    [_textField becomeFirstResponder];
    
    [_genderView setHidden:NO];
    [_arrowImage setHidden:NO];
}

- (void) setNameSuccess
{
    
    NSDictionary *settingData = [NSDictionary dictionaryWithObjectsAndKeys:
                                 _userName.text, @"_userName",
                                 _gender.imageView.image.accessibilityIdentifier, @"gender",
                                 nil];
    NSLog(@"%@",settingData);
    [[NSUserDefaults standardUserDefaults] setObject:settingData forKey:@"UserInfo"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    _userName.text = _textField.text;
    [self setNameSuccess];
    [textField resignFirstResponder];//主要是[receiver resignFirstResponder]在哪调用就能把receiver对应的键盘往下收
    [self donghua];
    [_textField removeFromSuperview];

    return YES;
}


//触摸背景隐藏键盘
- (void)setUpForDismissKeyboard {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    UITapGestureRecognizer *singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapAnywhereToDismissKeyboard:)];
    NSOperationQueue *mainQuene =[NSOperationQueue mainQueue];
    [nc addObserverForName:UIKeyboardWillShowNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [self.view addGestureRecognizer:singleTapGR];
                }];
    [nc addObserverForName:UIKeyboardWillHideNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [self.view removeGestureRecognizer:singleTapGR];
                }];
}
- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer {
    //此method会将self.view里所有的subview的first responder都resign掉
    [self setNameSuccess];
    [self donghua];
    [_textField removeFromSuperview];
    [self.view endEditing:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
