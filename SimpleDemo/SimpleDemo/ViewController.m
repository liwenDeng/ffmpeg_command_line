//
//  ViewController.m
//  SimpleDemo
//
//  Created by 邓利文 on 2016/10/2.
//  Copyright © 2016年 邓利文. All rights reserved.
//

#import "ViewController.h"
#include "avformat.h"
#import "ffmpeg.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    av_register_all();
    
    int numberOfArgs = 6;
    char** arguments = calloc(numberOfArgs, sizeof(char*));
    
    arguments[0] = "ffmpeg";
    arguments[1] = "-i";
    arguments[2] = "";  //input path url
    arguments[3] = "-c";
    arguments[4] = "copy";
    arguments[5] = "";  //outpath
    
    int result = ffmpeg_main(numberOfArgs, arguments);
    
    ffmpeg_main(numberOfArgs, arguments);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
