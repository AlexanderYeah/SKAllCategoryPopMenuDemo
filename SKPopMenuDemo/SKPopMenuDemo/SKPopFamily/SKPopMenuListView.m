//
//  SKPopMenuListView.m
//  SKPopMenuListView
//
//  Created by AY on 2017/11/13.
//  Copyright © 2017年 AY. All rights reserved.
//

#import "SKPopMenuListView.h"
#define kTbWidth SCREEN_WIDTH - 2 * 60
#define kTbHeight 250


#define kTitleHeight 35
#define kCellHeight 40
#define kLeftPadding 25

@interface SKPopMenuListView()<UITableViewDelegate,UITableViewDataSource>

/** 背景 tableview */
@property (nonatomic,strong)UITableView *mainTableView;

@end

@implementation SKPopMenuListView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//
- (instancetype)init
{	
	if (self = [super init]) {
		[self createUI];
	}
	return self;
	
}

//
- (void)createUI
{	
	// self.backgroundColor = kMainColor;
	// 标题
	_titleLbl = [[UILabel alloc]init];
	_titleLbl.textColor = [UIColor whiteColor];
	_titleLbl.backgroundColor = kMainColor;
	_titleLbl.font = [UIFont systemFontOfSize:16.0f];
	_titleLbl.textAlignment = NSTextAlignmentLeft;
	[self addSubview:_titleLbl];
	
	[_titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
		make.width.equalTo(kTbWidth);
		make.height.equalTo(kTitleHeight);
		make.left.equalTo(self.mas_left).offset(0);
		make.top.equalTo(self.mas_top).offset(0);
	}];
	


	self.mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kTitleHeight, kTbWidth, 80) style:UITableViewStylePlain];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.mainTableView.showsVerticalScrollIndicator = NO;
	self.mainTableView.bounces = NO;
	self.mainTableView.backgroundColor = kMainColor;
    [self addSubview: self.mainTableView];
	
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cellID";

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

	
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }

	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
	cell.textLabel.text = self.dataArr[indexPath.row];
	
	cell.textLabel.textAlignment = NSTextAlignmentCenter;
	cell.textLabel.textColor = [UIColor whiteColor];
	cell.backgroundColor = kMainColor;
	
	UIView *sepView = [[UIView alloc]init];
	sepView.backgroundColor = kDarkColor;
	[cell.contentView addSubview:sepView];
	
	[sepView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.height.equalTo(1);
		make.right.equalTo(cell.contentView.mas_right);
		make.left.equalTo(cell.contentView.mas_left);
		make.top.equalTo(cell.contentView.mas_top).offset(0);
	}];
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	// 计算高度
	return self.dataArr.count > 6 ? 40 : 50;
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

	[self.delegate sampleOneSelectResultWithString:self.dataArr[indexPath.row]];
}


- (void)setNeedsDisplay
{
	
 	CGFloat height = self.dataArr.count > 6 ? 40 : 50;
	// 这时候去改变fram
	self.mainTableView.frame = CGRectMake(0, kTitleHeight, kTbWidth, height * self.dataArr.count);
	
}

@end
