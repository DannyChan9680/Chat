//
//  ViewController.m
//  NSOperation
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
    for(int i=0; i<2;i++)
    {
        UIButton* btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        btn.frame=CGRectMake(100, 100+i*80, 80, 40);
        [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.tag=101+i;
        
        if(i==0)
        {
            [btn setTitle:@"添加新任务1到队列中" forState:UIControlStateNormal];
        }
        else if(i==1)
        {
            [btn setTitle:@"添加任务2到队列中" forState:UIControlStateNormal];
        }
        [self.view addSubview:btn];
    }
    //创建一个任务队列
    _queue=[[NSOperationQueue alloc] init];
    //设置最大并发任务的数量
    [_queue setMaxConcurrentOperationCount:5];
}
-(void) pressBtn:(UIButton*) btn
{
    if(btn.tag==101)
    {
        //创建一个执行任务
        //p1；任务函数的拥有者
        //p2:任务函数执行体
        //p3:任意数
        NSInvocationOperation* iop=[[NSInvocationOperation alloc ] initWithTarget:self selector:@selector(optAct01:) object:@"OPT01"];
        [_queue addOperation:iop];
        //方法二来实现任务
        NSInvocation* invo=[[NSInvocation alloc] init];
        
        invo.target=self;
        
        invo.selector=@selector(optAct01:);
        NSInvocationOperation* iop02=[[NSInvocationOperation alloc] initWithInvocation:invo];
        
        [_queue addOperation:iop02];
    }
    else if(btn.tag==102)
    {
        //使用block语法块来进行任务处理
        [_queue addOperationWithBlock:^{
            while(true)
            {
                NSLog(@"Block Opt");
            }
        }];
    }
}
-(void) optAct01:(NSInvocationOperation*) opt
{
    while(true)
    {
        NSLog(@"opt 01");
    }
}
@end
