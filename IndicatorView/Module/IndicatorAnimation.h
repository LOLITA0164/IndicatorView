//
//  IndicatorAnimation.h
//  IndicatorView
//
//  Created by LOLITA on 17/7/4.
//  Copyright © 2017年 LOLITA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IndicatorAnimationProtocol.h"


@interface IndicatorAnimation : NSObject <IndicatorAnimationProtocol>

@property CALayer *itemLayer;

@end


/**
 圆环圆点
 */
@interface IndicatorBounceSpot1Animation : IndicatorAnimation

@end



/**
 线型圆点
 */
@interface IndicatorBounceSpot2Animation : IndicatorAnimation

@end



/**
 三角型圆点
 */
@interface IndicatorBounceSpot3Animation : IndicatorAnimation

@end



/**
 虚线圆环
 */
@interface IndicatorCyclingLineAnimation : IndicatorAnimation

@end



/**
 单线圆环
 */
@interface IndicatorCyclingCycle1Animation : IndicatorAnimation

@end



/**
 多线圆环
 */
@interface IndicatorCyclingCycle2Animation : IndicatorAnimation

@end



/**
 音乐类型1
 */
@interface IndicatorMusic1Animation : IndicatorAnimation

@end



/**
 音乐类型2
 */
@interface IndicatorMusic2Animation : IndicatorAnimation

@end



/**
 折线
 */
@interface IndicatorStockAnimation : IndicatorAnimation

@end




