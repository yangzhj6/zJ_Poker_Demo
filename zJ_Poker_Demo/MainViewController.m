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


#define mainButtonWidth 130
#define mainButtonHeigh 38

@interface MainViewController ()

@end


@implementation MainViewController

@synthesize hallBackGroundImage = _hallBackGroundImage;
@synthesize gameSquareVC = _gameSquareVC;

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
    
    [self.view addSubview:_hallBackGroundImage];
    [self _initFirstPart];
    [self _initSquare];
	// Do any additional setup after loading the view.
}


- (void)_initFirstPart
{
    _firstPart = [[ProfileView alloc] initWithFrame:CGRectMake(15, 15, 295, 75)];
    [_firstPart setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:_firstPart];
}

-(void)_initSquare
{
    _quickStart = [[UIButton alloc] initWithFrame:CGRectMake(335, 95, mainButtonWidth, mainButtonHeigh)];
    [_quickStart setTitle:@"快速开始" forState:UIControlStateNormal];
    [_quickStart quickStart];
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
    
}

- (void) gameSquareAction:(UIButton *) button
{
    _gameSquareVC = [[GameSquareViewController alloc] init];
//    [self presentViewController:_gameSquareVC animated:YES completion:NULL];
    [self.navigationController pushViewController:_gameSquareVC animated:YES];
    
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
