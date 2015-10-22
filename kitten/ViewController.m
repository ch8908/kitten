//
//  ViewController.m
//  kitten
//
//  Created by wish8 on 10/22/15.
//  Copyright © 2015 oSolve. All rights reserved.
//

#import "ViewController.h"
#import "View+MASAdditions.h"
#import "UIImagePickerController+BlocksKit.h"
#import "KTPref.h"
#import "KTViewHelper.h"

@interface ViewController()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Load Photo" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(tapLoadPhoto:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}

- (void)tapLoadPhoto:(UIButton *) sender {
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    pickerController.allowsEditing = YES;
    pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    __weak typeof(self) weakSelf = self;
    [pickerController setBk_didFinishPickingMediaBlock:^(UIImagePickerController *controller, NSDictionary *dictionary) {
        UIImage *image = dictionary[UIImagePickerControllerEditedImage];
        [controller dismissViewControllerAnimated:YES completion:^{
            [weakSelf savePhoto:image];
        }];
    }];
    [pickerController setBk_didCancelBlock:^(UIImagePickerController *controller) {
        [controller dismissViewControllerAnimated:YES completion:nil];
    }];
    [self presentViewController:pickerController animated:YES completion:nil];
}

- (void)savePhoto:(UIImage *) image {
    [[KTPref instance] saveImage:image];
    [KTViewHelper showSaveSuccess];
}

@end
