//
//  ShareImageView.m
//  TImageJoiningExample
//
//  Created by Jeavil_Tang on 2016/11/2.
//  Copyright © 2016年 Jeavil. All rights reserved.
//

#import "ShareImageView.h"

@interface ShareImageView ()

@end

@implementation ShareImageView


- (void)bindData:(NSArray *)resources completion:(void(^)(UIImage *image))completion {
    
    NSMutableArray *images = [NSMutableArray array];
    CGFloat imageHeight = 0.0;
    for (NSInteger index = 0; index < resources.count; index++) {
        UIImage *image = [UIImage imageNamed:resources[index]];
        [images addObject:image];
        imageHeight += image.size.height * (ScreenWidth / image.size.width);
    }
    
    CGSize size = CGSizeMake(ScreenWidth, imageHeight);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGFloat lastImageHeight = 0.0;
    for (NSInteger i = 0; i < images.count; i++) {
        UIImage *image = images[i];
        [image drawInRect:CGRectMake(0, lastImageHeight, ScreenWidth , (image.size.height * (ScreenWidth / image.size.width)))];
        lastImageHeight +=  image.size.height * (ScreenWidth / image.size.width);
    }
    UIImage *stitchImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    completion(stitchImage);
}

@end
