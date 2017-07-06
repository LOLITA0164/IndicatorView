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







#pragma mark - 三角运动圆点 ************************************************************************

@implementation IndicatorBounceSpot3Animation


-(void)configAnimationLayer:(CALayer *)layer withTintColor:(UIColor *)color size:(CGSize)size{
    
    [super configAnimationLayer:layer withTintColor:color size:size];
    
    for (id la in layer.sublayers) {
        
        if ([la isKindOfClass:[CAReplicatorLayer class]]) {
            
            CAReplicatorLayer *replicatorLayer = la;
            
            [self addCyclingSpotAnimationLayerAtLayer:replicatorLayer withTintColor:color size:size];
            
            NSInteger numOfSpot = 3;
            replicatorLayer.instanceCount = numOfSpot;
            CGFloat angle = (M_PI*2) / numOfSpot;
            replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
            
        }
    }
    
}


- (void)addCyclingSpotAnimationLayerAtLayer:(CALayer *)layer withTintColor:(UIColor *)color size:(CGSize)size
{
    CGFloat radius = size.width/4;
    self.itemLayer = [CALayer layer];
    self.itemLayer.bounds = CGRectMake(0, 0, radius, radius);
    self.itemLayer.position = CGPointMake(size.width/2.0, size.height - radius/2.0);
    self.itemLayer.cornerRadius = self.itemLayer.bounds.size.width/2.0;
    self.itemLayer.backgroundColor = color.CGColor;
    
    [layer addSublayer:self.itemLayer];
    
    CGPoint p0,p1,p2;
    p0 = CGPointMake(size.width/2.0, size.height);
    p1 = CGPointMake(size.width/2.0*(1-cos(M_PI*30/180.0)), size.width/2.0*(1-sin(M_PI*30/180.0)));
    p2 = CGPointMake(size.width/2.0*(1+cos(M_PI*30/180.0)), size.width/2.0*(1-sin(M_PI*30/180.0)));
    
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 2.0;
    animation.values = @[[NSValue valueWithCGPoint:p0],[NSValue valueWithCGPoint:p1],[NSValue valueWithCGPoint:p2],[NSValue valueWithCGPoint:p0]];
    animation.timingFunctions = @[
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                  ];
    animation.repeatCount = HUGE_VALF;
    
    [self.itemLayer addAnimation:animation forKey:@"animation"];
    
}




@end












#pragma mark - 圆环 ************************************************************************

@implementation IndicatorCyclingLineAnimation

-(void)configAnimationLayer:(CALayer *)layer withTintColor:(UIColor *)color size:(CGSize)size{
    
    [super configAnimationLayer:layer withTintColor:color size:size];
    
    for (id la in layer.sublayers) {
        
        if ([la isKindOfClass:[CAReplicatorLayer class]]) {
            
            CAReplicatorLayer *replicatorLayer = la;
            
            [self addCyclingLineAnimationLayerAtLayer:replicatorLayer withTintColor:color size:size];
            
            NSInteger numOfSpot = 10;
            replicatorLayer.instanceCount = numOfSpot;
            CGFloat angle = (M_PI *2) / numOfSpot;
            replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
            replicatorLayer.instanceDelay = 1.0/numOfSpot;
            
        }
    }
    
}


- (void)addCyclingLineAnimationLayerAtLayer:(CALayer *)layer withTintColor:(UIColor *)color size:(CGSize)size
{
    CGFloat width = 2 * M_PI * size.width / 2.0 / 12;
    self.itemLayer = [CALayer layer];
    self.itemLayer.bounds = CGRectMake(0, 0, width, width/3>3?width/3:3);
    self.itemLayer.position = CGPointMake(size.width/2, 0);
    self.itemLayer.backgroundColor = color.CGColor;
    self.itemLayer.opacity = 0;
    self.itemLayer.cornerRadius = self.itemLayer.bounds.size.height/2.0;
    
    [layer addSublayer:self.itemLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = @1.0;
    animation.toValue = @0.0;
    animation.duration = 1.0;
    animation.repeatCount = HUGE_VALF;
    
    [self.itemLayer addAnimation:animation forKey:@"animation"];
    
}

@end









#pragma mark - 单线圆环 ************************************************************************

@implementation IndicatorCyclingCycle1Animation

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






#pragma mark - 多线圆环 ************************************************************************

@implementation IndicatorCyclingCycle2Animation

-(void)configAnimationLayer:(CALayer *)layer withTintColor:(UIColor *)color size:(CGSize)size{
    
    NSInteger numOfCycle = 2;   // 圆环的个数
    NSInteger numOfArc = 2;     // 内圈圆弧的个数
    
    for (int i = 0; i < numOfCycle; i++) {

//        numOfArc = numOfArc + i;
        
        CAReplicatorLayer *replicatorLayer = [self newCAReplicatorLayerWithNumPer:numOfArc size:size];
        [layer addSublayer:replicatorLayer];
        id formValue,toValue;
        if (i%2) {
            formValue = @(0);
            toValue = @(M_PI*2);
        }else{
            formValue = @(M_PI*2);
            toValue = @(0);
        }
        CABasicAnimation *animation = [self newCABasicAnimationWithFormValue:formValue toValue:toValue];
        [replicatorLayer addAnimation:animation forKey:@"animation"];
        
        CGFloat perRadius = size.width/2.0 / numOfCycle;
        
        CGFloat radius =  perRadius * (i+1);
        
        CAShapeLayer *newItemLayer = [self newCAShapeLayerWithColor:color];

        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width/2.0, size.height/2.0) radius:radius startAngle:0 endAngle:M_PI*2/(numOfArc+1) clockwise:YES];
        newItemLayer.path = path.CGPath;
        [replicatorLayer addSublayer:newItemLayer];

    }
    
}


-(CAReplicatorLayer *)newCAReplicatorLayerWithNumPer:(NSInteger)num size:(CGSize)size{
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(0, 0, size.width, size.height);
    replicatorLayer.position = CGPointZero;
    replicatorLayer.backgroundColor = [UIColor clearColor].CGColor;
    replicatorLayer.instanceCount = num;
    CGFloat angle = (M_PI *2) / num;
    replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
    return replicatorLayer;
}

-(CAShapeLayer*)newCAShapeLayerWithColor:(UIColor*)color{
    CAShapeLayer *newItemLayer = [CAShapeLayer layer];
    newItemLayer.position = CGPointZero;
    newItemLayer.strokeColor = color.CGColor;
    newItemLayer.fillColor = [UIColor clearColor].CGColor;
    newItemLayer.lineWidth = 2.0;
    return newItemLayer;
}

-(CABasicAnimation*)newCABasicAnimationWithFormValue:(id)formValue toValue:(id)toValue{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.duration = 1.5;
    animation.repeatCount = HUGE_VALF;
    animation.fromValue = formValue;
    animation.toValue = toValue;
    return animation;
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























