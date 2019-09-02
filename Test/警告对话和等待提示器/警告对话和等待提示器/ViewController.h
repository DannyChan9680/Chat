//
//  ViewController.h
//  警告对话和等待提示器
//
//  Created by Civet on 2019/7/26.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UIAlertView* _alertView;
    
    UIActivityIndicatorView* _activityIndicater;
}
@property (retain, nonatomic) UIAlertView* alertView;
@property (retain,nonatomic) UIActivityIndicatorView* activityINdicater;
@end

