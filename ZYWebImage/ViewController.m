//
//  ViewController.m
//  ZYWebImage
//
//  Created by broncho on 16/3/1.
//  Copyright © 2016年 xiabeibei. All rights reserved.
//

#import "ViewController.h"
//自己的
#import "UIImageView+Additions.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
     sdWebImage缓存原理  三级缓存
     
     1.从当前程序的缓存中查找图片 dic array
     
     2.如果缓存中没有，那么从内存中加载图片，加载成功后存入到缓存中
     
     3.如果内存中也没有 就从网络上请求图片，请求成功之后加载内存和缓存
     */
//    [_imgView setImageWithURL:[NSURL URLWithString:@"http://img1.cache.netease.com/catchpic/5/50/50A616F18C9920EFFB807202F0FBD75E.jpg"] placeholderImage:nil];
    
    
    //
    [_imgView downloadImageWithImageUrlString:@"http://img1.cache.netease.com/catchpic/5/50/50A616F18C9920EFFB807202F0FBD75E.jpg" placeholderImage:[UIImage imageNamed:@"person.png"]];
    
}


@end
