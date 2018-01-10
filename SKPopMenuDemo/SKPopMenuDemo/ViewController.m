//
//  ViewController.m
//  SKPopMenuDemo
//
//  Created by Alexander on 2018/1/2.
//  Copyright © 2018年 alexander. All rights reserved.
//

#import "ViewController.h"

#import "SKPopMenuListView.h"
#import "SKDCAnimationPopView.h"
@interface ViewController ()<SKPopMenuSelectDelegate>
/** 弹出view 背景view */
@property (nonatomic,strong)UIView *popBgView;
/** Sample 1  弹出视图 */
@property (nonatomic,strong)SKPopMenuListView *popListView;
/**move Label*/
@property (nonatomic,strong)SKDCAnimationPopView *dcAniamtionView;

@end

@implementation ViewController

#pragma mark -  Lazyload
- (UIView *)popBgView
{
    if (!_popBgView) {
		
        _popBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _popBgView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.6];
        _popBgView.userInteractionEnabled = YES;
		
        [self.view addSubview:_popBgView];
        _popListView = [[SKPopMenuListView alloc]init];

		
        _popListView.delegate = self;
		
        [_popBgView addSubview:_popListView];
        _popListView.frame = CGRectMake(kPopLeftPadding, -300, SCREEN_WIDTH - 2 * kPopLeftPadding, 300);
		
    }
    return _popBgView;
}


- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	NSArray *menuArr = @[@"Sample1",@"Bounces",@"Tada",@"Pulse",@"Shake",@"Swing",@"Snap",@"Bounce2",@"Expand",@"Hinge",@"Drop"];
	CGFloat btn_padding = 30;
	CGFloat btn_w = (SCREEN_WIDTH - 5 * btn_padding)/4;
	CGFloat btn_h = 35;
	int max_cols = 4;
	for (int i = 0; i < menuArr.count; i ++) {
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
		btn.backgroundColor = SKRandomColor;
		[btn setTitle:menuArr[i] forState:UIControlStateNormal];
		btn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
		btn.tag = 666 + i;
		[btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

		int row = 0;
		int col = i;
		if (i >= max_cols) {
			row = i / max_cols;
			col = i % max_cols;
		}
		
		btn.frame = CGRectMake(btn_padding + col *( btn_w + btn_padding) , btn_padding + row * (btn_h + btn_padding) + 80, btn_w, btn_h);
		
		[self.view addSubview:btn];
		
	}
	
	

	
	
}

#pragma mark -  回调结果
/** Sample 1 回调结果 */
-(void)sampleOneSelectResultWithString:(NSString *)str
{
	
	SKLog(@"%@",str);
	
	[self.popBgView removeFromSuperview];
    self.popBgView = nil;
}


#pragma mark -  按钮点击
- (void)btnClick:(UIButton *)btn
{
	
	NSInteger idx = btn.tag - 666;
	
	switch (idx) {
  case 0:
    {
		// Sample1

		[self sampleOneShow];
		
	}
    break;
    case 1:{
		// Sample2
		[self dcBounceShow];
	}
	break;
	case 2:{
		[self dcTadaShow];
	
	}
	break;
	case 3:{
		[self dcPulseShow];
	
	}
	break;
	case 4:{
		[self dcShakeShow];
	
	}
	break;
	case 5:{
		[self dcSwingShow];
	
	}
	break;
	case 6:{
		[self dcSnapShow];
	
	}
	break;
	case 7:{
		[self dcBounceTwoShow];
	
	}
	break;
	case 8:{
		[self dcExpandShow];
	
	}
	break;
	case 9:{
		[self dcCompressShow];
	
	}
	break;
	case 10:{
		[self dcDropShow];
	
	}
	break;

  default:
    break;
}

}


#pragma mark -  方法抽取
- (void)sampleOneShow
{

	// 以一种动画的形式弹出来
	[self.view addSubview:self.popBgView];
    [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut  animations:^{
        self.popListView.dataArr = @[@"上海",@"北京",@"郑州",@"深圳",@"杭州",@"广州"];
        self.popListView.titleLbl.text = @"  地区选择";
        [self.popListView setNeedsDisplay];
		// 根据菜单的数量控制高度
		CGFloat cell_height = self.popListView.dataArr.count > 6 ? 40 : 50;
		CGFloat view_height = cell_height * self.popListView.dataArr.count + 35;
		// 位于self.view 的正中间
		CGFloat y = (SCREEN_HEIGHT - view_height)/2;
        self.popListView.frame = CGRectMake(kPopLeftPadding, y, SCREEN_WIDTH - 2 * kPopLeftPadding, view_height);
		
    } completion:nil];

}

- (void)dcBounceShow
{
	
		// DCView
	SKDCAnimationPopView *view = [[SKDCAnimationPopView alloc]initWithFrame:[UIScreen mainScreen].bounds];
	_dcAniamtionView = view;
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dcTap:)];
	tap.numberOfTapsRequired = 1;
	[view addGestureRecognizer:tap];
	self.dcAniamtionView.moveLabel.text = @"bounce";
	[self.dcAniamtionView.moveLabel bounce:nil];
	[self.view addSubview:self.dcAniamtionView];


}

