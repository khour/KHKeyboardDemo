//
//  KHKeyboardDelegate.h
//  KHKeyboardDemo
//
//  Created by Alexander Nazarenka on 2/10/12.
//  Copyright (c) 2012 ACME corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KHKeyboard;

@protocol KHKeyboardDelegate <NSObject>

@optional
- (void)keyPressedInKeyboard:(KHKeyboard *)keyboard atIndex:(NSInteger)index;

@end
