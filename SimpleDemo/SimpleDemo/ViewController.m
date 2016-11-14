//
//  ViewController.m
//  SimpleDemo
//
//  Created by 邓利文 on 2016/10/2.
//  Copyright © 2016年 邓利文. All rights reserved.
//

#import "ViewController.h"
#include "avformat.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    av_register_all();
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
