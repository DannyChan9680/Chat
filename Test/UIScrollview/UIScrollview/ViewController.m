//
//  ViewController.m
//  UIScrollview
//
//  Created by Civet on 2019/7/29.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建滚动视图
    UIScrollView* sv=[[UIScrollView alloc] init];
    sv.frame=CGRectMake(0, 0, 450, 900);
    //是否按照整页来滚动视图
    sv.pagingEnabled=YES;
    //是否开启滚动效果
    sv.scrollEnabled=YES;
    //设置画布大小
    sv.contentSize=CGSizeMake(320*5,576);
    //设置边缘弹动效果
    sv.bounces=YES;
    //设置横向弹动效果
    sv.alwaysBounceHorizontal=YES;
    //设置纵向y弹动效果
    sv.alwaysBounceVertical=YES;
    //设置横纵向滚动条
    sv.showsVerticalScrollIndicator=YES;
    sv.showsHorizontalScrollIndicator=YES;
    //设置背景颜色
    sv.backgroundColor=[UIColor orangeColor];
    for(int i=0; i<5 ;i++)
    {
        NSString* strName=[NSString stringWithFormat:@"1.jpg",i+1];
        UIImage* image=[UIImage imageNamed:strName];
        
        UIImageView* iView=[[UIImageView alloc] initWithImage:image];
        
        iView.frame=CGRectMake(320*i, 0, 320, 576);
        
        [sv addSubview:iView];
    }
    
    [self.view addSubview:sv];
}


@end
