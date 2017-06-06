//
//  ZYDownOperation.h
//  ZYWebImage
//
//  Created by broncho on 16/3/1.
//  Copyright © 2016年 xiabeibei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZYDownOperation : NSOperation
//接
@property(nonatomic,retain)UIImageView *imageView;

@property(nonatomic,copy)NSString *urlString;

//用来接收下载需要用到的数据和imageView的对象
+(id)operationDownloadWithUrlstirng:(NSString *)str imgView:(UIImageView *)img;
@end





