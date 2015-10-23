//
//  TodayViewController.m
//  today
//
//  Created by wish8 on 10/22/15.
//  Copyright © 2015 oSolve. All rights reserved.
//

#import "TodayViewController.h"
#import "KTPref.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController()<NCWidgetProviding>
@property (strong, nonatomic) IBOutlet UIImageView *imageView2;
@end

@implementation TodayViewController

- (void)loadView {
    [super loadView];
    self.preferredContentSize = CGSizeMake(0, CGRectGetWidth(self.view.frame) * 9 / 16);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIImage *image = [[KTPref instance] loadImage];
    self.imageView2.image = [self resizeImage:image size:image.size];
}

- (UIImage *)resizeImage:(UIImage *) theImage size:(CGSize) theNewSize {
    UIGraphicsBeginImageContextWithOptions(theNewSize, NO, 1.0);
    [theImage drawInRect:CGRectMake(0, 0, theNewSize.width, theNewSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult)) completionHandler {
    // Perform any setup necessary in order to update the view.

    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets) defaultMarginInsets {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

@end
