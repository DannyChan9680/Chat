//
//  VCRoot.m
//  导航控制器切换
//
//  Created by Civet on 2019/7/30.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "VCRoot.h"
#import "VCSecond.h"
@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置导航器的透明度
    self.navigationController.navigationBar.translucent=NO;
    //设置导航栏风格颜色
    self.navigationController.navigationBar.barStyle=UIBarStyleDefault;
    
    self.view.backgroundColor=[UIColor orangeColor];
    
    self.title=@"根视图";
    //调用按钮函数
    UIBarButtonItem * next=[[UIBarButtonItem alloc] initWithTitle:@" 下一级" style:UIBarButtonItemStylePlain target:self action:@selector(pressNext)];
    self.navigationItem.rightBarButtonItem=next;
}
-(void) pressNext
{
    VCSecond* vcSecond=[[VCSecond alloc] init ];
     //创建新的试图控制器
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
