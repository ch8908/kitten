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
#import <Masonry/View+MASAdditions.h>

@interface TodayViewController()<NCWidgetProviding>

@property (nonatomic, strong) UIImageView *photoImageView;
@end

@implementation TodayViewController

- (void)loadView {
    [super loadView];
    self.preferredContentSize = CGSizeMake(0, CGRectGetWidth(self.view.frame) * 9 / 16);

    UIImageView *photoImageView = [[UIImageView alloc] init];
    photoImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:photoImageView];
    [photoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(8, 8, 8, 8));
    }];
    self.photoImageView = photoImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

    self.photoImageView.image = [self loadImage];
    completionHandler(NCUpdateResultNewData);
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets) defaultMarginInsets {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (UIImage *)loadImage {
    return [[KTPref instance] loadImage];
}

@end
