//
//  NewShoppingMallTableView.m
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-16.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "NewShoppingMallTableView.h"
#import "shoppingMallCell.h"

@implementation NewShoppingMallTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _selected = -1;
        _nextSelected = -1;
        
    }
    return self;
}

#pragma mark TableView delegate
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"shoppingMallCell";
    shoppingMallCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[shoppingMallCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if(indexPath.section == _selected){
//        return 80;
//    }
//    return 0;
    return 50;
    
}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 60;
//}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//    UIView *customCell = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenHeight, 50)];
//    //    [customCell setBackgroundColor:[UIColor colorWithRed:255/255.0 green:229/255.0 blue:204/255.0 alpha:1]];
//    
//    UIImageView *logo = [[UIImageView alloc] initWithFrame:CGRectMake(30, 5, 40, 40)];
//    [logo setImage:[UIImage imageNamed:@"cnHallActBtn.png"]];
//    [customCell addSubview:logo];
//    
//    UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 59, ScreenHeight, 1)];
//    [lineImage setBackgroundColor:[UIColor grayColor]];
//    [customCell addSubview:lineImage];
//    
//    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
//    [bt setFrame:CGRectMake(0, 0, 320, 50)];
//    [bt addTarget:self action:@selector(addCell:) forControlEvents:UIControlEventTouchUpInside];
//    [bt setTag:section];
//    //    NSLog(@"buttons:%d",bt.tag);
//    [customCell addSubview:bt];
//    
//    return customCell;
//}
-(void) addCell:(UIButton *)button
{
    _nextSelected = button.tag;
    if (_selected== -1) {
        _ifOpen = NO;
        _selected = _nextSelected;
        [self didSelectCellRowFirstDo:YES nextDo:NO];
    }
    else{
        if (_selected==_nextSelected) {
            [self didSelectCellRowFirstDo:NO nextDo:NO];
        }
        else{
            [self didSelectCellRowFirstDo:NO nextDo:YES];
        }
    }
    
}

- (void)didSelectCellRowFirstDo:(BOOL)firstDoInsert nextDo:(BOOL)nextDoInsert{
    [self beginUpdates];
    _ifOpen = firstDoInsert;
    NSMutableArray* rowToInsert = [[NSMutableArray alloc] init];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:_selected];
    [rowToInsert addObject:indexPath];
    if (!_ifOpen) {
        _selected = -1;
        [self deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationFade];
    }else{
        [self insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationFade];
    }
    [self endUpdates];
    if (nextDoInsert) {
        _selected = _nextSelected;
        [self didSelectCellRowFirstDo:YES nextDo:NO];
    }
    [self scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
    
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
