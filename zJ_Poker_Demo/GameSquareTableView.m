//
//  GameSquareTableView.m
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-6.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "GameSquareTableView.h"
#import "GameSquareTableViewCell.h"

@implementation GameSquareTableView

@synthesize data = _data;
@synthesize wocao = _wocao;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self _initTableView];
    }
    return self;
}

- (void) _initTableView
{
    self.backgroundColor = [UIColor clearColor];
    self.dataSource = self;
    self.delegate= self;
    [self setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self _setData];
    
}

- (void) setWocao:(int)wocao{
    if (_wocao != wocao) {
        _wocao = wocao;
    }
}

- (void) _setData
{
    NSArray *xsc = @[@"0090",@"/ 新手乐园",@"1",@"/ 2",@"20",@"/ 400",@"2/5"];
    NSArray *cjc = @[@"1234",@"/ 丰衣足食",@"10",@"/ 20",@"200",@"/ 4K",@"2/8"];
    NSArray *zjc = @[@"12345",@"/ 富甲一方",@"500",@"/ 1K",@"10K",@"/ 400K",@"2/9"];
    NSArray *gjc = @[@"51421",@"/ 皇家神殿",@"250K",@"/ 500K",@"100M",@"/ 200M",@"2/10"];
    
    NSArray *data1 = @[xsc,cjc,zjc,gjc];
    NSArray *data2 = @[cjc,zjc,gjc,xsc];
    NSArray *data3 = @[zjc,gjc,xsc,cjc];
    NSArray *data4 = @[gjc,xsc,cjc,zjc];

//    _data = @[xsc,cjc,zjc,gjc];
    _data = @[data1,data2,data3,data4];
    
    self.wocao = 1;
}

#pragma mark - UITableView delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *identify = @"GameSquareCell";
    GameSquareTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identify];
    
    if (cell == nil) {
        cell = [[GameSquareTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    cell.data = _data[self.wocao];
    
    return cell;
    
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    if ([self.eventDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
//        [self.eventDelegate tableView:self didSelectRowAtIndexPath:indexPath];
//    }
//    
//    // 选中cell后立即取消选中
//    [self deselectRowAtIndexPath:indexPath animated:NO];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
