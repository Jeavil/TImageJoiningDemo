//
//  ViewController.m
//  TImageJoiningExample
//
//  Created by Jeavil_Tang on 2016/11/2.
//  Copyright © 2016年 Jeavil. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    btn.center = self.view.center;
    [btn setTitle:@"开始拼图" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor orangeColor]];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClicked:(UIButton *)sender {
    DetailViewController *vc = [[DetailViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
