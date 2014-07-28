//
//  BRYParseKeyboardNotification.m
//  BRYParseKeyboardNotification
//
//  Created by Bryan Irace on 1/2/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

#import "BRYParseKeyboardNotification.h"

static inline BOOL version_is_less_than(NSString *version) {
   return [[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] == NSOrderedAscending;
}

void BRYParseKeyboardNotification(NSNotification *notification, void(^callback)(NSTimeInterval keyboardAnimationDuration, CGFloat keyboardHeight, UIViewAnimationOptions keyboardAnimationOptions)) {
    NSDictionary *userInfo = [notification userInfo];

    NSTimeInterval duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // Convert animation curve to animation options: https://devforums.apple.com/message/878410#878410
    UIViewAnimationOptions options = [userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue] << 16;
    
    CGRect keyboardEndFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGFloat height = CGRectGetHeight(keyboardEndFrame);

    if (version_is_less_than(@"8.0")) {
        if (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
            height = CGRectGetWidth(keyboardEndFrame);
        }
    }

    if (callback) {
        callback(duration, height, options);
    }
}
