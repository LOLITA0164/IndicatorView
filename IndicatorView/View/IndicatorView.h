//
//  IndicatorView.h
//  IndicatorView
//
//  Created by LOLITA on 17/7/4.
//  Copyright © 2017年 LOLITA. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,IndicatorType) {
    IndicatorTypeBounceSpot1,           // 圆环圆点
    IndicatorTypeBounceSpot2,           // 线型圆点
    IndicatorTypeBounceSpot3,           // 三角型圆点
    IndicatorTypeCyclingLine,           // 菊花
    IndicatorTypeCyclingCycle1,         // 单线圆环
    IndicatorTypeCyclingCycle2,         // 多线圆环
    IndicatorTypeMusic1,                // music类型1
    IndicatorTypeMusic2,                // music类型2
};

@interface IndicatorView : UIView

/**
 是否在加载中
 */
@property BOOL isAnimating;

-(instancetype)initWithType:(IndicatorType)type;
-(instancetype)initWithType:(IndicatorType)type tintColor:(UIColor *)color;
-(instancetype)initWithType:(IndicatorType)type tintColor:(UIColor *)color size:(CGSize)size;


/**
 开始
 */
-(void)startAnimating;

/**
 停止
 */
-(void)stopAnimating;




@end
