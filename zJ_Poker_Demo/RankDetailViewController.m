//
//  RankDetailViewController.m
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-12.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "RankDetailViewController.h"

@interface RankDetailViewController ()

@end

@implementation RankDetailViewController

@synthesize labelTitle = _labelTitle;
@synthesize rankTableView = _rankTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self _initViewTitle];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self _initBackGround];
    [self _initBackButtonEXT];
    [self _initRankTableView];
    
	// Do any additional setup after loading the view.
}

- (void) _initBackGround
{
    [self _initBackGroundEXT];
    _firstBackGroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(8, 48, 464, 264)];
    [_firstBackGroundImage setImage:[UIImage imageNamed:@"第二层框.png"]];
    [self.view addSubview:_firstBackGroundImage];
    
}

- (void)_initViewTitle{
    _labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    [_labelTitle setCenter:CGPointMake(ScreenHeight/4, 17)];
    [_labelTitle setTextColor:[UIColor whiteColor]];
    _labelTitle.textAlignment = NSTextAlignmentCenter;
    [_labelTitle setFont:[UIFont systemFontOfSize:20.0]];
    [self.view addSubview:_labelTitle];
}


- (void) _initRankTableView
{
    _rankTableView = [[RankTableView alloc] initWithFrame:CGRectMake(_firstBackGroundImage.left + 10, _firstBackGroundImage.top + 10, _firstBackGroundImage.width - 20, _firstBackGroundImage.height - 20)];
    _rankTableView.layer.cornerRadius = 4.0;
    _rankTableView.layer.masksToBounds = YES;
    [self.view addSubview:_rankTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
