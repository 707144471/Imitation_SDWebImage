//
//  UIImageView+Additions.h
//  ZYWebImage
//
//  Created by broncho on 16/3/1.
//  Copyright © 2016年 xiabeibei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Additions)
//拓展一个设置图片的方法
-(void)downloadImageWithImageUrlString:(NSString *)string placeholderImage:(UIImage *)img;
@end






