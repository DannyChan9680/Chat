//
//  VCIamgeShow.h
//  照片墙案例
//
//  Created by Civet on 2019/7/30.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VCIamgeShow : UIViewController

//创建视图的tag
@property (nonatomic,assign) NSUInteger imageTag;
//创建图像对象
@property (retain ,nonatomic) UIImage * image;
//创建图像视图对象
@property(retain ,nonatomic) UIImageView *imageView;
@end

NS_ASSUME_NONNULL_END
