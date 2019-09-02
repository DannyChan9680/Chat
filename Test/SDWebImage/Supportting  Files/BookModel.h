//
//  BookModel.h
//  SDWebImage
//
//  Created by Civet on 2019/8/2.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BookModel : NSObject
//名字
@property (retain,nonatomic) NSString* mBookName;
//价格
@property (retain,nonatomic) NSString* mBookPrice;
//出版社
@property (retain,nonatomic) NSString* mPublisher;
//照片路径
@property (retain,nonatomic) NSString* mImageURL;
@end

