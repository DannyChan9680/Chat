//
//  VCFirst.h
//  多界面传值
//
//  Created by Civet on 2019/7/31.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCSecond.h"
NS_ASSUME_NONNULL_BEGIN

@interface VCFirst : UIViewController <VCSecondDelegate>

-(void) changeColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
