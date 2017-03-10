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
#import "FileUtil.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    av_register_all();
    
    UIButton *stop = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [stop setTitle:@"stop" forState:(UIControlStateNormal)];
    [stop sizeToFit];
    stop.center = self.view.center;
    [self.view addSubview:stop];
    [stop addTarget:self action:@selector(stopDownload) forControlEvents:(UIControlEventTouchUpInside)];

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString *sourcePath = @"rtmp://rtmp.live.tianya.cn/live/1479280963000111133636";
        NSString *targetPath = [NSString stringWithFormat:@"%@/Documents/test2_3.flv",NSHomeDirectory()];
        NSLog(@"targetPath:%@",targetPath);
        NSString *commond = [NSString stringWithFormat:@"ffmpeg -i %@ -c copy %@",sourcePath,targetPath];
        NSArray *argv_array = [commond componentsSeparatedByString:@" "];
        int argc = (int)argv_array.count;
        char **argv = malloc(sizeof(char)*1024);
        for (int i = 0; i < argc; i++) {
            argv[i] = (char *)malloc(sizeof(char)*1024);
            strcpy(argv[i], [[argv_array objectAtIndex:i] UTF8String]);
        }
        
        int result = ffmpeg_main(argc, argv);
        for (int i = 0; i < argc; i++) {
            free(argv[i]);
        }
        free(argv);
    });

//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
    
//    });

    
//        int numberOfArgs = 6;
//    char** arguments = calloc(numberOfArgs, sizeof(char*));
    //    NSString *outPath = [FileUtil documentsPathWithFileName:@"downLoad1.flv" createPathIfNotExists:YES];
    //
    //    const char* cPath = [outPath cStringUsingEncoding:(NSUTF8StringEncoding)];
    //
    //    NSLog(@"outPath:%@",outPath);
    //    arguments[0] = "ffmpeg";
    //    arguments[1] = "-i";
    //    arguments[2] = "rtmp://rtmp.live.tianya.cn/live/1479278546000111133636";  //input path url
    //    arguments[3] = "-c";
    //    arguments[4] = "copy";
    //    arguments[5] = "file1.flv";  //outpath
}

- (void)stopDownload {
    char **argv = malloc(sizeof(char)*1024);
    argv[1] = (char *)malloc(sizeof(char)*1024);
    strcpy(argv[1], [@"q" UTF8String]);
    ffmpeg_main(1, argv);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
