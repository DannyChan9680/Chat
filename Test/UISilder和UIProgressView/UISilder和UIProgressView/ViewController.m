//
//  ViewController.m
//  UISilder和UIProgressView
//
//  Created by Civet on 2019/7/26.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize pSlider=_slider;
@synthesize pView=_pView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建进度条对象以及设定进度条的位置
    _pView=[[UIProgressView alloc]init];
    
    _pView.frame=CGRectMake(10, 100, 400, 40);
    //进度条的进度值0~1，
    _pView.progress=0.5;
    //进度条风格特征
    _pView.progressViewStyle=UIProgressViewStyleDefault;
    //设置进度条的风格颜色
    _pView.progressTintColor=[UIColor redColor];
    
    _pView.trackTintColor=[UIColor orangeColor];
    
    [self.view addSubview:_pView];
    
    //创建滑动条对象
    _slider=[[UISlider alloc] init];
    _slider.frame=CGRectMake(100, 160, 300, 80);
    
    _slider.maximumValue=100;
    _slider.minimumValue=-100;
    
    _slider.value=30;
    
    _slider.minimumTrackTintColor=[UIColor redColor];
    _slider.maximumTrackTintColor=[UIColor greenColor];
    //为滑动条添加时间函数
    [_slider addTarget:self action:@selector(pressSlider) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_slider];
}
-(void)pressSlider
{
    _progressView.progress=(_slider.value-_slider.minimumValue)/(_slider.maximumValue-_slider.minimumValue);
    
    NSLog(@"value =%f",_slider.value);
}

@end
