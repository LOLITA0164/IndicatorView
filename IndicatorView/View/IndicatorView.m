//
//  IndicatorView.m
//  IndicatorView
//
//  Created by LOLITA on 17/7/4.
//  Copyright © 2017年 LOLITA. All rights reserved.
//

#import "IndicatorView.h"
#import "IndicatorAnimationProtocol.h"
#import "IndicatorAnimation.h"

#define ColorWithRGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define ColorWithRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define IndicatorDefaultTintColor ColorWithRGB(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))
#define IndicatorDefaultSize CGSizeMake(40,40)

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 100000
@interface IndicatorView ()<CAAnimationDelegate>
#else
@interface JQIndicatorView ()
#endif

@property id<IndicatorAnimationProtocol> delegate;
@property IndicatorType type;
@property CGSize size;
@property UIColor *loadingTintColor;

@end


@implementation IndicatorView

#pragma mark - 初始化
- (instancetype)initWithType:(IndicatorType)type tintColor:(UIColor *)color size:(CGSize)size{
    if (self = [super init]) {
        self.type = type;
        self.loadingTintColor = color;
        self.size = size;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillBecomeActive) name:UIApplicationWillEnterForegroundNotification object:nil];
    }
    
    return self;
}

- (instancetype)initWithType:(IndicatorType)type{
    return [self initWithType:type tintColor:IndicatorDefaultTintColor];
}

- (instancetype)initWithType:(IndicatorType)type tintColor:(UIColor *)color{
    return [self initWithType:type tintColor:color size:IndicatorDefaultSize];
}


#pragma mark - 动画
- (void)startAnimating{
    
    self.layer.sublayers = nil;
    
    [self setToNormalState];
    
    self.delegate = [self animationForIndicatorType:self.type];
    
    if ([self.delegate respondsToSelector:@selector(configAnimationLayer:withTintColor:size:)]) {
        
        [self.delegate configAnimationLayer:self.layer withTintColor:self.loadingTintColor size:self.size];
        
    }
    
    
    self.isAnimating = YES;
}

- (void)stopAnimating{
    if (self.isAnimating == YES) {
        if ([self.delegate respondsToSelector:@selector(removeAnimation)]) {
            [self.delegate removeAnimation];
            self.isAnimating = NO;
            self.delegate = nil;
        }
        [self fadeOutWithAnimation:NO];
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
}

- (id<IndicatorAnimationProtocol>)animationForIndicatorType:(IndicatorType)type{
    switch (type) {
        case IndicatorTypeBounceSpot1:
            return [[IndicatorBounceSpot1Animation alloc] init];
        case IndicatorTypeBounceSpot2:
            return [[IndicatorBounceSpot2Animation alloc] init];
        case IndicatorTypeBounceSpot3:
            return [[IndicatorBounceSpot3Animation alloc] init];
        case IndicatorTypeCyclingLine:
            return [[IndicatorCyclingLineAnimation alloc] init];
        case IndicatorTypeCyclingCycle1:
            return [[IndicatorCyclingCycle1Animation alloc] init];
        case IndicatorTypeCyclingCycle2:
            return [[IndicatorCyclingCycle2Animation alloc] init];
        case IndicatorTypeMusic1:
            return [[IndicatorMusic1Animation alloc] init];
        case IndicatorTypeMusic2:
            return [[IndicatorMusic2Animation alloc] init];
        default:
            break;
    }
}


#pragma mark - CAAnimation delegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self setToFadeOutState];
}


- (void)setToNormalState{
    self.layer.backgroundColor = [UIColor grayColor].CGColor;
    self.layer.speed = 1.0f;
    self.layer.opacity = 1.0;
}


- (void)setToFadeOutState{
    self.layer.backgroundColor = [UIColor clearColor].CGColor;
    self.layer.sublayers = nil;
    self.layer.opacity = 0.f;
}



- (void)fadeOutWithAnimation:(BOOL)animated{
    if (animated) {
        CABasicAnimation *fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        fadeAnimation.delegate = self;
        fadeAnimation.duration = 0.35;
        fadeAnimation.fromValue = @(1);
        fadeAnimation.toValue = @(0);
        [self.layer addAnimation:fadeAnimation forKey:@"fadeOut"];
    }
    else{
        [self setToFadeOutState];
    }
}



- (void)appDidEnterBackground{
    if (self.isAnimating == YES) {
        [self.delegate removeAnimation];
    }
}

- (void)appWillBecomeActive{
    if (self.isAnimating == YES) {
        [self startAnimating];
    }
}


@end
