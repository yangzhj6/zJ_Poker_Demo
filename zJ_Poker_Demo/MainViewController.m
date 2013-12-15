//
//  MainViewController.m
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-4.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "MainViewController.h"
#import "UIButton+UIButtonExt.h"
#import "GameSquareViewController.h"
#import "BaseNavigationController.h"
#import "RankViewController.h"


#define mainButtonWidth 130
#define mainButtonHeigh 38

@interface MainViewController ()

@end


@implementation MainViewController

@synthesize hallBackGroundImage = _hallBackGroundImage;
@synthesize gameSquareVC = _gameSquareVC;
@synthesize shoppingMallView = _shoppingMallView;
@synthesize selfInfoImage = _selfInfoImage;
@synthesize showUserInfo = _showUserInfo;
@synthesize userID = _userID;
@synthesize victoryOrDefeat = _victoryOrDefeat;
@synthesize maxCard = _maxCard;
@synthesize maxWin = _maxWin;
@synthesize messageView = _messageView;


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
    
    _hallBackGroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 480, 320)];
    [_hallBackGroundImage setImage:[UIImage imageNamed:@"HallBG_iphone5.jpg"]];
    _hallBackGroundImage.backgroundColor = [UIColor clearColor];
    _selfInfoImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 315, 225)];
    [_selfInfoImage setImage:[UIImage imageNamed:@"cnHall_selfInfoBack.png"]];
    [self.view addSubview:_hallBackGroundImage];
    [self.view addSubview:_selfInfoImage];
    
    
    _GameName = [[UIImageView alloc] initWithFrame:CGRectMake(335, 15, 130, 25)];
    [_GameName setImage:[UIImage imageNamed:@"cnHallLogo.png"]];
    [self.view addSubview:_GameName];
    
    
    [self _initFirstPart];
    [self _initShowUserInfo];
    [self _initMessageView];
    [self _initSquare];
	// Do any additional setup after loading the view.
}


- (void)_initFirstPart
{
    _firstPart = [[ProfileView alloc] initWithFrame:CGRectMake(15, 15, 295, 75)];
    [self.view addSubview:_firstPart];
}

- (void) _initMessageView
{
    _messageView = [[MessageView alloc] initWithFrame:CGRectMake(5, 98, 315, 135)];
//    [_messageView setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:_messageView];
}

- (void)_initShowUserInfo
{
    _showUserInfo = [[UIView alloc] initWithFrame:CGRectMake(_firstPart.left, _firstPart.bottom + 15, _firstPart.width, _selfInfoImage.height - _firstPart.height - 30)];
    [_showUserInfo setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_showUserInfo];
    
    _userID = [[UILabel alloc] initWithFrame:CGRectMake(5, 1, _showUserInfo.width - 20, 25)];
    [_userID setBackgroundColor:[UIColor clearColor]];
    [_userID setText:@"ID: 19325380"];
    [_userID setTextColor:[UIColor colorWithRed:204/255.0 green:204/255.0 blue:255/255.0 alpha:1]];
    [_showUserInfo addSubview:_userID];
    
    _victoryOrDefeat = [[UILabel alloc] initWithFrame:CGRectMake(5, _userID.bottom +5, _showUserInfo.width - 20, 25)];
    [_victoryOrDefeat setBackgroundColor:[UIColor clearColor]];
    [_victoryOrDefeat setText:@"胜       负:  4 胜 150 负"];
    [_victoryOrDefeat setTextColor:[UIColor colorWithRed:204/255.0 green:204/255.0 blue:255/255.0 alpha:1]];
    [_showUserInfo addSubview:_victoryOrDefeat];
    
    _maxCard = [[UILabel alloc] initWithFrame:CGRectMake(5, _victoryOrDefeat.bottom + 5, _showUserInfo.width - 20, 25)];
    [_maxCard setBackgroundColor:[UIColor clearColor]];
    [_maxCard setText:@"最大手牌: 同花顺= ="];
    [_maxCard setTextColor:[UIColor colorWithRed:204/255.0 green:204/255.0 blue:255/255.0 alpha:1]];
    [_showUserInfo addSubview:_maxCard];
    
    _maxWin = [[UILabel alloc] initWithFrame:CGRectMake(5, _maxCard.bottom + 5, _showUserInfo.width - 20, 25)];
    [_maxWin setBackgroundColor:[UIColor clearColor]];
    [_maxWin setText:@"最大赢取: $2078"];
    [_maxWin setTextColor:[UIColor colorWithRed:204/255.0 green:204/255.0 blue:255/255.0 alpha:1]];
    [_showUserInfo addSubview:_maxWin];
    
}

