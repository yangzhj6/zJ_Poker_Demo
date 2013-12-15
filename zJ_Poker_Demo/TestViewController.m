//
//  TestViewController.m
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-10.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

#define SubViewNumber 7

@synthesize scrollView = _scrollView;
@synthesize labelTitle = _labelTitle;
@synthesize backButton = _backButton;
@synthesize offest_x = _offest_x;

@synthesize subView0 = _subView0;
@synthesize subView1 = _subView1;
@synthesize subView2 = _subView2;
@synthesize subView3 = _subView3;
@synthesize subView4 = _subView4;
@synthesize subView5 = _subView5;
@synthesize subView6 = _subView6;


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
    
    _titleArray = @[@"基本玩法",@"桌面指南1/3",@"桌面指南2/3",@"桌面指南3/3",@"牌型比较",@"功能键介绍",@"常见问题"];
    
    [self _initBackGround];
    [self _initScrollView];
    [self _initTitleBar];
    [self _initBackButton];
    [self _initLabelTitle];
    [self _setBarTitle];
    [self _setContentOffestX];
    
    

}

- (void) _initBackGround
{
    
    _backGroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenHeight, ScreenWidth)];
    [_backGroundImage setImage:[UIImage imageNamed:@"二级页面_底.jpg"]];
    [_backGroundImage setUserInteractionEnabled:YES];
    [self.view addSubview:_backGroundImage];
    
}


- (void) _initTitleBar
{
    _titleBarImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenHeight, 45)];
    [_titleBarImage setImage:[UIImage imageNamed:@"二级页面_标题.png"]];
    [_titleBarImage setUserInteractionEnabled:YES];
    [self.view addSubview:_titleBarImage];

}

- (void) _initLabelTitle
{
    _labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    [_labelTitle setCenter:CGPointMake(ScreenHeight/2, 22.5)];
    [_labelTitle setTextColor:[UIColor whiteColor]];
    _labelTitle.textAlignment = UITextAlignmentCenter;
    [_labelTitle setFont:[UIFont systemFontOfSize:20.0]];
    [self.view addSubview:_labelTitle];
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
    //    [_settingView storeData];
    [self.navigationController popViewControllerAnimated:YES];
}


- (void) _initScrollView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenHeight, ScreenWidth)];
    _scrollView.contentSize = CGSizeMake(ScreenHeight * SubViewNumber, ScreenWidth);
    _scrollView.pagingEnabled=YES;
    _scrollView.bounces=NO;
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.alwaysBounceHorizontal=YES;
    
    
    _subView0 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenHeight * 0,0,ScreenHeight, ScreenWidth)];
    [_subView0 setImage:[UIImage imageNamed:@"help0.png"]];
    
    _subView1 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenHeight * 1,0,ScreenHeight, ScreenWidth)];
    [_subView1 setImage:[UIImage imageNamed:@"help1.png"]];
    
    _subView2 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenHeight * 2,0 , ScreenHeight, ScreenWidth)];
    [_subView2 setImage:[UIImage imageNamed:@"help2.png"]];

    _subView3 = [[UIImageView alloc]initWithFrame:CGRectMake( ScreenHeight * 3,0,ScreenHeight, ScreenWidth)];
    [_subView3 setImage:[UIImage imageNamed:@"help3.png"]];

    _subView4 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenHeight * 4,0,ScreenHeight, ScreenWidth)];
    [_subView4 setImage:[UIImage imageNamed:@"help4.png"]];

    _subView5 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenHeight * 5,0 , ScreenHeight, ScreenWidth)];
    [_subView5 setImage:[UIImage imageNamed:@"help5.png"]];

    _subView6 = [[UIImageView alloc]initWithFrame:CGRectMake( ScreenHeight *6,0,ScreenHeight, ScreenWidth)];
    [_subView6 setImage:[UIImage imageNamed:@"help6.png"]];

    
    [_scrollView addSubview:_subView0];
    [_scrollView addSubview:_subView1];
    [_scrollView addSubview:_subView2];
    [_scrollView addSubview:_subView3];
    [_scrollView addSubview:_subView4];
    [_scrollView addSubview:_subView5];
    [_scrollView addSubview:_subView6];
    
    
    
    [self.view addSubview:_scrollView];
}

- (void) _setBarTitle
{
    [_labelTitle setText:[_titleArray objectAtIndex:_offest_x]];
}

- (void) _setContentOffestX
{
    [_scrollView setContentOffset:CGPointMake(_offest_x * ScreenHeight, 0)];
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    float offset = scrollView.contentOffset.x;
    _offest_x = offset / ScreenHeight;
    [self _setBarTitle];
}     // called when scroll view grinds to a halt



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
