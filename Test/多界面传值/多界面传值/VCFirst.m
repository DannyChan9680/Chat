//
//  VCFirst.m
//  多界面传值
//
//  Created by Civet on 2019/7/31.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "VCFirst.h"
#import "VCSecond.h"
@interface VCFirst ()

@end

@implementation VCFirst

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//推出视图控制器二
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    VCSecond* vc=[[VCSecond alloc ] init];
    
    vc.view.backgroundColor=[UIColor yellowColor];
    //将当前控制器作为代理对象赋值
    vc.delegate=self;
    
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(void) changeColor:(UIColor *)color
{
    self.view.backgroundColor=color;
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
