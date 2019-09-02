//
//  VCRoot.m
//  照片墙案例
//
//  Created by Civet on 2019/7/30.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "VCRoot.h"
#import "VCIamgeShow.h"
@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"照片墙";
    //z设置导航不透明
    self.navigationController.navigationBar.translucent=NO;
    //
    UIScrollView* sv=[[UIScrollView alloc] init];
    //设置位置
    sv.frame=CGRectMake(5, 10, 300, 400);
    //设置画布大小
    sv.contentSize=CGSizeMake(300, 480*1.5);
    
    sv.userInteractionEnabled=YES;
    self.view.backgroundColor=[UIColor whiteColor];
    for(int i=0; i<15; i++)
    {
        NSString * strName=[NSString stringWithFormat:@"UNADJUSTEDNONRAW_thumb_%d.jpg",i+1];
        UIImage *image=[UIImage imageNamed:strName];
        
        UIImageView* iView=[[UIImageView alloc] initWithImage:image];
        
        iView.frame=CGRectMake((i%3)*300+3, (i/3)*70, 80, 130);
        
        [sv addSubview:iView];
        //开启交互模式
        iView.userInteractionEnabled=YES;
        
        UITapGestureRecognizer* tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressTap:)];
        
        //单次点击
        tap.numberOfTapsRequired=1;
        [iView addGestureRecognizer:tap];
        iView.tag=101+i;
    }
    [self.view addSubview:sv];
}
-(void) pressTap:(UITapGestureRecognizer*) tap
{
    UIImageView* imageView=(UIImageView*)tap.view ;
    
    //创建显示视图控制器
    VCIamgeShow* imageShow=[[VCIamgeShow alloc] init];
    
    imageShow.imageTag=imageView.tag;
    
    [self.navigationController pushViewController:imageShow animated:YES];
}
/*//方法2
-(void) pressTap:(UITapGestureRecognizer*) tap
{
    UIImageView* imageView=(UIImageView*)tap.view ;
    
    //创建显示视图控制器
    VCIamgeShow* imageShow=[[VCIamgeShow alloc] init];
    
    imageShow.imageView=imageView;
    
    [self.navigationController pushViewController:imageShow animated:YES];
}*/
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
