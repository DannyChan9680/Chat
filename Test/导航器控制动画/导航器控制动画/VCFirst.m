//
//  VCFirst.m
//  导航器控制动画
//
//  Created by Civet on 2019/8/2.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "VCFirst.h"
#import "VCsecond.h"
@interface VCFirst ()

@end

@implementation VCFirst

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _imageView=[[UIImageView alloc] init];
    
    _imageView.frame=CGRectMake(40,40, 300, 300);
    
    _imageView.image=[UIImage imageNamed:@"UNADJUSTEDNONRAW_thumb_1.jpg"];
    
    [self.view addSubview:_imageView];
    self.view.backgroundColor=[UIColor whiteColor];   
}
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //定义一个动画变换对象，
    CATransition* amin=[CATransition animation];
    //设置动画的时间长度
    amin.duration=5;
    //设置动画类型，决定动画的效果形式
    amin.type=@"rippleEffect";
    //设置动画的子类型，例如动画方向
    amin.subtype=kCATransitionFromLeft;
    //设置动画的轨迹模式
    amin.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //将动画设置对象添加到动画上
    [self.navigationController.view.layer addAnimation:amin forKey:nil];
     //创建视图控制器二
    VCsecond* vcSecond=[[VCsecond alloc] init];
    //推出目标前台提示
    [self.navigationController pushViewController:vcSecond animated:YES];
    
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