-(void)_initSquare
{
    _quickStart = [[UIButton alloc] initWithFrame:CGRectMake(335, 95, mainButtonWidth, mainButtonHeigh)];
    [_quickStart setTitle:@"快速开始" forState:UIControlStateNormal];
    [_quickStart quickStart];
    [_quickStart addTarget:self action:@selector(testAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_quickStart];
    
    _gameSquare = [[UIButton alloc] initWithFrame:CGRectMake(335, _quickStart.bottom + 7, mainButtonWidth, mainButtonHeigh)];
    [_gameSquare setTitle:@"游戏场" forState:UIControlStateNormal];
    [_gameSquare squareGame];
    [_gameSquare addTarget:self action:@selector(gameSquareAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_gameSquare];
    
    _PKSquare = [[UIButton alloc] initWithFrame:CGRectMake(335, _gameSquare.bottom + 7, mainButtonWidth, mainButtonHeigh)];
    [_PKSquare setTitle:@"淘汰场" forState:UIControlStateNormal];
    [_PKSquare squareGame];
    [self.view addSubview:_PKSquare];
    
    _beginStudy = [[UIButton alloc] initWithFrame:CGRectMake(335, _PKSquare.bottom + 18, mainButtonWidth, 30)];
    [_beginStudy setTitle:@"开始教学" forState:UIControlStateNormal];
    [_beginStudy beginStudy];
    [self.view addSubview:_beginStudy];
    
    _help = [[UIButton alloc] initWithFrame:CGRectMake(335, _beginStudy.bottom + 10, mainButtonWidth/3, 20)];
    [_help setTitle:@"帮助" forState:UIControlStateNormal];
    [_help help];
    [_help addTarget:self action:@selector(helpAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_help];
    
    _shoppingMall = [[UIButton alloc] initWithFrame:CGRectMake(15, 243, 94, 60)];
    [_shoppingMall setBackgroundImage:[UIImage imageNamed:@"cnHallShopBtn.png"] forState:UIControlStateNormal];
    [_shoppingMall addTarget:self action:@selector(shoppingAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_shoppingMall];
    
    _activityButton = [[UIButton alloc] initWithFrame:CGRectMake(_shoppingMall.right + 30, _shoppingMall.top, 50, 50)];
    [_activityButton setImage:[UIImage imageNamed:@"cnHallActBtn.png"] forState:UIControlStateNormal];
    [_activityButton addTarget:self action:@selector(activityAction:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *activityLabel = [[UILabel alloc] initWithFrame:CGRectMake(_activityButton.left, _activityButton.bottom - 10, 45, 25)];
    [activityLabel setText:@"活动"];
    [activityLabel setTextAlignment:NSTextAlignmentCenter];
    [activityLabel setTextColor:[UIColor whiteColor]];
    [activityLabel setFont:[UIFont systemFontOfSize:15.0]];
    [self.view addSubview:activityLabel];
    [self.view addSubview:_activityButton];
    
    _rangkButton = [[UIButton alloc] initWithFrame:CGRectMake(_shoppingMall.right + 150, _shoppingMall.top, 50, 50)];
    [_rangkButton setImage:[UIImage imageNamed:@"cnHallActBtn.png"] forState:UIControlStateNormal];
    [_rangkButton addTarget:self action:@selector(rankAction:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *rankLabel = [[UILabel alloc] initWithFrame:CGRectMake(_rangkButton.left, _rangkButton.bottom - 10, 45, 25)];
    [rankLabel setText:@"排行榜"];
    [rankLabel setTextAlignment:NSTextAlignmentCenter];
    [rankLabel setTextColor:[UIColor whiteColor]];
    [rankLabel setFont:[UIFont systemFontOfSize:15.0]];
    [self.view addSubview:rankLabel];
    [self.view addSubview:_rangkButton];
}

#pragma mark ButtonAction

- (void) shoppingAction:(UIButton *)button
{
    _shoppingMallView = [[ShoppingViewController alloc] init];
    [self.navigationController pushViewController:_shoppingMallView animated:YES];
}

- (void) gameSquareAction:(UIButton *) button
{
    _gameSquareVC = [[GameSquareViewController alloc] init];
    [self.navigationController pushViewController:_gameSquareVC animated:YES];
    
}

- (void) helpAction:(UIButton *) button
{
    HelpViewController *helpViewController = [[HelpViewController alloc] init];
    [self.navigationController pushViewController:helpViewController animated:YES];
}

- (void) activityAction:(UIButton *) button
{
    ActivityViewController *activityViewController = [[ActivityViewController alloc] init];
    [self.navigationController pushViewController:activityViewController animated:YES];
}

- (void) rankAction:(UIButton *)button
{
    RankViewController *rankViewController = [[RankViewController alloc] init];
    [self.navigationController pushViewController:rankViewController animated:YES];
}

- (void) testAction:(UIButton *)button
{
//    PullDownViewController *testViewController = [[PullDownViewController alloc] init];
//    [self.navigationController pushViewController:testViewController animated:YES];

}


#pragma mark 屏幕旋转
- (BOOL)shouldAutorotate
{
    return YES;
}
- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
