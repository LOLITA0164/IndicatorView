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
    
    NSInteger num = 1;
    
    CGFloat x = [UIScreen mainScreen].bounds.size.width/3.0;
    CGFloat y = [UIScreen mainScreen].bounds.size.height/5.0;
    
    for (int i=0; i<num; i++) {
        
        NSInteger row = i % 2;
        NSInteger line = ceilf(i/2.0);
        
        IndicatorView *indicator = [[IndicatorView alloc] initWithType:i];
        indicator.center = CGPointMake(x*(row+1), y*line);
        [indicator startAnimating];
        
        [self.view addSubview:indicator];
        
    }
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
