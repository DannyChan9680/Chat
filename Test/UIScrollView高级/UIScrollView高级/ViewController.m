//
//  ViewController.m
//  UIScrollView高级
//
//  Created by Civet on 2019/7/29.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置滚动视图
    _scrollView=[[UIScrollView alloc]init];
    _scrollView.frame=CGRectMake(10, 50, 300, 400);
    _scrollView.bounces=NO;
    //是否允许通过点击屏幕让滚动视图响应事件
    _scrollView.userInteractionEnabled=NO;
    //设置画布大小
    _scrollView.contentSize=CGSizeMake(300, 400);
    
    for(int i=1; i<3;i++)
    {
        NSString* strName=[NSString stringWithFormat:@"%d.JPG",i++];
        UIImage* image=[UIImage imageNamed:strName];
        
        UIImageView* iView=[[UIImageView alloc] init];
        iView.image=image;
        iView.frame=CGRectMake(0, 400*i, 500, 1000);
        
        [_scrollView addSubview:iView];
        
    }
    [self.view addSubview:_scrollView];
    
    _scrollView.pagingEnabled=NO;
    //设置滚动视图画布的偏移位置
    _scrollView.contentOffset=CGPointMake(0, 0);
    
    //将当前视图控制器作为代理对象
    _scrollView.delegate=self;

}
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_scrollView scrollRectToVisible:CGRectMake(0, 0, 500, 1000) animated:YES];
}
//显示视图拖动时的纵坐标数值
-(void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    NSLog(@"y= %f",scrollView.contentOffset.y);
    
}
//当滚动视图结束是调用此函数
-(void)scrollViewDidEndDragging:(UIScrollView*) scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"Did End Drag");
}
//滚动视图即将开始拖动时调用
-(void)scrollViewWillBeginDragging:(UIScrollView*)scrollView

{
    NSLog(@"WillBeginDrag");
}
//视图即将结束拖动时调用
-(void)scrollViewWillEndDragging:(UIScrollView*)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout nonnull CGPoint *)targetContentOffset
{
    NSLog(@" will end Drag");
    
}
//视图减速时调用
-(void)scrollViewWillBeginDecelerating:(UIScrollView*)scrollView
{
    NSLog(@"will Begin Decelerating");
}
//视图停止时调用
-(void)scrollViewDidEndDecelerating:(UIScrollView*)scrollView
{
    NSLog(@"视图停止");
}
//调用警告函数
-(void)didRecevieMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
