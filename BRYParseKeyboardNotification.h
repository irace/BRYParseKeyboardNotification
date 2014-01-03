//
//  BRYParseKeyboardNotification.h
//  BRYParseKeyboardNotification
//
//  Created by Bryan Irace on 1/2/14.
//  Copyright (c) 2014 Bryan Irace. All rights reserved.
//

@import Foundation;
@import UIKit;

void BRYParseKeyboardNotification(NSNotification *notification, void(^callback)(NSTimeInterval duration, CGFloat height, UIViewAnimationOptions options));
