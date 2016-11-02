//
//  ShareImageView.h
//  TImageJoiningExample
//
//  Created by Jeavil_Tang on 2016/11/2.
//  Copyright © 2016年 Jeavil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareImageView : UIView

- (void)bindData:(NSArray *)resources completion:(void(^)(UIImage *image))completion;
@end
