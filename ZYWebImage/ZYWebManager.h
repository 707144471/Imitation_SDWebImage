//
//  ZYWebManager.h
//  ZYWebImage
//
//  Created by broncho on 16/3/1.
//  Copyright © 2016年 xiabeibei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZYWebManager : NSObject
{
    NSOperationQueue *_queue;
}
//缓存
@property (nonatomic,retain)NSMutableDictionary *cacheDic;
//获取当前管理者对象
+(id)sharedManager;

//缓存
-(NSData *)getImgDataWithDataKey:(NSString *)keyString;
//内存
-(NSString *)getImageWithMemoryString:(NSString *)aString;

//下载的方法
-(void)downLoadImageWithUrlstring:(NSString *)urlString downImageView:(UIImageView *)imgView;
@end






