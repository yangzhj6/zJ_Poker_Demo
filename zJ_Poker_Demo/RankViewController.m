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
    [self _initBackButtonEXT];
    [self _initMainRankView];
	// Do any additional setup after loading the view.
}
- (void) _initBackGround
{
    [self _initBackGroundEXT];
    
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

- (void)_initMainRankView
{
    
    for (int i = 0; i< 3; i++) {
        UIView *rankView = [[UIView alloc] initWithFrame:CGRectMake(20 + i*150, 90, 140, 190)];
        UIImageView *bgImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, rankView.width, rankView.height)];
        
        [bgImg setImage:[UIImage  imageNamed:@"第一层框.png"]];
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, rankView.width - 20,rankView.height - 80 )];
        NSString *imaName = [[NSString alloc] initWithString:[NSString stringWithFormat:@"Rank_Logo_%d.jpg",i+1]];
        [img setImage:[UIImage imageNamed:imaName]];
        
        [rankView addSubview:bgImg];
        [rankView addSubview:img];
        [self.view addSubview:rankView];
        
        UIButton * rankButton = [[UIButton alloc]initWithFrame:rankView.frame];
        rankButton.tag = 1001 + i;
        [rankButton addTarget:self action:@selector(rankButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:rankButton];
    }
    
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
