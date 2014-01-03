# BRYParseKeyboardNotification

A function that parses the useful parts out of a keyboard will appear/disappear notification.

## Installation

Via [CocoaPods](http://cocoapods.org), of course:

    pod "BRYParseKeyboardNotification"

## Usage

```objective-c
- (void)keyboardWillShow:(NSNotification *)notification {
    BRYParseKeyboardNotification(notification, ^(NSTimeInterval duration, CGFloat keyboardHeight, UIViewAnimationOptions options) {
        [UIView animateWithDuration:duration delay:0 options:options animations:^{
            someView.frameHeight -= keyboardHeight;
        }];
    });
}
```

## License
Available for use under the MIT license: [http://bryan.mit-license.org](http://bryan.mit-license.org)
