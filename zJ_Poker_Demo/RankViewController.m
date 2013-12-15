//
//  RankViewController.m
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-12.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "RankViewController.h"
#import "RankDetailViewController.h"

@interface RankViewController ()

@end

@implementation RankViewController

@synthesize backButton = _backButton;


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
    
    [self _initBackGround];
    [self _initBackButton];
    [self _initMainRankView];
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
    
    UIImageView *firstBackGroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(8, 48, 464, 264)];
    [firstBackGroundImage setImage:[UIImage imageNamed:@"第一层底.png"]];
    [self.view addSubview:firstBackGroundImage];
    
    _labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    [_labelTitle setCenter:CGPointMake(ScreenHeight/4, 17)];
    [_labelTitle setTextColor:[UIColor whiteColor]];
    [_labelTitle setText:@"排行榜"];
    _labelTitle.textAlignment = NSTextAlignmentCenter;
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
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)_initMainRankView
{
    UIView *rankView1 = [[UIView alloc] initWithFrame:CGRectMake(20, 90, 140, 190)];
    UIImageView *bgImg1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, rankView1.width, rankView1.height)];
    [bgImg1 setImage:[UIImage  imageNamed:@"第一层框.png"]];
    UIImageView *img1 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, rankView1.width - 20,rankView1.height - 80 )];
    [img1 setImage:[UIImage imageNamed:@"Rank_Logo_1.jpg"]];
    [rankView1 addSubview:bgImg1];
    [rankView1 addSubview:img1];
    [self.view addSubview:rankView1];
    
    UIView *rankView2 = [[UIView alloc] initWithFrame:CGRectMake(rankView1.right + 10, 90, 140, 190)];
    UIImageView *bgImg2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, rankView2.width, rankView2.height)];
    [bgImg2 setImage:[UIImage  imageNamed:@"第一层框.png"]];
    UIImageView *img2 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, rankView2.width - 20,rankView2.height - 80 )];
    [img2 setImage:[UIImage imageNamed:@"Rank_Logo_2.jpg"]];
    [rankView2 addSubview:bgImg2];
    [rankView2 addSubview:img2];
    [self.view addSubview:rankView2];
    
    UIView *rankView3 = [[UIView alloc] initWithFrame:CGRectMake(rankView2.right + 10, 90, 140, 190)];
    UIImageView *bgImg3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, rankView3.width, rankView3.height)];
    [bgImg3 setImage:[UIImage  imageNamed:@"第一层框.png"]];
    UIImageView *img3 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, rankView3.width - 20,rankView3.height - 80 )];
    [img3 setImage:[UIImage imageNamed:@"Rank_Logo_3.jpg"]];
    [rankView3 addSubview:bgImg3];
    [rankView3 addSubview:img3];
    [self.view addSubview:rankView3];
    
    UIButton * rankButton1 = [[UIButton alloc]initWithFrame:rankView1.frame];
    rankButton1.tag = 1001;
    [rankButton1 addTarget:self action:@selector(rankButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIButton * rankButton2 = [[UIButton alloc]initWithFrame:rankView2.frame];
    rankButton2.tag = 1002;
    [rankButton2 addTarget:self action:@selector(rankButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIButton * rankButton3 = [[UIButton alloc]initWithFrame:rankView3.frame];
    rankButton3.tag = 1003;
    [rankButton3 addTarget:self action:@selector(rankButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:rankButton1];
    [self.view addSubview:rankButton2];
    [self.view addSubview:rankButton3];
    
}

- (void)rankButtonAction:(UIButton *)button
{
    NSInteger soy = button.tag;
    RankDetailViewController *rankDetailViewController = [[RankDetailViewController alloc] init];

    if(soy  == 1001){
        [rankDetailViewController.labelTitle setText:@"今日赌王"];
    }
    else if(soy == 1002){
        [rankDetailViewController.labelTitle setText:@"最大赢取"];

    }else{
        [rankDetailViewController.labelTitle setText:@"总资产"];
    }
    [self.navigationController pushViewController:rankDetailViewController animated:YES];
    NSLog(@"rankDetailViewController.labelTitle.text:%@",rankDetailViewController.labelTitle.text);

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
