//
//  SKDCAnimationPopView.m
//  SKPopMenuDemo
//
//  Created by Alexander on 2018/1/10.
//  Copyright © 2018年 alexander. All rights reserved.
//

#import "SKDCAnimationPopView.h"

@interface SKDCAnimationPopView()




@end

@implementation SKDCAnimationPopView



#pragma mark -  lazyload
- (UIView *)moveLabel
{
	// 宽高都为屏幕宽高
	if (!_moveLabel) {
    _moveLabel = [[UILabel alloc]init
    	];
    // 确定宽度和高度
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 50 * 2;
    CGFloat height = 100;
    CGFloat x = 50;
    CGFloat y = ([UIScreen mainScreen].bounds.size.height - height)/2;
    _moveLabel.frame = CGRectMake(x, y, width, height);
    _moveLabel.textColor = [UIColor whiteColor];
    _moveLabel.font = [UIFont systemFontOfSize:26.0f];
    _moveLabel.textAlignment = NSTextAlignmentCenter;
    _moveLabel.backgroundColor = [UIColor orangeColor];
		
		
		
	}

	return _moveLabel;
	
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
		[self createUI];
	}
	return  self;

}
#pragma mark - 创建UI
- (void)createUI
{
	
	self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
	[self addSubview:self.moveLabel];
	
	

}





@end
