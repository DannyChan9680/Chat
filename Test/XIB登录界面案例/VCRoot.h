//
//  VCRoot.h
//  XIB登录界面案例
//
//  Created by Civet on 2019/7/29.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VCRoot : UIViewController

@property (weak, nonatomic)IBOutlet UILabel* mUserName;
@property (weak , nonatomic) IBOutlet UILabel* mUerPassword;
@property (weak ,nonatomic) IBOutlet UITextField* mTFUserName;
@property (weak ,nonatomic) IBOutlet UITextField* mTFUserPassword;
@property (weak ,nonatomic) IBOutlet UIButton* mBTLogin;
@property (weak ,nonatomic) IBOutlet UIButton* mBTRegister;
-(IBAction)pressLogin:(UIButton*)sender;
-(IBAction)pressRegister:(id)sender;
@end

NS_ASSUME_NONNULL_END
