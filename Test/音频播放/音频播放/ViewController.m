//
//  ViewController.m
//  音频播放
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
    //创建播放按钮
    _btnPlay=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    _btnPlay.frame=CGRectMake(100, 100, 80, 40);
    
    [_btnPlay setTitle:@"播放" forState:UIControlStateNormal];
    
    [_btnPlay addTarget:self action:@selector(pressPlay) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_btnPlay];
    
    //创建暂停按钮
    _btnPause=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    _btnPause.frame=CGRectMake(100, 150, 80, 40);
    
    [_btnPause setTitle:@"暂停" forState:UIControlStateNormal];
    
    [_btnPause addTarget:self action:@selector(pressPause) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_btnPause];
    //创建停止按钮
    _btnStop=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    _btnStop.frame=CGRectMake(100, 200, 80, 40);
    
    [_btnStop setTitle:@"停止" forState:UIControlStateNormal];
    
    [_btnStop addTarget:self action:@selector(pressStop) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_btnStop];
    
    _musicProgrtess=[[UIProgressView alloc] init];
    
    _musicProgrtess.frame=CGRectMake(50, 300, 300, 20);
    
    _musicProgrtess.progress=0;
    
    //创建声音滑动条
    _volumeSlider=[[UISlider alloc] init];
    
    _volumeSlider.frame=CGRectMake(50, 380, 300, 20);
    
    _volumeSlider.maximumValue=100;
    _volumeSlider.minimumValue=0;
    
    [_volumeSlider addTarget:self action:@selector(valumeChange:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_musicProgrtess];
    [self.view addSubview:_volumeSlider];
    [self createAVPlayer];
    
}
-(void) createAVPlayer
{
    NSString* str=[[NSBundle mainBundle] pathForResource:@"001" ofType:@"mp3"];
    //将字符串转换成url
    NSURL* urlMusic=[NSURL URLWithString:str];
    NSLog(@" url =%@",urlMusic);
    //创建音频播放器对象
    //p1:文件名
    //p2:扩展名
    _player=[[AVAudioPlayer alloc] initWithContentsOfURL:urlMusic error:nil];
    
    //准备播放，解码工作
    [_player prepareToPlay];
    
    //循环播放的次数
    //-1：无限循环
    _player.numberOfLoops=1;
    
    //设置声音大小
    _player.volume=0.1;
    
    //定义一个定时器对象
    //更能新进度条
    _timer=[NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(update) userInfo:nil repeats:YES];
}
-(void) update
{
    NSLog(@"111");
    _musicProgrtess.progress=_player.currentTime/_player.duration;
}
//播放函数
-(void) pressPlay
{
    NSLog(@"播放");
    [_player play];
}
//暂停函数
-(void) pressPause
{
    NSLog(@"暂停");
    [_player pause];
}
//停止函数
-(void) pressStop
{
    NSLog(@"停止");
    [_player stop];
    //当前播放事件清零
    _player.currentTime=0;
}
-(void) valumeChange:(UISlider*) slider
{
    NSLog(@" %f",slider.value);
    //设置音量大小
    _player.volume=slider.value/100;
}

@end
