//
//  IndicatorView.h
//  IndicatorView
//
//  Created by LOLITA on 17/7/4.
//  Copyright © 2017年 LOLITA. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,IndicatorType) {
    IndicatorTypeBounceSpot1,       // 圆环圆点
    IndicatorTypeBounceSpot2,       // 线型圆点
    IndicatorCyclingLine,           // 菊花型
    IndicatorCyclingCycle,          // 线性圆环
    IndicatorMusic1,                // music类型1
    IndicatorMusic2                 // music类型2
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
