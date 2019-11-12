//
//  ViewController.m
//  富文本
//
//  Created by Civet on 2019/10/8.
//  Copyright © 2019 limeixiang. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //这是label
    UILabel *label=[[UILabel alloc] init];
    label.text=@"花有重开时，人无再少年，点击此链接";
    label.numberOfLines=0;
    label.textColor=[UIColor blackColor];
//    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(100);
        make.centerX.equalTo(self.view.mas_centerX);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
    }];
    NSMutableAttributedString * abs=[[NSMutableAttributedString alloc] initWithString:label.text];
    //将label设置为富文本(设置富文本的字体大小)
    [abs addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:20] range:NSMakeRange(0, label.text.length)];
//    //设置富文本的字体颜色
//    [abs addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, label.text.length-2)];
//    //设置富文本的背景颜色
//    [abs addAttribute:NSBackgroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, label.text.length)];

    //设置富文本字体风格
    NSMutableParagraphStyle *style=[[NSMutableParagraphStyle alloc] init];
    //设置字体行间距
    style.lineSpacing=5;
    //设置首行缩进
    style.firstLineHeadIndent=40.0f;
    //设置对齐方式
    style.alignment=NSTextAlignmentJustified;
    //设置文本阴影
    NSShadow * shadow=[[NSShadow alloc] init];
    //阴影偏移量
    shadow.shadowOffset=CGSizeMake(1, 5);
    //阴影颜色
    shadow.shadowColor=[UIColor blueColor];
    //设置阴影模糊度
    shadow.shadowBlurRadius=10;
    
    [abs addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, label.text.length)];
    //设置文本字体间距
    [abs addAttribute:NSKernAttributeName value:@(3) range:NSMakeRange(0, label.text.length)];
    //文本添加删除线(添加1条删除线)
//    [abs addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:NSMakeRange(0, label.text.length)];
    //添加下划线
//    [abs addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:NSMakeRange(0, label.text.length)];
    //对文本进行描边(正值镂空，负值描边)
//    [abs addAttribute:NSStrokeWidthAttributeName value:@(-5) range:NSMakeRange(0, label.text.length)];
//    [abs addAttribute:NSStrokeColorAttributeName value:[UIColor redColor] range:NSMakeRange(0,label.text.length)];
//    //添加阴影
//    [abs addAttribute:NSShadowAttributeName value:shadow range:NSMakeRange(0, label.text.length)];
    //添加链接
    [abs addAttribute:NSLinkAttributeName value:[NSURL URLWithString:@"http://www.baidu.com"] range:NSMakeRange(label.text.length-5,5)];
    
    label.attributedText=abs;
}


@end
