//
//  shoppingMallTableView.m
//  zJ_Poker_Demo
//
//  Created by zJ on 13-12-9.
//  Copyright (c) 2013年 zJ. All rights reserved.
//

#import "shoppingMallTableView.h"

@implementation shoppingMallTableView


#define headerHeight 60
#define heightOfRow 80
#define OriginalState  999

@synthesize data = _data;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        _selected = OriginalState;
        _nextSelected = OriginalState;
    }
    return self;
}


#pragma mark TableView delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == _selected){
        return 1;
    }
    else return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"shoppingMallCell";
    shoppingMallCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[shoppingMallCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 8;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == _selected){
        return heightOfRow;
    }
    return 0;

}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return headerHeight;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *customCell = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenHeight, headerHeight)];
    [customCell setBackgroundColor:[UIColor whiteColor]];
//    [customCell setBackgroundColor:[UIColor colorWithRed:255/255.0 green:229/255.0 blue:204/255.0 alpha:1]];
    
    UIImageView *logo = [[UIImageView alloc] initWithFrame:CGRectMake(30, 5, 40, 40)];
    [logo setImage:[UIImage imageNamed:@"cnHallActBtn.png"]];
    [customCell addSubview:logo];
    
    UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, customCell.height - 1, ScreenHeight, 1)];
    [lineImage setBackgroundColor:[UIColor blackColor]];
    [customCell addSubview:lineImage];

    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    [bt setFrame:CGRectMake(0, 0, 320, 50)];
    [bt addTarget:self action:@selector(addCell:) forControlEvents:UIControlEventTouchUpInside];
    [bt setTag:section];
    NSLog(@"buttons:%d",bt.tag);
    [customCell addSubview:bt];
    
    return customCell;
}
-(void) addCell:(UIButton *)button
{
    _nextSelected = button.tag;
    if (_selected == OriginalState) {
        _selected = _nextSelected;
        [self didSelectCellRowFirstDo:YES nextDo:NO];
    }
    else{
        if (_selected == _nextSelected) {
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
        _selected = OriginalState;
        [self deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationFade];
    }else{
        [self insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationFade];
    }
    [self endUpdates];
    if(_ifOpen) [self scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    if (nextDoInsert) {
        _selected = _nextSelected;
        [self didSelectCellRowFirstDo:YES nextDo:NO];
    }

//    [self scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];

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
