//
//  EGOTableView.h
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-12.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"


@class EGOTableView;
@protocol UITableviewEventDelegate <NSObject>
@optional
//下拉
- (void)pullDown:(EGOTableView *)tableView;
//上拉
- (void)pullUp:(EGOTableView *)tableView;
// 选中一个cell
- (void)tableView:(EGOTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface EGOTableView : UITableView<EGORefreshTableHeaderDelegate, UITableViewDataSource, UITableViewDelegate> {
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL _reloading;
    UIButton *_moreButton;
}

@property(nonatomic,assign, setter = setRefreshNeeded:) BOOL isRefreshNeeded;   //是否需要下拉
@property(nonatomic,retain) NSArray *data;           //为tableview提供数据
@property(nonatomic,assign) id<UITableviewEventDelegate> eventDelegate;
@property(nonatomic,assign) BOOL isMore;    // 是否还有更多微博可加载
@property(nonatomic,assign) int moreDataCount;  // 更多的数据条数

- (void)doneLoadingTableViewData;
- (void)refreshData;

@end
