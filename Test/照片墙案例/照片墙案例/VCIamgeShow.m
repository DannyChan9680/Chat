//
//  VCIamgeShow.m
//  照片墙案例
//
//  Created by Civet on 2019/7/30.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "VCIamgeShow.h"

@interface VCIamgeShow ()

@end

@implementation VCIamgeShow

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"图片展示";
    _imageView=[[UIImageView alloc] init];
    _imageView.frame=CGRectMake(0, 0, 400, 500);
    //一个视图对象只能有一个根视图
    _imageView.image=_image;
    _imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"UNADJUSTEDNONRAW_thumb_4.jpg",_imageTag-100]];
    [self.view addSubview:_imageView];
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
