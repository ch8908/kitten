//
// Created by wish8 on 10/22/15.
// Copyright (c) 2015 oSolve. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface KTPref : NSObject
+ (instancetype)instance;

- (void)saveImage:(UIImage *) image;

- (void)loadImageWithCompletion:(void (^)(UIImage *)) completion;

- (UIImage *)loadImage;
@end