//
//  BookModel.h
//  AFNetwork网络库
//
//  Created by Civet on 2019/8/1.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookModel : NSObject
//数据名称
@property (retain ,nonatomic) NSString* mBookName;
//数据价格
@property (retain ,nonatomic) NSString* mBookPrice;
//书籍出本社
@property (retain ,nonatomic) NSString* mBookPublisher;
//书籍作者
@property (retain ,nonatomic) NSMutableArray* mAuthor;
//书籍分数
@property (retain ,nonatomic) NSString* mScore;

@end

