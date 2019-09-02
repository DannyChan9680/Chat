//
//  ViewController.h
//  步进器和分栏控件
//
//  Created by Civet on 2019/7/26.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    //定义步进器，按照一定的数字来调整某个数据
    UIStepper* _stepper;
    UISegmentedControl* _segControl;
}
//属性的定义
@property (retain,nonatomic) UISegmentedControl* segControl;
@property (retain,nonatomic) UIStepper* stepper;

@end

