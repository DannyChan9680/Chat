//
//  VCThird.m
//  导航控制器切换
//
//  Created by Civet on 2019/7/30.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "VCThird.h"

@interface VCThird ()

@end

@implementation VCThird

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置第三视图属性
    self.view.backgroundColor=[UIColor purpleColor];
    self.title=@"第三视图";
    //设置左侧按钮属性
    UIBarButtonItem *btnLeft=[[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(pressBack )];
    self.navigationItem.leftBarButtonItem=btnLeft;
    
}
-(void)pressBack
{
    //将当前的视图控制器弹出，返回上一级页面
    [self.navigationController popViewControllerAnimated:YES];
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
