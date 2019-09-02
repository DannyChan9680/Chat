//
//  VCsecond.m
//  导航器控制动画
//
//  Created by Civet on 2019/8/2.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "VCsecond.h"

@interface VCsecond ()

@end

@implementation VCsecond

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title=@"控制器二";
    _imageView=[[UIImageView alloc] init];
    _imageView.frame=CGRectMake(40, 40, 300, 300);
    
    _imageView.image=[UIImage imageNamed:@"UNADJUSTEDNONRAW_thumb_2.jpg"];
    
    [self.view addSubview:_imageView];
    self.view.backgroundColor=[UIColor whiteColor];
}
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CATransition* ami=[CATransition animation];
    
    ami.duration=5;
    
    ami.type=@"rippleEffect";
    
    ami.subtype=kCATransitionFromRight;
    
    [self.navigationController.view.layer addAnimation:ami forKey:nil]; 
    
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
