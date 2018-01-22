//
//  YVSnapShotHelper.h
//  1test
//
//  Created by yang on 2018/1/22.
//  Copyright © 2018年 ydq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YVSnapShotHelper : NSObject
+ (UIImage *)imageFromView:(UIScrollView *)scrollView;
+ (void)saveImageToPhotos:(UIImage*)savedImage;
@end
