//
// Created by wish8 on 10/22/15.
// Copyright (c) 2015 oSolve. All rights reserved.
//

#import "KTViewHelper.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"

@implementation KTViewHelper
+ (void)showSaveSuccess {
    UIWindow *window = ((AppDelegate *) [[UIApplication sharedApplication] delegate]).window;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.labelText = @"Saved Success!";
    [hud setMinShowTime:1.0];
    [hud setAnimationType:MBProgressHUDAnimationFade];
    [hud hide:YES afterDelay:1.0];
    hud.userInteractionEnabled = NO;
}
@end