//
//  IndexCtrl.m
//  IndicatorView
//
//  Created by LOLITA on 17/7/4.
//  Copyright © 2017年 LOLITA. All rights reserved.
//

#import "IndexCtrl.h"
#import "IndicatorView.h"

@interface IndexCtrl ()



@end

@implementation IndexCtrl


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self initUI];
}



-(void)initUI{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"IndicatorView";
    
    NSInteger num = 8;
    
    CGFloat x = [UIScreen mainScreen].bounds.size.width/3.0;
    CGFloat y = [UIScreen mainScreen].bounds.size.height/5.0;
    
    for (int i=0; i<num; i++) {
        
        NSInteger line = i % 2;
        NSInteger row = ceilf((i+1)/2.0);
 
        
        
        
        IndicatorView *indicator = [[IndicatorView alloc] initWithType:i];
        [self.view addSubview:indicator];
        [indicator startAnimating];
        
        
        
        
        
        
        
        indicator.center = CGPointMake(x*(line+1), y*row);
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [indicator stopAnimating];
        });
        
        
        
    }
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
