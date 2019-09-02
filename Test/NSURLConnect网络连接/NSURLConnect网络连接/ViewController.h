//
//  ViewController.h
//  NSURLConnect网络连接
//
//  Created by Civet on 2019/8/1.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

<
//连接数据库对象的数据代理协议，当回传数据时使用的协议
NSURLConnectionDelegate,
//连接服务的普通代理协议，作为错误处理等普通协议完成
NSURLConnectionDataDelegate>
{
    //定义一个URL连接对象，y通过网络地址，可以进行连接工作
    //按照http协议来进行数据传输
    NSURLConnection* _connect;
    //创建一个可变二级制数据对象，接收服务器传回的数据
    NSMutableData* _data;
}
@end

