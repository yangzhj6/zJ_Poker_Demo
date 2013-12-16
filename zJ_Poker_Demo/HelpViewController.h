//
//  HelpViewController.h
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-10.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "BaseViewController.h"
#import "HelpTableViewCell.h"
#import "TestViewController.h"


@interface HelpViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_cellName;
    UILabel *_labelTitle;
}
@property (strong,nonatomic) UITableView *helpTableView;

@end
