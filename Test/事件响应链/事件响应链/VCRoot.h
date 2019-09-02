//
//  VCRoot.h
//  事件响应链
//
//  Created by Civet on 2019/8/5.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mainView.h"
#import "SubView.h"
NS_ASSUME_NONNULL_BEGIN

@interface VCRoot : UIViewController

{
    //主视图定义
    mainView * _mainView;
    //子视图定义
    SubView* _subView;
}
@end

NS_ASSUME_NONNULL_END
