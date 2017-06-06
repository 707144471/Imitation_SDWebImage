//
//  NSString+FilePath.m
//  ZYWebImage
//
//  Created by broncho on 16/3/1.
//  Copyright © 2016年 xiabeibei. All rights reserved.
//

//提供路径
#import "NSString+FilePath.h"

@implementation NSString (FilePath)

-(NSString *)getFilePath:(NSString *)aPathString
{
    return [NSHomeDirectory() stringByAppendingPathComponent:aPathString];
}

-(NSString *)getDirectoryWithString:(NSString *)directory aFilePath:(NSString *)filePath
{
    //创建文件夹>>>创建文件
    NSFileManager *_manager =[NSFileManager defaultManager];
   
    //文件夹名
    NSString *directoryPath =[self getFilePath:[NSString stringWithFormat:@"%@/%@",self,directory]];
    
    //Documents/caches
    if (![_manager fileExistsAtPath:directoryPath])
    {
        //创建文件夹了
        [_manager createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *filePathString =[NSString stringWithFormat:@"%@/%@",directoryPath,filePath];
    
    
    return filePathString;
}
@end






