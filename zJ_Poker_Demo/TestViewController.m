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
@synthesize offest_x = _offest_x;


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
    
    [self _initBackGroundEXT];
    [self _initScrollView];
    [self _initBackButtonEXT];
    [self _initLabelTitle];
    [self _setBarTitle];
    [self _setContentOffestX];

//    NSLog(@"%f",_scrollView.contentOffset.x);

}


- (void) _initLabelTitle
{
    _labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    [_labelTitle setCenter:CGPointMake(ScreenHeight/2, 22.5)];
    [_labelTitle setTextColor:[UIColor whiteColor]];
    _labelTitle.textAlignment = NSTextAlignmentCenter;
    [_labelTitle setFont:[UIFont systemFontOfSize:20.0]];
    [self.view addSubview:_labelTitle];
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
    [self.view addSubview:_scrollView];
    
    for(int i =0;i<7;i++){
        UIImageView *subView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenHeight * i, 0, ScreenHeight, ScreenWidth)];
        NSString *imaName = [[NSString alloc] initWithString:[NSString stringWithFormat:@"help%d.png",i]];
        [subView setImage:[UIImage imageNamed:imaName]];
        [_scrollView addSubview:subView];
    }
    
}

- (void) _setBarTitle
{
    NSLog(@"%f",_scrollView.contentOffset.x);

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
