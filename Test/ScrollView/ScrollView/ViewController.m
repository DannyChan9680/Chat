//
//  ViewController.m
//  ScrollView
//
//  Created by Civet on 2019/10/11.
//  Copyright © 2019 limeixiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView * scrollview=[[UIScrollView alloc] init];
    UIImageView * imageView=[[UIImageView alloc] init];
    imageView.image=[UIImage imageNamed:@"1.jpg"];
    //为滚动视图添加内容图片
    [scrollview addSubview:imageView];
    scrollview.contentSize=imageView.frame.size;
    [self.view addSubview:scrollview];
    
    
    // Do any additional setup after loading the view.
}


@end
