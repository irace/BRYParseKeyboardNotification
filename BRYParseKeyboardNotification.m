//
//  BRYParseKeyboardNotification.m
//  BRYParseKeyboardNotification
//
//  Created by Bryan Irace on 1/2/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

#import "BRYParseKeyboardNotification.h"

void BRYParseKeyboardNotification(NSNotification *notification, void(^callback)(NSTimeInterval keyboardAnimationDuration, CGFloat keyboardHeight, UIViewAnimationOptions keyboardAnimationOptions)) {
    NSDictionary *userInfo = [notification userInfo];

    NSTimeInterval duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // Conver animation curve to animation options: https://devforums.apple.com/message/878410#878410
    UIViewAnimationOptions options = [userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue] << 16;
    
    CGRect keyboardEndFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGFloat height = CGRectGetHeight(keyboardEndFrame);

    if (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
        height = CGRectGetWidth(keyboardEndFrame);
    }
    
    if (callback) {
        callback(duration, height, options);
    }
}
