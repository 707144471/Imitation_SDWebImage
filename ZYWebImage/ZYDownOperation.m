//
//  ZYDownOperation.m
//  ZYWebImage
//
//  Created by broncho on 16/3/1.
//  Copyright © 2016年 xiabeibei. All rights reserved.
//

#import "ZYDownOperation.h"
#import "ZYWebManager.h"
#import "Base64.h"
#import "NSString+FilePath.h"

@implementation ZYDownOperation
//起到传值的作用
-(id)initWithImgUrl:(NSString *)urlString img:(UIImageView *)image
{
    if (self =[super init])
    {
        self.urlString =urlString;
        
        self.imageView =image;
    }
    return self;
}

//该方法需要返回operation对象
+(id)operationDownloadWithUrlstirng:(NSString *)str imgView:(UIImageView *)img
{
    return [[self alloc]initWithImgUrl:str img:img];
}
-(void)main
{
    //url
    NSData *_data =[[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:self.urlString]];
 
    if (_data)
    {
        UIImage *_img =[UIImage imageWithData:_data];
        //有了>>>分线程  回调主线程
        [self performSelectorOnMainThread:@selector(downLoadIsOk:) withObject:_img waitUntilDone:YES];
        
        //存 缓存
        ZYWebManager *_manager =[ZYWebManager sharedManager];
        //key设置成当前资源的url地址
        [_manager.cacheDic setObject:_data forKey:self.urlString];
        
        //内存 文件名是活得
        //Documents/caches/xxx
        NSString *fielPath = [@"Documents" getDirectoryWithString:@"caches" aFilePath:[self.urlString base64EncodedString]];
        [_data writeToFile:fielPath atomically:YES];
        NSLog(@"----%@",fielPath);
        
        
    }
}
//下载完成的时候调用  刷新ui
-(void)downLoadIsOk:(UIImage *)img
{
    self.imageView.image =img;
}
@end





