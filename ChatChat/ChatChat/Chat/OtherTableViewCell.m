//
//  OtherTableViewCell.m
//  ChatChat
//
//  Created by Civet on 2019/8/26.
//  Copyright © 2019 limeixiang. All rights reserved.
//

#import "OtherTableViewCell.h"
#import "Masonry.h"
#import "Contants.h"
@implementation OtherTableViewCell

-(UIImageView *)iconImageView{
    
    if (_iconImageView==nil) {
        _iconImageView=[UIImageView new];
        _iconImageView.layer.cornerRadius=30;
        _iconImageView.layer.masksToBounds=YES;
        _iconImageView.image=[UIImage imageNamed:@"屏幕快照 2017-08-10 下午4.05.01"];
    }
    return _iconImageView;
}

-(UILabel *)nameLabel{
    
    if (_nameLabel==nil) {
        _nameLabel=[UILabel new];
        _nameLabel.textColor=[UIColor lightGrayColor];
        _nameLabel.font=[UIFont systemFontOfSize:15];
        _nameLabel.textAlignment=NSTextAlignmentLeft;
    }
    return _nameLabel;
}

-(UILabel *)contentLabel{
    
    if (_contentLabel==nil) {
        _contentLabel=[UILabel new];
        _contentLabel.font=[UIFont systemFontOfSize:15];
        _contentLabel.numberOfLines=0;
      
        //设置长按手势
        UILongPressGestureRecognizer * longPressGesture=[[UILongPressGestureRecognizer alloc] initWithTarget:self  action:@selector(longPress:)];
        _contentLabel.userInteractionEnabled = YES;
        [self.contentLabel addGestureRecognizer:longPressGesture];
        [self.contentView addSubview:self.contentLabel];

    }
    return _contentLabel;
}

-(UIImageView *)bgImageView{
    
    if (_bgImageView==nil) {
        _bgImageView=[UIImageView new];
        _bgImageView.image=[UIImage imageNamed:@"chat_recive_nor"];
        _bgImageView.userInteractionEnabled = YES;
    }
    return _bgImageView;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
        self.contentView.backgroundColor=[UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
        
        [self prepareSubviews];
    }

    return self;
}
- (BOOL)canBecomeFirstResponder{
    return YES;
}
// 长按操作
-(void)longPress:(UILongPressGestureRecognizer *)gesture
{
    if(gesture.state==UIGestureRecognizerStateBegan)
    {
//        _contentLabel=(UILabel *)gesture.view;
        [self becomeFirstResponder];
        //定义菜单
        UIMenuController *menu = [UIMenuController sharedMenuController];
        
        UIMenuItem *copy = [[UIMenuItem alloc] initWithTitle:@"拷贝" action:@selector(copyAction:)];
        //设定菜单显示的区域
        [menu setTargetRect:self.contentLabel.frame inView:self.contentLabel.superview];
        [menu setMenuItems:@[copy]];
        [menu setMenuVisible:YES animated:YES];
    }
    
}
//控制响应的方法
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return action == @selector(copyAction:);
}
//拷贝
- (void)copyAction:(id)sender {
    NSLog(@"copy");
    //拷贝操作
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setString:_contentLabel.text];
}
-(void)prepareSubviews{
    
    __weak typeof(self) weakSelf=self;
    
    [self.contentView addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSelf.contentView).offset(1);
        make.top.equalTo(weakSelf.contentView).offset(15);
        make.width.height.equalTo(@60);
    }];
    
    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.iconImageView);
        make.height.equalTo(@20);
        make.width.equalTo(@100);
        make.leading.equalTo(weakSelf.iconImageView.mas_trailing).offset(8);
    }];
    
    [self.contentView addSubview:self.bgImageView];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSelf.nameLabel);
        make.trailing.equalTo(weakSelf.contentView).offset(-130);
        make.top.equalTo(weakSelf.nameLabel.mas_bottom);
        make.bottom.equalTo(weakSelf.contentView).offset(-8);
    }];
    
    [self.bgImageView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSelf.bgImageView).offset(15);
        make.top.equalTo(weakSelf.bgImageView);
        make.centerX.equalTo(weakSelf.bgImageView);
        make.bottom.equalTo(weakSelf.bgImageView);
    }];
}


@end
