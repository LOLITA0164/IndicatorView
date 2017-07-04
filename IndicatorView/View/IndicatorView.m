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
#define IndicatorDefaultSize CGSizeMake(60,60)

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
        [self fadeOutWithAnimation:YES];
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
}

- (id<IndicatorAnimationProtocol>)animationForIndicatorType:(IndicatorType)type{
    switch (type) {
        case IndicatorTypeBounceSpot1:
            return [[IndicatorBounceSpot1Animation alloc] init];
        case IndicatorTypeBounceSpot2:
            return [[IndicatorBounceSpot1Animation alloc] init];
        default:
            break;
    }
}



- (void)fadeOutWithAnimation:(BOOL)animated{
    if (animated) {
        CABasicAnimation *fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        fadeAnimation.beginTime = CACurrentMediaTime();
        fadeAnimation.duration = 0.35;
        fadeAnimation.toValue = @(0);
        [self.layer addAnimation:fadeAnimation forKey:@"fadeOut"];
    }
}




@end
