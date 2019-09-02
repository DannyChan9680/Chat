//
//  ViewController.m
//  视频播放2
//
//  Created by Civet on 2019/8/7.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //第二步：获取视频路径，创建播放器
     //网络视频路径
    NSString *webVideoPath = @"http://api.junqingguanchashi.net/yunpan/bd/c.php?vid=/junqing/1115.mp4";
    NSURL *webVideoUrl = [NSURL URLWithString:webVideoPath];
    self.playerController =[[MPMoviePlayerController alloc]initWithContentURL:webVideoUrl];
    
    //第三步：设置Frame将播放器View添加到视图控制器View上
    self.playerController.view.frame = CGRectMake(50, 50, 300, 300);
    
    [self.view addSubview: self.playerController.view];
    //第四步：设置播放器属性
    //设置控制面板风格:无，嵌入，全屏，默认
    self.playerController.controlStyle = MPMovieControlStyleDefault;
    //设置是否自动播放(默认为YES）
    self.playerController.shouldAutoplay = NO;
    //设置播放器显示模式，类似于图片的处理，设置Fill有可能造成部分区域被裁剪
    self.playerController.scalingMode = MPMovieScalingModeAspectFit;
    //设置重复模式
    self.playerController.repeatMode = MPMovieRepeatModeOne;
    
    //第五步：播放视频
    //播放前的准备，会中断当前正在活跃的音频会话
    [ self.playerController  prepareToPlay];
    //播放视频，设置了自动播放之后可以不调用此方法
    //[ self.playerController  play];
    

}
//第六步：在退出界面的时候，关闭播放器，移除通知
- (void)dealloc{
    //当前视图控制器pop之后并不会关闭播放，需要手动关闭
    [self.playerController stop];
    self.playerController = nil;
    //移除播放器相关的通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
