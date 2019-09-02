//
//  ViewController.m
//  AFNetwork网络库
//
//  Created by Civet on 2019/8/1.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self AFNetMonitor];
    [self AFGetData];
}
-(void) AFGetData
{
    //创建http连接管理对象
    AFHTTPSessionManager * session=[AFHTTPSessionManager manager];
    NSString* path=[NSString stringWithFormat:@"https://api.douban.com/book/subjects?q=ios&alt=json&apikey=01987f93c544bbfb04c97ebb4fce33f1"];
    //GET 方法获取服务器的数据
    //GET ：通过GET方法
    //p1: 参数传入一个URL对象
    //p2:通过指定的结构传入参数
    //p3:指定下载的进度条UI
    //p4:下载成功数据后调用此block语法块，pp1:下载任务线程 pp2:返回数据内容
    //p5:下载失败后调用的语法，pp1:下载任务线程 pp2:返回数据内容
    [session GET: path parameters: nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"下载成功");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"下载失败");
    }];

}
-(void) AFNetMonitor
{
    //检查网络连接的状态
    //AFNetworkReachabilityManager  网络连接检测管理类
    //开启网络状态的监控器
    //sharedManager :获取唯一的单列对象
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    //获取网络连接结果
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch(status)
        {
            case AFNetworkReachabilityStatusNotReachable:
            {  NSLog(@"无网络连接");
                break;
            }
            case  AFNetworkReachabilityStatusReachableViaWiFi:
            {
                NSLog(@"通过wifi连接的网络");
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                NSLog(@"通过移动网络，4G");
                break;
            }
            default:
                break;
        }
    }];
}

@end
