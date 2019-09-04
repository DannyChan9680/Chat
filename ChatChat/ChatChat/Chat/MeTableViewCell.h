//
//  MeTableViewCell.h
//  ChatWithEachOther
//
//  Created by MJ on 2017/8/10.
//  Copyright © 2017年 韩明静. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Firebase.h"
@import FirebaseMLCommon;
@interface MeTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *iconImageView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UIImageView *bgImageView;
@property (nonatomic,strong) UIImage *Images;
@property(nonatomic, strong) FIRTranslator *translator;

@end
