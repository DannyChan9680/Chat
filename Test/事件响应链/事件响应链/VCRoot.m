//
//  VCRoot.m
//  事件响应链
//
//  Created by Civet on 2019/8/5.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "VCRoot.h"
#import "MyWindow.h"
@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //主视图创建
    _mainView=[[mainView alloc] init];
    
    _mainView.frame=CGRectMake(100, 100, 300, 300);
    
    _mainView.backgroundColor=[UIColor orangeColor];
    
    //子视图创建
    _subView=[[SubView alloc] init];
    
    _subView.frame= CGRectMake(80, 80, 200, 200);
    
    _subView.backgroundColor=[UIColor redColor];
    
    [self.view addSubview:_mainView];
    [self.view addSubview:_subView];
    
    self.view.backgroundColor=[UIColor blueColor];
}
//点击屏幕时，调用此函数
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"VCRoot 事件响应 next==%@", self.nextResponder);
    //手动向下传递
    [super  touchesBegan:touches withEvent:event];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
