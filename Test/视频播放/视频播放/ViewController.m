//
//  ViewController.m
//  视频播放
//
//  Created by Civet on 2019/8/2.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
}
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //创建一个字符串，用于保存视频网络地址
    NSString* strURL=@"https://www.bilibili.com/video/av62352494.mp4";
    //将字符串地址转化成网址链接
    NSURL* url=[NSURL URLWithString:strURL];
    //创建一个视图播放器对象
    //p1:通过一个有效的网络视频地址作为播放参数
    _playerController=[[MPMoviePlayerViewController alloc] init];
    //将视频播放视图的大小赋值
    _playerController.view.frame=CGRectMake(100, 100, 300, 300);
    //视频下载后的处理编编解码过程
    [_playerController prepareToPlay];
    //将播放器添加到当前视图上显示
//    [self.view addSubview:_playerController.view];
    
    _playerView=[[MPMoviePlayerViewController alloc] init];
    _playerView.view.frame=self.view.bounds;
    
    [self.view addSubview:_playerView];
}

-(void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
