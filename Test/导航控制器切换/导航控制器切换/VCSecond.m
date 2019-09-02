//
//  VCSecond.m
//  导航控制器切换
//
//  Created by Civet on 2019/7/30.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "VCSecond.h"
#import "VCThird.h"
@interface VCSecond ()

@end

@implementation VCSecond

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置第二视图属性
    self.view.backgroundColor=[UIColor greenColor];
    self.title=@"第二视图";
    //调用按钮函数
    UIBarButtonItem* btnNext=[[UIBarButtonItem alloc] initWithTitle:@"第三极" style:UIBarButtonItemStylePlain target:self action:@selector(pressNext)];
    
    
    self.navigationItem.rightBarButtonItem=btnNext;
    
}
-(void) pressNext
{
    VCThird* vcThird=[[VCThird alloc] init ];
    //创建新的试图控制器
    [self.navigationController pushViewController:vcThird animated:YES];}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
