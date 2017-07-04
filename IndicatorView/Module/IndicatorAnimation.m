//
//  IndicatorAnimation.m
//  IndicatorView
//
//  Created by LOLITA on 17/7/4.
//  Copyright © 2017年 LOLITA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IndicatorAnimation.h"

@implementation IndicatorAnimation


-(void)configAnimationLayer:(CALayer*)layer withTintColor:(UIColor*)color size:(CGSize)size
{
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(0, 0, size.width, size.height);
    replicatorLayer.position = CGPointZero;
    replicatorLayer.backgroundColor = [UIColor clearColor].CGColor;
    [layer addSublayer:replicatorLayer];
}



@end












@implementation IndicatorBounceSpot1Animation

-(void)configAnimationLayer:(CALayer *)layer withTintColor:(UIColor *)color size:(CGSize)size{
    
    [super configAnimationLayer:layer withTintColor:color size:size];
    
    for (id la in layer.sublayers) {
        
        if ([la isKindOfClass:[CAReplicatorLayer class]]) {
            
            CAReplicatorLayer *replicatorLayer = la;
            
            [self addCyclingSpotAnimationLayerAtLayer:replicatorLayer withTintColor:color size:size];
            
            NSInteger numOfSpot = 15;
            replicatorLayer.instanceCount = numOfSpot;
            CGFloat angle = (M_PI*2.0)/numOfSpot;   // 角度
            replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
            replicatorLayer.instanceDelay = 1.5/numOfSpot;  //  延迟添加
            
        }
    }
    
    
}


- (void)addCyclingSpotAnimationLayerAtLayer:(CALayer *)layer withTintColor:(UIColor *)color size:(CGSize)size
{
    self.itemLayer = [CALayer layer];
    self.itemLayer.bounds = CGRectMake(0, 0, size.width/6, size.width/6);
    self.itemLayer.position = CGPointMake(size.width/2, 5);
    self.itemLayer.cornerRadius = self.itemLayer.bounds.size.width/2;
    self.itemLayer.backgroundColor = color.CGColor;
    self.itemLayer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1);
    
    [layer addSublayer:self.itemLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = @1;
    animation.toValue = @0.1;
    animation.duration = 1.5;
    animation.repeatCount = CGFLOAT_MAX;
    
    [self.itemLayer addAnimation:animation forKey:@"animation"];
    
}

-(void)removeAnimation{
    [self.itemLayer removeAnimationForKey:@"animation"];
}



@end









@implementation IndicatorBounceSpot2Animation




@end


































