//
//  mainView.m
//  事件响应链
//
//  Created by Civet on 2019/8/5.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "mainView.h"

@implementation mainView
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"MainView 事件响应 next==%@", self.nextResponder);
    //手动向下传递
   [super  touchesBegan:touches withEvent:event];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
