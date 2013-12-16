//
//  ShoppingViewController.m
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-9.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "ShoppingViewController.h"

@interface ShoppingViewController ()

@end

@implementation ShoppingViewController

@synthesize backButton = _backButton;
@synthesize shoppingMallViewImage = _shoppingMallViewImage;
@synthesize shoppingMallTableView = _shoppingMallTableView;

@synthesize newshoppingMallTableView = _newshoppingMallTableView;

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
    [self _initTableView];
	// Do any additional setup after loading the view.
}


- (void)_initBackGroundImage
{
    _backGroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenHeight, ScreenWidth)];
    [_backGroundImage setImage:[UIImage imageNamed:@"Roomlist_BG.jpg"]];
    _backGroundImage.userInteractionEnabled = YES;
    [self.view addSubview:_backGroundImage];
    
    _shoppingMallViewImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenHeight, ScreenWidth)];
    [_shoppingMallViewImage setImage:[UIImage imageNamed:@"friend_backgroudImg.png"]];
    _shoppingMallViewImage.userInteractionEnabled = YES;
    [self.view addSubview:_shoppingMallViewImage];
    
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

-(void) _initTableView
{
    _shoppingMallTableView = [[shoppingMallTableView alloc] initWithFrame:CGRectMake(4, 47, ScreenHeight - 8,ScreenWidth - 50)];
    [self.view addSubview:_shoppingMallTableView];
    
//    _newshoppingMallTableView = [[NewShoppingMallTableView alloc] initWithFrame:CGRectMake(4, 47, ScreenHeight - 8,ScreenWidth - 50)];
//    [self.view addSubview:_newshoppingMallTableView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
