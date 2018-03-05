//
//  ViewController.m
//  iOSDynamicChangeIcon
//
//  Created by Apple on 2018/3/2.
//  Copyright © 2018年 xibTest. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)setIconClick:(UIButton *)sender {
    [self setIconName:nil];//nil表示换回原始Icon
}

- (IBAction)setIcon1Click:(id)sender {
    [self setIconName:@"Icon1"];
}

- (IBAction)setIcon2Click:(id)sender {
    [self setIconName:@"Icon2"];
}

- (void)setIconName:(NSString *)name {
    UIApplication *application = [UIApplication sharedApplication];
    
    //先判断设备支不支持“AlternateIcons”
    if ([application supportsAlternateIcons]) {
        
        //这里的IconName必须在Info.plist里定义，具体格式看Info.plist
        [application setAlternateIconName:name completionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"error => %@", error.localizedDescription);
            } else {
                NSLog(@"done!");
            }
        }];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
