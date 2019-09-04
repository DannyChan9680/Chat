//
//  ChatUserTableViewController.h
//  ChatChat
//
//  Created by Civet on 2019/8/27.
//  Copyright © 2019 limeixiang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatUserTableViewController : UIViewController <UITextFieldDelegate, UITableViewDelegate,UITableViewDataSource>
@property (strong ,nonatomic) UITextField * textField;
@property (strong ,nonatomic) UIButton * btn;
@property (retain,nonatomic) UITableView* tableview;
@property (retain,nonatomic) NSMutableArray* arrayData;
@property (retain ,nonatomic) NSString * senderDisplayName;
@end

NS_ASSUME_NONNULL_END
