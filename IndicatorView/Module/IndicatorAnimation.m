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



-(void)removeAnimation{
    [self.itemLayer removeAnimationForKey:@"animation"];
}


@end





#pragma mark - 环形圆点 ************************************************************************

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
    animation.repeatCount = HUGE_VALF;
    
    [self.itemLayer addAnimation:animation forKey:@"animation"];
    
}





@end





#pragma mark - 线性圆点 ************************************************************************

#define kBounceSpot2AnimationDuration 0.8

@implementation IndicatorBounceSpot2Animation


-(void)configAnimationLayer:(CALayer *)layer withTintColor:(UIColor *)color size:(CGSize)size{
    
    [super configAnimationLayer:layer withTintColor:color size:size];
    
    for (id la in layer.sublayers) {
        
        if ([la isKindOfClass:[CAReplicatorLayer class]]) {
            
            CAReplicatorLayer *replicatorLayer = la;
            
            [self addCyclingSpotAnimationLayerAtLayer:replicatorLayer withTintColor:color size:size];
            
            NSInteger numOfSpot = 4;
            replicatorLayer.instanceCount = numOfSpot;
            replicatorLayer.instanceTransform = CATransform3DMakeTranslation(size.width/5.0, 0, 0);
            replicatorLayer.instanceDelay = kBounceSpot2AnimationDuration/numOfSpot;  //  延迟添加
            
        }
    }
    
}


