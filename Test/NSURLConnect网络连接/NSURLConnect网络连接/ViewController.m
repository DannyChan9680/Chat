//
//  ViewController.m
//  NSURLConnect网络连接
//
//  Created by Civet on 2019/8/1.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //
    UIButton* btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    btn.frame=CGRectMake(100, 100, 80, 40);
    
    [btn setTitle:@"连接数据" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}
-(void)pressBtn
{
    NSLog(@"press Btn");
    //定义一个字符串
    NSString* str=@"https://www.baidu.com";
    
    NSURL *url=[NSURL URLWithString:str];
    //定义一个连接请求对象，在连接之前的信息的封装
    NSURLRequest* request=[NSURLRequest requestWithURL:url];
    //创建一个网络连接对象，参数1为连接的请求对象，参数2为代理对象，用来实现回传数据的代理协议
    _connect=[NSURLConnection  connectionWithRequest:request delegate:self];
    
}
//处理错误信息的代理协议
//如果有任何的连接错误，调用此协议，进行错误打印查看
-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error =%@",error);
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //将响应码转换成http响应码
    NSHTTPURLResponse* res=(NSHTTPURLResponse*)response;
    
    if(res.statusCode==200)
    {
        NSLog(@"连接成功！服务器正常");
        
    }
    else if(res.statusCode==404)
    {
        NSLog(@"服务期正常开启，没有找到链接地址页面或数据");
        
    }
    else if(res.statusCode==500)
    {
        NSLog(@"服务器宕机或关机");
    }
}
//接收服务器回传的数据时调用
-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //将每次回传的数据华为字符串数据
    [_data appendData:data];
}
-(void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    //将二进制数据转化成字符串数据
    NSString * str=[[NSString alloc] initWithData:_data encoding:NSUTF8StringEncoding];
    NSLog(@"baidui page =%@",str);
}
@end
