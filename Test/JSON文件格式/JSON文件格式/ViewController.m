//
//  ViewController.m
//  JSON文件格式
//
//  Created by Civet on 2019/7/31.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//数组字典
static NSDictionary * dic;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //获取json文件在手机中的路径
    //mainBoundle获取主资源包
    //pathForResource获取json文件的全部路径
    NSString * path=[[NSBundle mainBundle] pathForResource:@"json文件名" ofType:@"json"];
    //将文件读取出来，作为二进制文件存储到内存中，返回值为二进制文件格式
    NSData* dataJson=[NSData dataWithContentsOfFile:path];
    
    //NSJSONSerialization ：数组解析类，参数1为w而禁止的数据对象，参数2为解析方式，默认是解析方式解析，参数3为错误信息对象
    //返回值为你解析后的数据保存在字典中返回
    dic=[NSJSONSerialization JSONObjectWithData:dataJson options:NSJSONReadingMutableContainers error:nil];
    
}
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"dataJson =%@",dic);
}

@end