- (void)addCyclingSpotAnimationLayerAtLayer:(CALayer *)layer withTintColor:(UIColor *)color size:(CGSize)size
{
    CGFloat radius = size.width/5;
    self.itemLayer = [CALayer layer];
    self.itemLayer.bounds = CGRectMake(0, 0, radius, radius);
    self.itemLayer.position = CGPointMake(radius/2.0, size.height/2.0);
    self.itemLayer.cornerRadius = self.itemLayer.bounds.size.width/2.0;
    self.itemLayer.backgroundColor = color.CGColor;
    self.itemLayer.transform = CATransform3DMakeScale(0.2, 0.2, 0.2);
    
    [layer addSublayer:self.itemLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = @0.2;
    animation.toValue = @1;
    animation.duration = kBounceSpot2AnimationDuration;
    animation.repeatCount = HUGE_VALF;
    animation.autoreverses = YES;
    
    [self.itemLayer addAnimation:animation forKey:@"animation"];
    
}




@end











#pragma mark - 菊花 ************************************************************************

@implementation IndicatorCyclingLineAnimation

-(void)configAnimationLayer:(CALayer *)layer withTintColor:(UIColor *)color size:(CGSize)size{
    
    [super configAnimationLayer:layer withTintColor:color size:size];
    
    for (id la in layer.sublayers) {
        
        if ([la isKindOfClass:[CAReplicatorLayer class]]) {
            
            CAReplicatorLayer *replicatorLayer = la;
            
            [self addCyclingLineAnimationLayerAtLayer:replicatorLayer withTintColor:color size:size];
            
            NSInteger numOfSpot = 15;
            replicatorLayer.instanceCount = numOfSpot;
            CGFloat angle = (M_PI *2) / numOfSpot;
            replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
            replicatorLayer.instanceDelay = 1.5/numOfSpot;
            
        }
    }
    
}


- (void)addCyclingLineAnimationLayerAtLayer:(CALayer *)layer withTintColor:(UIColor *)color size:(CGSize)size
{
    
    self.itemLayer = [CALayer layer];
    self.itemLayer.bounds = CGRectMake(0, 0, 3, size.width/6.0);
    self.itemLayer.position = CGPointMake(size.width/2, 5);
    self.itemLayer.backgroundColor = color.CGColor;
    self.itemLayer.opacity = 0;
    self.itemLayer.cornerRadius = self.itemLayer.bounds.size.width/2.0;
    
    [layer addSublayer:self.itemLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = @1.0;
    animation.toValue = @0.0;
    animation.duration = 1.5;
    animation.repeatCount = HUGE_VALF;
    
    [self.itemLayer addAnimation:animation forKey:@"animation"];
    
}

@end









#pragma mark - 圆环 ************************************************************************

@implementation IndicatorCyclingCycleAnimation

-(void)configAnimationLayer:(CALayer *)layer withTintColor:(UIColor *)color size:(CGSize)size{
    
    CAShapeLayer *newItemLayer = (CAShapeLayer*)self.itemLayer;
    newItemLayer = [CAShapeLayer layer];
    newItemLayer.frame = CGRectMake(0, 0, size.width, size.height);
    newItemLayer.position = CGPointZero;
    newItemLayer.strokeColor = color.CGColor;
    newItemLayer.fillColor = [UIColor clearColor].CGColor;
    newItemLayer.lineWidth = 2.0;
    
    CGFloat radius = MIN(size.width/2.0, size.height/2.0);
    CGPoint center = CGPointMake(size.width/2.0, size.height/2.0);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                        radius:radius
                                                    startAngle:0
                                                      endAngle:M_PI*2*5/6.0
                                                     clockwise:YES];
    
    newItemLayer.path = path.CGPath;
    
    [layer addSublayer:newItemLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.duration = 1.5;
    animation.repeatCount = HUGE_VALF;
    animation.fromValue = @0;
    animation.toValue = @(M_PI*2.0);
    [newItemLayer addAnimation:animation forKey:@"animation"];
    
}



@end










#pragma mark - Music1 ************************************************************************

@implementation IndicatorMusic1Animation

-(void)configAnimationLayer:(CALayer *)layer withTintColor:(UIColor *)color size:(CGSize)size{
    
    [super configAnimationLayer:layer withTintColor:color size:size];
    
    for (id la in layer.sublayers) {
        
        if ([la isKindOfClass:[CAReplicatorLayer class]]) {
            
            CAReplicatorLayer *replicatorLayer = la;
            
            [self addMusicBarAnimationLayerAtLayer:replicatorLayer withTintColor:color size:size];
            
            NSInteger numOfSpot = 3;
            replicatorLayer.instanceCount = numOfSpot;
            replicatorLayer.instanceTransform = CATransform3DMakeTranslation(size.width*3/10, 0.f, 0.f);
            replicatorLayer.instanceDelay = 3.0;
            replicatorLayer.instanceDelay = 0.2;
            replicatorLayer.masksToBounds = YES; // 子视图超出的部分切掉
        }
    }
    
}



- (void)addMusicBarAnimationLayerAtLayer:(CALayer *)layer withTintColor:(UIColor *)color size:(CGSize)size{
    CGFloat width = size.width/5;
    CGFloat height = size.height;
    self.itemLayer = [CALayer layer];
    self.itemLayer.bounds = CGRectMake(0, 0, width, height);
    self.itemLayer.position = CGPointMake(size.width/2-width*3/2, size.height + 15);
    self.itemLayer.cornerRadius = 2.0;
    self.itemLayer.backgroundColor = color.CGColor;
    [layer addSublayer:self.itemLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animation.toValue = @(self.itemLayer.position.y - self.itemLayer.bounds.size.height/2);
    animation.duration = 0.4;
    animation.autoreverses = YES;
    animation.repeatCount = HUGE_VALF;
    
    [self.itemLayer addAnimation:animation forKey:@"animation"];
}


@end









#pragma mark - Music2 ************************************************************************

@implementation IndicatorMusic2Animation

-(void)configAnimationLayer:(CALayer *)layer withTintColor:(UIColor *)color size:(CGSize)size{
    
    [super configAnimationLayer:layer withTintColor:color size:size];
    
    for (id la in layer.sublayers) {
        
        if ([la isKindOfClass:[CAReplicatorLayer class]]) {
            
            CAReplicatorLayer *replicatorLayer = la;
            
            [self addMusicBarAnimationLayerAtLayer:replicatorLayer withTintColor:color size:size];
            
            NSInteger numOfSpot = 3;
            replicatorLayer.instanceCount = numOfSpot;
            replicatorLayer.instanceTransform = CATransform3DMakeTranslation(size.width*3/10, 0.f, 0.f);
            replicatorLayer.instanceDelay = 3.0;
            replicatorLayer.instanceDelay = 0.2;
        }
    }
    
}



- (void)addMusicBarAnimationLayerAtLayer:(CALayer *)layer withTintColor:(UIColor *)color size:(CGSize)size{
    CGFloat width = size.width/5;
    CGFloat height = size.height - 10;
    self.itemLayer = [CALayer layer];
    self.itemLayer.bounds = CGRectMake(0, 0, width, height);
    self.itemLayer.position = CGPointMake(size.width/2-width*3/2, size.height/2);
    self.itemLayer.cornerRadius = 2.0;
    self.itemLayer.backgroundColor = color.CGColor;
    [layer addSublayer:self.itemLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    animation.fromValue = @1;
    animation.toValue = @0.3;
    animation.duration = 0.4;
    animation.autoreverses = YES;
    animation.repeatCount = HUGE_VALF;
    
    [self.itemLayer addAnimation:animation forKey:@"animation"];
}


@end























