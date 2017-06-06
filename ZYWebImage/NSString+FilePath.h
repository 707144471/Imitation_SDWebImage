//
//  NSString+FilePath.h
//  ZYWebImage
//
//  Created by broncho on 16/3/1.
//  Copyright © 2016年 xiabeibei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FilePath)
//文件夹名   文件名
-(NSString *)getDirectoryWithString:(NSString *)directory aFilePath:(NSString *)filePath;
@end





