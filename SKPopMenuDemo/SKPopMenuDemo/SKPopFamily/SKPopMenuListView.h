//
//  SKPopMenuListView.h
//  SKPopMenuListView
//
//  Created by AY on 2017/11/13.
//  Copyright © 2017年 AY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SKPopMenuSelectDelegate <NSObject>

/** 用户选择结果回调 */
- (void)sampleOneSelectResultWithString:(NSString *)str;


@end

@interface SKPopMenuListView : UIView

/** 标题 */
@property (nonatomic,strong)UILabel * titleLbl;
/** 数据源 */
@property (nonatomic,strong)NSArray *dataArr;


/** 代理方法 */
@property (nonatomic,assign)id<SKPopMenuSelectDelegate> delegate;



@end
