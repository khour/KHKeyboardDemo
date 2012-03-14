//
//  KHKeyboardDatasource.h
//  KHKeyboardDemo
//
//  Created by Alexander Nazarenka on 2/8/12.
//  Copyright (c) 2012 ACME corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KHKeyboard;

@protocol KHKeyboardDatasource <NSObject>

@required
- (NSInteger)numberOfKeysInKeyboard:(KHKeyboard *)keyboard;
- (UIButton *)buttonForKeyInKeyboard:(KHKeyboard *)keyboard atIndex:(NSInteger)index;


@end
