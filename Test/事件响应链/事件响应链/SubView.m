//
//  SubView.m
//  事件响应链
//
//  Created by Civet on 2019/8/5.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "SubView.h"

@implementation SubView

//在子视图中的优先级最高
//当事件响应后，事件到此结束
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    NSLog(@" SubView 事件响应  next==%@", self.nextResponder);
    //手动向下传递
    [super  touchesBegan:touches  withEvent:event];
}
@end
