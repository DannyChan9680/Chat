//
//  ViewController.h
//  视频播放2
//
//  Created by Civet on 2019/8/7.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <UIKit/UIKit.h>
//第一步:引用MediaPlayer框架，声明视图控制器属性PlayerController
#import <MediaPlayer/MediaPlayer.h>
@interface ViewController : UIViewController



@property(nonatomic,strong) MPMoviePlayerController *playerController;
@end

