//
//  ViewController.h
//  音频播放
//
//  Created by Civet on 2019/8/2.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <UIKit/UIKit.h>
//导入音频视频播放系统库文件
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController
//音频播放协议
<AVAudioPlayerDelegate>
{
    //播放按钮
    UIButton* _btnPlay;
    //暂停播放
    UIButton* _btnPause;
    //停止播放
    UIButton* _btnStop;
    //音乐播放进度条视图
    UIProgressView* _musicProgrtess;
    //声音大小调整滑动条
    UISlider* _volumeSlider;
    //静音开关
    UISwitch* _vomumOn;
    //音频播放器对象
    AVAudioPlayer * _player;
    //定义声明一个定时器对象
    NSTimer* _timer;
}
@end

