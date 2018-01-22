//
//  YVSnapShotHelper.m
//  1test
//
//  Created by yang on 2018/1/22.
//  Copyright © 2018年 ydq. All rights reserved.
//

#import "YVSnapShotHelper.h"
#import <Photos/Photos.h>

@implementation YVSnapShotHelper

+ (UIImage *)imageFromView:(UIScrollView *)scrollView{
    CGPoint oriContentOfSet = scrollView.contentOffset;
    CGRect oriFrame = scrollView.frame;
    
    scrollView.frame = CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height);
    UIGraphicsBeginImageContext(scrollView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [scrollView.layer renderInContext:context];
//    [scrollView drawViewHierarchyInRect:CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height) afterScreenUpdates:true];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    scrollView.frame = oriFrame;
    scrollView.contentOffset = oriContentOfSet;
    
    return theImage;
}

+ (void)saveImageToPhotos:(UIImage*)savedImage{
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        
    }];
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusAuthorized){
        UIImageWriteToSavedPhotosAlbum(savedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    }
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error == nil) {
        NSLog(@"存入手机相册成功");
    }else{
        NSLog(@"存入手机相册失败");
    }
}

@end
