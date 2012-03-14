//
//  KHKeyboard.h
//  KHKeyboardDemo
//
//  Created by Alexander Nazarenka on 2/8/12.
//  Copyright (c) 2012 ACME corp. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KHKeyboardDatasource.h"
#import "KHKeyboardDelegate.h"

@interface KHKeyboard : UIView

@property (nonatomic, assign) id<KHKeyboardDatasource> datasource;
@property (nonatomic, assign) id<KHKeyboardDelegate> delegate;

@end
