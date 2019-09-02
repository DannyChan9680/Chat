//
//  ViewController.h
//  UISilder和UIProgressView
//
//  Created by Civet on 2019/7/26.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    //进度条对象
    UIProgressView* _progressView;
    //滑动条对象
    UISlider* _slider;
    
}
@property (retain,nonatomic)UIProgressView* pView;

@property (retain,nonatomic)UISlider* pSlider;

@end

