//
//  UIImageView+Additions.m
//  ZYWebImage
//
//  Created by broncho on 16/3/1.
//  Copyright © 2016年 xiabeibei. All rights reserved.
//

#import "UIImageView+Additions.h"
#import "ZYWebManager.h"
@implementation UIImageView (Additions)
//局部的私有方法
-(void)setImageWithImageUrlString:(NSString *)urlString
{
    //处理图片资源 因为要考虑三级缓存 创建管理者来管理缓存顺序是比较好的。
    
    //单例类(可以访问全局唯一资源的类)[同步块或者加锁 创建出来之后以后就不要在创建了if]
    
    ZYWebManager *manager =[ZYWebManager sharedManager];
    
    //缓存1
    NSData *_data =[manager getImgDataWithDataKey:urlString];
    if (_data)
    {
        self.image =[[UIImage alloc]initWithData:_data];
        return;
    }

    
    
    //内存2
    NSData *_data1 =[[NSData alloc]initWithContentsOfFile:[manager getImageWithMemoryString:urlString]];
    
    if (_data1)
    {
        self.image =[[UIImage alloc]initWithData:_data1];
        return;
    }
    
    //下载3
    [manager downLoadImageWithUrlstring:urlString downImageView:self];
    
}
//全局的类别方法
//placeholderImage  如果参数1无值的情况下默认的图片
-(void)downloadImageWithImageUrlString:(NSString *)string placeholderImage:(UIImage *)img
{
    self.image =img;
    
    //如果有值回调👆的方法
    [self setImageWithImageUrlString:string];
}
@end







