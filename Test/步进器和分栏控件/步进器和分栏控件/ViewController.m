//
//  ViewController.m
//  步进器和分栏控件
//
//  Created by Civet on 2019/7/26.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize stepper=_stepper;
@synthesize segControl=_segControl;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //
    _stepper=[[UIStepper alloc] init];
    //设置位置
    _stepper.frame=CGRectMake(100, 100, 80, 40);
    //设置步进器的最大最小值
    _stepper.minimumValue=0;
    _stepper.maximumValue=10;
    //设置数值
    _stepper.value=10;
    //设置步伐数值
    _stepper.stepValue=1;
    //是否重复事件操作
    _stepper.autorepeat=YES;
    //是否将事件结果通过事件函数响应
    _stepper.continuous=YES;
    //添加事件
    [_stepper addTarget:self action:@selector(stepChange) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_stepper];
    //创建分栏控件
    _segControl=[[UISegmentedControl alloc]init];
    _segControl.frame=CGRectMake(10, 200, 200, 40);
    //添加一个按键元素
    [_segControl insertSegmentWithImage:@"0元" atIndex:0 animated:NO];
    
    [_segControl insertSegmentWithImage:@"5元" atIndex:1 animated:NO];
     [_segControl insertSegmentWithImage:@"10元" atIndex:1 animated:NO];
     [_segControl insertSegmentWithImage:@"30元" atIndex:1 animated:NO];
    //当前按钮的索引设置
    _segControl.selectedSegmentIndex=2;
    [_segControl addTarget:self action:@selector(segChange) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segControl];
    
    
}
-(void) stepChange
{
    NSLog(@"Step change! value=%f",_stepper.value);
}
-(void)segChange
{
    //
    NSLog(@"%ld",_segControl.selectedSegmentIndex);
}
@end