- (void)dcTadaShow
{
	// DCView
	SKDCAnimationPopView *view = [[SKDCAnimationPopView alloc]initWithFrame:[UIScreen mainScreen].bounds];
	_dcAniamtionView = view;
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dcTap:)];
	tap.numberOfTapsRequired = 1;
	[view addGestureRecognizer:tap];
	
	self.dcAniamtionView.moveLabel.text = @"tada";
	[self.dcAniamtionView.moveLabel tada:nil];
	[self.view addSubview:self.dcAniamtionView];
	
}


- (void)dcPulseShow
{
	// DCView
	SKDCAnimationPopView *view = [[SKDCAnimationPopView alloc]initWithFrame:[UIScreen mainScreen].bounds];
	_dcAniamtionView = view;
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dcTap:)];
	tap.numberOfTapsRequired = 1;
	[view addGestureRecognizer:tap];
	self.dcAniamtionView.moveLabel.text = @"Pulse";
	[self.dcAniamtionView.moveLabel pulse:nil];
	[self.view addSubview:self.dcAniamtionView];

}

- (void)dcShakeShow
{
	// DCView
	SKDCAnimationPopView *view = [[SKDCAnimationPopView alloc]initWithFrame:[UIScreen mainScreen].bounds];
	_dcAniamtionView = view;
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dcTap:)];
	tap.numberOfTapsRequired = 1;
	[view addGestureRecognizer:tap];
	self.dcAniamtionView.moveLabel.text = @"Shake";
	[self.dcAniamtionView.moveLabel shake:nil];
	[self.view addSubview:self.dcAniamtionView];

}

- (void)dcSwingShow
{
	// DCView
	SKDCAnimationPopView *view = [[SKDCAnimationPopView alloc]initWithFrame:[UIScreen mainScreen].bounds];
	_dcAniamtionView = view;
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dcTap:)];
	tap.numberOfTapsRequired = 1;
	[view addGestureRecognizer:tap];
	self.dcAniamtionView.moveLabel.text = @"Swing";
	[self.dcAniamtionView.moveLabel swing:nil];
	[self.view addSubview:self.dcAniamtionView];

}

- (void)dcSnapShow
{
	// DCView
	SKDCAnimationPopView *view = [[SKDCAnimationPopView alloc]initWithFrame:[UIScreen mainScreen].bounds];
	_dcAniamtionView = view;
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dcTap:)];
	tap.numberOfTapsRequired = 1;
	[view addGestureRecognizer:tap];
	self.dcAniamtionView.moveLabel.text = @"Snap";
	
	// different 从四个方向可以弹出

	[self.dcAniamtionView.moveLabel snapIntoView:self.dcAniamtionView direction:DCAnimationDirectionTop];
	[self.view addSubview:self.dcAniamtionView];

}


- (void)dcBounceTwoShow
{
	SKDCAnimationPopView *view = [[SKDCAnimationPopView alloc]initWithFrame:[UIScreen mainScreen].bounds];
	_dcAniamtionView = view;
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dcTap:)];
	tap.numberOfTapsRequired = 1;
	[view addGestureRecognizer:tap];
	self.dcAniamtionView.moveLabel.text = @"Bounce2";
	
	// different 从四个方向可以弹出
	[self.dcAniamtionView.moveLabel bounceIntoView: self.dcAniamtionView direction:DCAnimationDirectionLeft];
	
	
	[self.view addSubview:self.dcAniamtionView];

}
- (void)dcExpandShow{
		// DCView
	SKDCAnimationPopView *view = [[SKDCAnimationPopView alloc]initWithFrame:[UIScreen mainScreen].bounds];
	_dcAniamtionView = view;
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dcTap:)];
	tap.numberOfTapsRequired = 1;
	[view addGestureRecognizer:tap];
	self.dcAniamtionView.moveLabel.text = @"Expand";
	[self.dcAniamtionView.moveLabel expandIntoView:self.dcAniamtionView finished:nil];
	[self.view addSubview:self.dcAniamtionView];

	
}

- (void)dcCompressShow
{
		// DCView
	SKDCAnimationPopView *view = [[SKDCAnimationPopView alloc]initWithFrame:[UIScreen mainScreen].bounds];
	_dcAniamtionView = view;
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dcTap:)];
	tap.numberOfTapsRequired = 1;
	[view addGestureRecognizer:tap];
	self.dcAniamtionView.moveLabel.text = @"Swing";
	[self.dcAniamtionView.moveLabel hinge:nil];
	[self.view addSubview:self.dcAniamtionView];


}
- (void)dcDropShow
{
	SKDCAnimationPopView *view = [[SKDCAnimationPopView alloc]initWithFrame:[UIScreen mainScreen].bounds];
	_dcAniamtionView = view;
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dcTap:)];
	tap.numberOfTapsRequired = 1;
	[view addGestureRecognizer:tap];
	self.dcAniamtionView.moveLabel.text = @"Swing";
	[self.dcAniamtionView.moveLabel drop:nil];
	[self.view addSubview:self.dcAniamtionView];
	
}

#pragma mark -  SKDCView 的点击
- (void)dcTap:(UITapGestureRecognizer *)tap
{

	[self.dcAniamtionView removeFromSuperview];
	self.dcAniamtionView = nil;

}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
