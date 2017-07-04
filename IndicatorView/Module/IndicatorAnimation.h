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








@interface IndicatorBounceSpot1Animation : IndicatorAnimation

@end








@interface IndicatorBounceSpot2Animation : IndicatorAnimation

@end
