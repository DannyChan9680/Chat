//
//  OtherTableViewCell.h
//  ChatChat
//
//  Created by Civet on 2019/8/26.
//  Copyright © 2019 limeixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtherTableViewCell : UITableViewCell
@property(strong ,nonatomic)UILongPressGestureRecognizer *longPressGesture;

@property(nonatomic,strong)UIImageView *iconImageView;

@property(nonatomic,strong)UILabel *nameLabel;

@property(nonatomic,strong)UILabel *contentLabel;

@property(nonatomic,strong)UIImageView *bgImageView;

@end
