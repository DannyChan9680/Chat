//
//  ViewController.h
//  视频播放
//
//  Created by Civet on 2019/8/2.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <UIKit/UIKit.h>
//导入苹果官方的播放器头文件
//主要封装了音频视频的播放器
//封装了播放音频视频编码解码基础类库
#import <MediaPlayer/MediaPlayer.h>
@interface ViewController : UIViewController

{
    //定义一个播放器对象
    MPMoviePlayerController*  _playerController;
    //定义一个播放器视图控制器
    MPMoviePlayerViewController*  _playerView;
    
}
@end

