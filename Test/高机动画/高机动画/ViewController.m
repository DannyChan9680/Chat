//
//  ViewController.m
//  高机动画
//
//  Created by Civet on 2019/8/2.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"
//动画管理类头文件
#import "HMGLTransitionManager.h"
//开门3D动画类型
#import "DoorsTransition.h"
//模拟布匹的动画类型
#import "ClothTransition.h"
//3D变换动画类型
#import "Switch3DTransition.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _parentView=[[UIView alloc] init];
    
    _parentView.frame=CGRectMake(50, 50, 300, 300);
    
    [self.view addSubview:_parentView];
    
    _parentView.backgroundColor=[UIColor redColor];
    
    _imageView01=[[UIImageView alloc] init];
    
    _imageView01.frame=CGRectMake(0, 0, 300, 300);
    
    _imageView01.image=[UIImage imageNamed:@"UNADJUSTEDNONRAW_thumb_1.jpg"];
    
    _imageView02=[[UIImageView alloc] init];
    
    _imageView02.frame=CGRectMake(0, 0, 300, 300);
    
    _imageView02.image=[UIImage imageNamed:@"UNADJUSTEDNONRAW_thumb_2.jpg"];
    
    [_parentView addSubview:_imageView01];
    
    
}
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self animMove];
}

-(void) animMove
{
    HMGLTransitionManager * manager=[HMGLTransitionManager sharedTransitionManager ];
    //动画变换对象
    Switch3DTransition* sAnim=[[Switch3DTransition alloc] init];
    //设置动画的方向类型
    [sAnim setTransitionType:Switch3DTransitionLeft];
    
    //动画类型2,开门动画
    DoorsTransition * door=[[DoorsTransition alloc] init];
    //设置动画的方向类型
    [door setTransitionType:DoorsTransitionTypeOpen];
    //设置动画类型
    [manager setTransition:door];
    //动画类型3，画布动画
    ClothTransition* cloth=[[ClothTransition alloc] init];
    //设置动画类型
    //[manager setTransition:cloth];
    //设置动画类型
    //[manager setTransition:sAnim];
    //设置动画视图的容器对象
    [manager beginTransition:_parentView];
    
    static BOOL isFirst=YES;
    if(isFirst)
    {
        //使第一个图像视图消失
        [_imageView01 removeFromSuperview];
        _imageView02.frame=_imageView01.frame;
        //将视图2添加到图像容器当中
        [_parentView  addSubview:_imageView02];
        
    }
    else
    {
        //使第一个图像视图消失
        [_imageView02 removeFromSuperview];
        _imageView01.frame=_imageView02.frame;
        //将视图2添加到图像容器当中
        [_parentView  addSubview:_imageView01];
        
    }
    isFirst=!isFirst;
    //提交动画运行效果
    [manager commitTransition];
}
@end
