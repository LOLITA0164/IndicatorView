//
//  IndicatorAnimationProtocol.h
//  IndicatorView
//
//  Created by LOLITA on 17/7/4.
//  Copyright © 2017年 LOLITA. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IndicatorAnimationProtocol <NSObject>

@optional

-(void)configAnimationLayer:(CALayer*)layer withTintColor:(UIColor*)color size:(CGSize)size;

-(void)removeAnimation;

@end
