//
//  ZYWebManager.m
//  ZYWebImage
//
//  Created by broncho on 16/3/1.
//  Copyright © 2016年 xiabeibei. All rights reserved.
//

#import "ZYWebManager.h"
#import "ZYDownOperation.h"
#import "NSString+FilePath.h"
#import "Base64.h"
static ZYWebManager *_manager =nil;

@implementation ZYWebManager
+(id)sharedManager
{
        //创建单例类的核心是确保单例类对象在alloc的时候线程的安全
    @synchronized(self)
        {
            
        if (_manager ==nil)
            {
            //self +方法里面代表类名
            //重写alloc
            _manager =[[self alloc]init];
        }
        
    }
    return _manager;
}
//确保当前创建的对象具有唯一性
+(id)alloc
{
        @synchronized(self)
        {
            if (_manager ==nil)
            {
            _manager =[[super alloc]init];
        }
    }
    return _manager;
}
-(id)init
{
    if (self=[super init])
    {
        //拓展特性
        //缓存  内存  下载
        
        //缓存初始化>>容器
        _cacheDic =[[NSMutableDictionary alloc]initWithCapacity:0];
        
        //内存>>>写本地
        
        //下载>>>分线程>>customOperation
        
        //下载
        _queue =[[NSOperationQueue alloc]init];
        //设置操作队列的最大并发量
        _queue.maxConcurrentOperationCount =2;
        
        //添加缓存通知 防止字典数据量过大造成内存泄露 UIApplicationDidReceiveMemoryWarningNotification
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(clearMemory) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];

    }
    return self;
}
-(void)clearMemory
{
    [self.cacheDic removeAllObjects];
}
-(NSData *)getImgDataWithDataKey:(NSString *)keyString
{
    return [self.cacheDic objectForKey:keyString];
}
-(NSString *)getImageWithMemoryString:(NSString *)aString
{
    return [@"Documents" getDirectoryWithString:@"caches" aFilePath:[aString base64EncodedString]];
}
//下载
-(void)downLoadImageWithUrlstring:(NSString *)urlString downImageView:(UIImageView *)imgView
{
    //开启下载
//    [[ZYDownOperation alloc]initWithImg:];
    ZYDownOperation *_operation =[ZYDownOperation operationDownloadWithUrlstirng:urlString imgView:imgView];
    //触发自身main方法
    [_queue addOperation:_operation];
}
@end
