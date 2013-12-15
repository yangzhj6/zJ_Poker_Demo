//
//  EGOTableView.m
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-12.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "EGOTableView.h"

@implementation EGOTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        [self _initView];
    }
    return self;
}

// 如果使用xib创建视图，就不会调用initWithFrame方法，而会调用awakeFromNib
- (void)awakeFromNib {
    [self _initView];
}

- (void)_initView {
    _refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.bounds.size.height, self.frame.size.width, self.bounds.size.height)];
    _refreshHeaderView.delegate = self;
    _refreshHeaderView.backgroundColor = [UIColor clearColor];
    
    self.dataSource = self;
    self.delegate= self;
    self.isRefreshNeeded = YES;
    
    _moreButton = [UIButton buttonWithType:UIButtonTypeCustom] ;
    _moreButton.backgroundColor = [UIColor clearColor];
    _moreButton.frame = CGRectMake(0, 0, ScreenWidth, 40);
    _moreButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [_moreButton setTitle:@"上拉加载更多..." forState:UIControlStateNormal];
    [_moreButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_moreButton addTarget:self action:@selector(loadMoreAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityView.tag = 2013;
    activityView.frame = CGRectMake(100, 10, 20, 20);
    [activityView stopAnimating];
    [_moreButton addSubview:activityView];
    
    self.tableFooterView = _moreButton;
}

- (void)_startLoadMore {
    [_moreButton setTitle:@"正在加载..." forState:UIControlStateNormal];
    // 正在加载时，应将按钮禁用
    _moreButton.enabled = NO;
    UIActivityIndicatorView *activityView = (UIActivityIndicatorView *)[_moreButton viewWithTag:2013];
    [activityView startAnimating];
}

- (void)_stopLoadMore {
    NSLog(@"moreDataCount: %d", self.moreDataCount);
    if (self.moreDataCount >= 20) {
        [_moreButton setTitle:@"上拉加载更多..." forState:UIControlStateNormal];
        UIActivityIndicatorView *activityView = (UIActivityIndicatorView *)[_moreButton viewWithTag:2013];
        [activityView stopAnimating];
        _moreButton.hidden = NO;
        // 结束加载时，应将按钮可用
        _moreButton.enabled = YES;
    } else { // 如果没有数据可供加载，则隐藏按钮
        _moreButton.hidden = YES;
    }
}

#pragma mark - action
- (void)loadMoreAction {
    if ([self.eventDelegate respondsToSelector:@selector(pullUp:)]) {
        [self.eventDelegate pullUp:self];
        [self _startLoadMore];
    }
}

- (void)setRefreshNeeded:(BOOL)isRefreshNeeded {
    _isRefreshNeeded = isRefreshNeeded;
    
    if (_isRefreshNeeded) {
        [self addSubview:_refreshHeaderView];
    } else {
        if (_refreshHeaderView.superview) {
            [_refreshHeaderView removeFromSuperview];
        }
    }
}

- (void)refreshData {
    [_refreshHeaderView initLoading:self];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    return cell;
}

- (void)reloadData {
    [super reloadData];
    [self _stopLoadMore];
}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods
- (void)reloadTableViewDataSource{
	_reloading = YES;
	
}

- (void)doneLoadingTableViewData{
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self];
}


#pragma mark -
#pragma mark UIScrollViewDelegate Methods
// 当滑动时，实时调用此方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
}

// 手指停止拖拽时调用
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	
	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
	
    /*
     * 滑动加载
     */
    float offset = scrollView.contentOffset.y;
    float contentHeight = scrollView.contentSize.height;
    
    //    NSLog(@"偏移量y: %f", offset);
    //    NSLog(@"content高度: %f", contentHeight);
    
    // 当offset偏移量滑到底部时，差值是scrollView的高度
    float sub = contentHeight - offset;
    if (scrollView.height - sub > 30) {
        [self _startLoadMore];
        
        if ([self.eventDelegate respondsToSelector:@selector(pullUp:)]) {
            [self.eventDelegate pullUp:self];
        }
    }
}


#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods
//下拉到一定距离，手指放开时调用
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	
	[self reloadTableViewDataSource];
    
    //停止加载，弹回下拉
    //	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
    
    // 判断协议方法是否被实现
    if ([self.eventDelegate respondsToSelector:@selector(pullDown:)]) {
        [self.eventDelegate pullDown:self];
    }
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	
	return _reloading; // should return if data source model is reloading
	
}

//取得下拉刷新的时间
- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}

@end
