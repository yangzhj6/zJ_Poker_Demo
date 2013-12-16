//
//  GameSquareViewController.m
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-5.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "GameSquareViewController.h"

@interface GameSquareViewController ()

@end

@implementation GameSquareViewController

@synthesize mainGameSqure = _mainGameSqure;
@synthesize backButton = _backButton;
@synthesize settingButton = _settingButton;
@synthesize selectBar = _selectBar;
@synthesize GameSquareTableView = _GameSquareTableView;
@synthesize settingView = _settingView;

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
    
    [self _initBackground];
    [self _initSelectBar];
    [self _initTableView];
    [self _initGrayImage];
    [self _initSettingView];
    [self _initTitle];
    
    [self _initBackButton];
    [self _initSettingButton];

    
	// Do any additional setup after loading the view.
}

-(void) _initTitle
{
    _name = [[UILabel alloc] initWithFrame:CGRectMake(200, 0, 100, 30)];
    [_name setText:@"游戏大厅"];
    [_name setTextColor:[UIColor whiteColor]];
    [_name setTextAlignment:NSTextAlignmentCenter];
    [_name setFont:[UIFont systemFontOfSize:25]];
    [self.view addSubview:_name];
    UIButton *titleButton = [[UIButton alloc] initWithFrame:_name.frame];
    [titleButton addTarget:self action:@selector(titleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:titleButton];
}
- (void)titleButtonAction:(UIButton *)button
{
    NSLog(@"%@",@"titleButton被按了");
}


- (void) _initBackground
{
    
    _backGroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 480, 320)];
    [_backGroundImage setImage:[UIImage imageNamed:@"Roomlist_BG.jpg"]];
    _backGroundImage.userInteractionEnabled = YES;
    [self.view addSubview:_backGroundImage];
    
    
    _mainGameSqure = [[UIImageView alloc] initWithFrame:CGRectMake(5, 35, 470, 230)];
    [_mainGameSqure setImage:[UIImage imageNamed:@"Roomlist_backgroundBox_game.png"]];
    _mainGameSqure.userInteractionEnabled = YES;
    [self.view addSubview:_mainGameSqure];
    
}

- (void) _initGrayImage
{
    _grayImage = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, ScreenHeight, ScreenWidth)];
    _grayImage.backgroundColor = [UIColor blackColor];
    _grayImage.alpha = 0.5;
    [_grayImage addTarget:self action:@selector(settingAction:) forControlEvents:UIControlEventTouchDown];
}


- (void) _initBackButton
{
    
    _backButton = [[UIButton alloc] initWithFrame:CGRectMake(3, 5, 40, 25)];
    [_backButton setImage:[UIImage imageNamed:@"Roomlist_backBtn.png"] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];

}
- (void) backAction:(UIButton *) button
{
//    [_settingView storeData];
    [self.navigationController popViewControllerAnimated:YES];
}


- (void) _initSettingButton
{
    _settingButton = [[UIButton alloc] initWithFrame:CGRectMake(450, 5, 25, 25)];
    [_settingButton setImage:[UIImage imageNamed:@"房间列表_设置按钮.png"] forState:UIControlStateNormal];
    [_settingButton addTarget:self action:@selector(settingAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_settingButton];
}
-(void) settingAction:(UIButton *) button
{
    
    if(_settingView.top < 0){
        [self.view addSubview:_grayImage];
        [self.view bringSubviewToFront:_settingView];
        [self.view bringSubviewToFront:_settingButton];
        [UIView animateWithDuration:0.25 animations:^{
            _settingView.top = 30;
        }];
    }
    else{
        [_grayImage removeFromSuperview];
        [_settingView storeData];
        [UIView animateWithDuration:0.25 animations:^{
            _settingView.top = -170;
        }];
    }
}

- (void) _initSettingView
{
    _settingView = [[SettingView alloc] initWithFrame:CGRectMake(480 - 218, -170 , 218, 156)];
    [self.view addSubview:_settingView];
}

- (void) _initSelectBar
{
    _selectBar = [[GameSquareSearchBarView alloc] initWithFrame:CGRectMake(0, 275, 470, 40)];
    _selectBar.firstTouchBlock = ^{
        self.GameSquareTableView.wocao = 0;
        [self.GameSquareTableView reloadData];
    };
    _selectBar.secondTouchBlock = ^{
        self.GameSquareTableView.wocao = 1;
        [self.GameSquareTableView reloadData];
    };
    _selectBar.thirdTouchBlock = ^{
        self.GameSquareTableView.wocao = 2;
        [self.GameSquareTableView reloadData];
    };
    _selectBar.fourthTouchBlock = ^{
        self.GameSquareTableView.wocao = 3;
        [self.GameSquareTableView reloadData];
    };
    
    [self.view addSubview:_selectBar];
}

- (void) _initTableView
{

    _GameSquareTableView = [[GameSquareTableView alloc] initWithFrame:CGRectMake(6, 35+30, 468, 200)];
    [self.view addSubview:_GameSquareTableView];
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
