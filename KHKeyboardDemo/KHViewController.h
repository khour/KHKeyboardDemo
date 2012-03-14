//
//  KHViewController.h
//  KHKeyboardDemo
//
//  Created by Alexander Nazarenka on 3/14/12.
//  Copyright (c) 2012 ACME corp. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KHKeyboardDelegate.h"
#import "KHKeyboardDatasource.h"

@interface KHViewController : UIViewController <KHKeyboardDelegate, KHKeyboardDatasource>

@property (nonatomic, retain) IBOutlet UITextField *textField;

@end
