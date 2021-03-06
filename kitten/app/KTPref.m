//
// Created by wish8 on 10/22/15.
// Copyright (c) 2015 oSolve. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTPref.h"


NSString *const PHOTO_PREF_KEY = @"PHOTO_PREF_KEY";

@interface KTPref()
@property (nonatomic, strong) NSUserDefaults *mySharedDefaults;
@end

@implementation KTPref

+ (instancetype)instance {
    static KTPref *sharedMyInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyInstance = [[self alloc] init];
    });
    return sharedMyInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSUserDefaults *mySharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.osolve.kitten"];
        self.mySharedDefaults = mySharedDefaults;
    }
    return self;
}

- (void)saveImage:(UIImage *) image {
    NSData *imageData = UIImageJPEGRepresentation(image, 1);
    [self.mySharedDefaults setObject:imageData forKey:PHOTO_PREF_KEY];
    [self.mySharedDefaults synchronize];
}

- (void)loadImageWithCompletion:(void (^)(UIImage *)) completion {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        NSData *imageData = [self.mySharedDefaults objectForKey:PHOTO_PREF_KEY];
        UIImage *image = [UIImage imageWithData:imageData];
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            if (completion) {
                completion(image);
            }
        });
    });
}

- (UIImage *)loadImage {
    NSData *imageData = [self.mySharedDefaults objectForKey:PHOTO_PREF_KEY];
    return [UIImage imageWithData:imageData];
}

@end