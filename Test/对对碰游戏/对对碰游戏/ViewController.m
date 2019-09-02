//
//  ViewController.m
//  对对碰游戏
//
//  Created by Civet on 2019/8/5.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void) startGame
{
    NSMutableArray * arrstr =[[NSMutableArray alloc] init];
    
    for(int k= 0;k<18; k++)
    {
        int random=arc4random()%3+1;
        
        NSString* strName=[NSString stringWithFormat:@"%d.jpg",random];
        //添加数据到数组
        [arrstr addObject:strName];
        [arrstr addObject:strName];
        
    }
    //循环创建36个按钮
    for(int i=0 ;i<6; i++)
    {
        for(int j=0 ;j<6 ;j++)
        {
            //创建自定义按钮
            UIButton* btn= [UIButton buttonWithType:UIButtonTypeCustom];
            
            [UIView beginAnimations:nil context:nil];
            
            [UIView setAnimationDuration:3];
            //设置按钮位置
            btn.frame=CGRectMake(50+50*j, 100+50*i, 50, 50);
            
            [UIView commitAnimations];
            //产生随机图片
            int indexrandom=arc4random()% arrstr.count;
            //从数组中读取读取图像名称
            NSString* strImage=arrstr[indexrandom];
            
            [arrstr removeObjectAtIndex:indexrandom];
            NSInteger tag=[strImage integerValue];
 
            UIImage* image=[UIImage imageNamed:strImage];
            
            [btn setImage:image forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.view addSubview:btn];
         //将按钮的标志位置赋值
          btn.tag=tag;
        }
    }
    self.view.backgroundColor=[UIColor blackColor];
}
-(void) pressBtn:(UIButton *) btn
{
    static UIButton * btnFisrt=nil;
    
    if(btnFisrt==nil)
    {
        btnFisrt=btn;
        
        //锁定第一个按钮
        btnFisrt.enabled=NO;
    }
    else
    {
        //两个按钮图像相同
      if(btnFisrt.tag==btn.tag)
      {
          btnFisrt.hidden=YES;
          btn.hidden=YES;
          btnFisrt=nil;
      }
        //按钮图像不相同
        else
        {
            btnFisrt.enabled=YES;

            btnFisrt=nil;
        }
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //调用游戏开始函数
    [self startGame];
}


@end
