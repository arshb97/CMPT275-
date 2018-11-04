//
//  DetectFace.h
//  SnapMoji
//
//  Created by Arshdeep Singh Bhullar on 2018-11-01.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//



#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface DetectFace : NSObject

- (NSString *) detectAction: (UIImage *) image;
-(NSString *) globalVariableGetter;

@end

NS_ASSUME_NONNULL_END
