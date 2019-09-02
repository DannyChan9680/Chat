//
//  ViewController.h
//  UIGesture高级
//
//  Created by Civet on 2019/7/29.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>
{
    //定义一个可以对视图进行放大缩小的缩放手势
    //pinch:捏合手势
    UIPinchGestureRecognizer* _pinchGes;
    //定义一个旋转手势
    UIRotationGestureRecognizer* _rotGes;
}

@end

