//
//  FileUtil.h
//  SimpleDemo
//
//  Created by 邓利文 on 2016/11/16.
//  Copyright © 2016年 邓利文. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileUtil : NSObject

+ (NSString*)documentsPathWithFileName:(NSString*)aFileName;

+ (NSString*)documentsPathWithFileName:(NSString*)aFileName createPathIfNotExists:(BOOL)createPathIfNotExists;

+ (NSString*)tempPathWithFileName:(NSString*)filename;

+ (BOOL)fileExists:(NSString*)aFilePath;

+ (BOOL)deleteFileWithPath:(NSString*)aFilePath;

+ (BOOL)appendData:(NSData*)data path:(NSString*)path;

//+ (NSString *)cachePathWithFileName:(NSString*)filename;

+ (NSString *)detailCacheWithFileName:(NSString *)filename;

+ (void)deleteFileWithDirPath:(NSString*)dirPath matchExtension:(NSString*)extension;//删除目录下的某类扩展名的文件

+ (NSDictionary*) getFileAttributes:(NSString*) aFileName;

+ (NSDate*) getModificationDate:(NSString*) aFileName;

+ (long)fileSizeForDir:(NSString*)path;//计算文件夹下文件的总大小

+ (void)deleteHistoryCache;

+ (void)clearTemporaryDirectory;

+ (void)deleteItemsOnlyAtPath:(NSString *)path;


@end
