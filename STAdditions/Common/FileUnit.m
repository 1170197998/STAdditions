//
//  FileUnit.m
//  STAdditionsDemo
//
//  Created by ShaoFeng on 2017/2/9.
//  Copyright © 2017年 ShaoFeng. All rights reserved.
//

#import "FileUnit.h"

@implementation FileUnit

+ (NSString *)getDocumentPath
{
    NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [filePaths objectAtIndex:0];
}

+ (NSString *)getLibraryPath
{
    NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [filePaths objectAtIndex:0];
}

+ (NSString *)getApplicationPath
{
    return NSHomeDirectory();
}

+ (NSString *)getCachePath
{
    NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [filePaths objectAtIndex:0];
}

+ (NSString *)getTempPath
{
    return NSTemporaryDirectory();
}

+ (BOOL)fileIsExistOfPath:(NSString *)filePath
{
    BOOL flag = NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filePath]) {
        flag = YES;
    } else {
        flag = NO;
    }
    return flag;
}

+ (BOOL)removeFileOfPath:(NSString *)filePath
{
    BOOL flag = YES;
    NSFileManager *fileManage = [NSFileManager defaultManager];
    if ([fileManage fileExistsAtPath:filePath]) {
        if (![fileManage removeItemAtPath:filePath error:nil]) {
            flag = NO;
        }
    }
    return flag;
}

- (BOOL)removeFileOfURL:(NSURL *)fileURL
{
    BOOL flag = YES;
    NSFileManager *fileManage = [NSFileManager defaultManager];
    if ([fileManage fileExistsAtPath:fileURL.path]) {
        if (![fileManage removeItemAtURL:fileURL error:nil]) {
            flag = NO;
        }
    }
    return flag;
}

+(BOOL)creatDirectoryWithPath:(NSString *)dirPath
{
    BOOL ret = YES;
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:dirPath];
    if (!isExist) {
        NSError *error;
        BOOL isSuccess = [[NSFileManager defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&error];
        if (!isSuccess) {
            ret = NO;
            NSLog(@"creat Directory Failed. errorInfo:%@",error);
        }
    }
    return ret;
}

+ (BOOL)creatFileWithPath:(NSString *)filePath
{
    BOOL isSuccess = YES;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL temp = [fileManager fileExistsAtPath:filePath];
    if (temp) {
        return YES;
    }
    NSError *error;
    //stringByDeletingLastPathComponent:删除最后一个路径节点
    NSString *dirPath = [filePath stringByDeletingLastPathComponent];
    isSuccess = [fileManager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&error];
    if (error) {
        NSLog(@"creat File Failed. errorInfo:%@",error);
    }
    if (!isSuccess) {
        return isSuccess;
    }
    isSuccess = [fileManager createFileAtPath:filePath contents:nil attributes:nil];
    return isSuccess;
}

+ (BOOL)saveFile:(NSString *)filePath withData:(NSData *)data
{
    BOOL ret = YES;
    ret = [self creatFileWithPath:filePath];
    if (ret) {
        ret = [data writeToFile:filePath atomically:YES];
        if (!ret) {
            NSLog(@"%s Failed",__FUNCTION__);
        }
    } else {
        NSLog(@"%s Failed",__FUNCTION__);
    }
    return ret;
}

+ (BOOL)appendData:(NSData *)data withPath:(NSString *)path
{
    BOOL result = [self creatFileWithPath:path];
    if (result) {
        NSFileHandle *handle = [NSFileHandle fileHandleForWritingAtPath:path];
        [handle seekToEndOfFile];
        [handle writeData:data];
        [handle synchronizeFile];
        [handle closeFile];
        return YES;
    } else {
        NSLog(@"%s Failed",__FUNCTION__);
        return NO;
    }
}

+ (NSData *)getFileData:(NSString *)filePath
{
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    NSData *fileData = [handle readDataToEndOfFile];
    [handle closeFile];
    return fileData;
}

+ (NSData *)getFileData:(NSString *)filePath startIndex:(long long)startIndex length:(NSInteger)length
{
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    [handle seekToFileOffset:startIndex];
    NSData *data = [handle readDataOfLength:length];
    [handle closeFile];
    return data;
}

+ (BOOL)moveFileFromPath:(NSString *)fromPath toPath:(NSString *)toPath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:fromPath]) {
        NSLog(@"Error: fromPath Not Exist");
        return NO;
    }
    if (![fileManager fileExistsAtPath:toPath]) {
        NSLog(@"Error: toPath Not Exist");
        return NO;
    }
    NSString *headerComponent = [toPath stringByDeletingLastPathComponent];
    if ([self creatFileWithPath:headerComponent]) {
        return [fileManager moveItemAtPath:fromPath toPath:toPath error:nil];
    } else {
        return NO;
    }
}

+(BOOL)copyFileFromPath:(NSString *)fromPath toPath:(NSString *)toPath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:fromPath]) {
        NSLog(@"Error: fromPath Not Exist");
        return NO;
    }
    if (![fileManager fileExistsAtPath:toPath]) {
        NSLog(@"Error: toPath Not Exist");
        return NO;
    }
    NSString *headerComponent = [toPath stringByDeletingLastPathComponent];
    if ([self creatFileWithPath:headerComponent]) {
        return [fileManager copyItemAtPath:fromPath toPath:toPath error:nil];
    } else {
        return NO;
    }
}

+ (NSArray *)getFileListInFolderWithPath:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *fileList = [fileManager contentsOfDirectoryAtPath:path error:&error];
    if (error) {
        NSLog(@"getFileListInFolderWithPathFailed, errorInfo:%@",error);
    }
    return fileList;
}

+ (long long)getFileSizeWithPath:(NSString *)path
{
    unsigned long long fileLength = 0;
    NSNumber *fileSize;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:path error:nil];
    if ((fileSize = [fileAttributes objectForKey:NSFileSize])) {
        fileLength = [fileSize unsignedLongLongValue];
    }
    return fileLength;
    
//    NSFileManager* manager =[NSFileManager defaultManager];
//    if ([manager fileExistsAtPath:path]){
//        return [[manager attributesOfItemAtPath:path error:nil] fileSize];
//    }
//    return 0;
}

+ (NSString *)getFileCreatDateWithPath:(NSString *)path
{
    NSString *date = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:path error:nil];
    date = [fileAttributes objectForKey:NSFileCreationDate];
    return date;
}

+ (NSString *)getFileOwnerWithPath:(NSString *)path
{
    NSString *fileOwner = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:path error:nil];
    fileOwner = [fileAttributes objectForKey:NSFileOwnerAccountName];
    return fileOwner;

}

+ (NSString *)getFileChangeDateWithPath:(NSString *)path
{
    NSString *date = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:path error:nil];
    date = [fileAttributes objectForKey:NSFileModificationDate];
    return date;
}

@end
