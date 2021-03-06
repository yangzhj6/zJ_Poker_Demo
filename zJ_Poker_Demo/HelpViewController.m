//
//  HelpViewController.m
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-10.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "HelpViewController.h"

@interface HelpViewController ()

@end

@implementation HelpViewController

@synthesize helpTableView = _helpTableView;

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
    
    _cellName = @[@"基本玩法",@"桌面指南",@"牌型比较",@"功能键介绍",@"常见问题",@"在线反馈"];
    
    [self _initBackGround];
    [self _initHelpTableView];
    [self _initBackButtonEXT];
	// Do any additional setup after loading the view.
}

- (void) _initBackGround
{
    
    [self _initBackGroundEXT];
    
    _labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    [_labelTitle setCenter:CGPointMake(ScreenHeight/2, 22.5)];
    [_labelTitle setTextColor:[UIColor whiteColor]];
    [_labelTitle setText:@"帮助导航"];
    _labelTitle.textAlignment = NSTextAlignmentCenter;
    [_labelTitle setFont:[UIFont systemFontOfSize:20.0]];
    [self.view addSubview:_labelTitle];

}


- (void) _initHelpTableView
{
    _helpTableView = [[UITableView alloc] initWithFrame:CGRectMake(15, 50, 450, ScreenWidth - 45 - 15)];
    _helpTableView.delegate = self;
    _helpTableView.dataSource = self;
    
    _helpTableView.backgroundColor = [UIColor whiteColor];
    _helpTableView.layer.masksToBounds = YES;
    _helpTableView.layer.cornerRadius = 5.0;
    
    _helpTableView.showsVerticalScrollIndicator=NO;
    
    [self.view addSubview:_helpTableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"HelpTableViewCell";
    HelpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell){
        cell = [[HelpTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell.cellName setText:[_cellName objectAtIndex:indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TestViewController *helpScrollView = [[TestViewController alloc] init];
    NSInteger soy = indexPath.row;
    if(soy >= 2){
        helpScrollView.offest_x = soy + 2;
    }
    else{
        helpScrollView.offest_x = soy;
    }
    if(soy <5){
        [self.navigationController pushViewController:helpScrollView animated:YES];
    }
    
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
