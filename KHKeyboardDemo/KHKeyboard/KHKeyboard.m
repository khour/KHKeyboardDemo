//
//  KHKeyboard.m
//  KHKeyboardDemo
//
//  Created by Alexander Nazarenka on 2/8/12.
//  Copyright (c) 2012 ACME corp. All rights reserved.
//

#import "KHKeyboard.h"

@interface KHKeyboard ()

@property (nonatomic, retain) NSMutableArray *buttons;

@end


@implementation KHKeyboard

@synthesize buttons = _buttons;
@synthesize datasource = _datasource;
@synthesize delegate = _delegate;

- (id)init
{
    self = [super initWithFrame:CGRectMake(0, 0, 320, 200)];
    return self;
}

- (void)layoutSubviews
{
    self.backgroundColor = [UIColor colorWithRed:111.0 / 255.0 green:122.0 / 255.0 blue:128.0 / 255.0 alpha:1.0];
    
    // clear keyboard, remove all buttons
    self.buttons = nil;
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSInteger buttonsCount = [self.datasource numberOfKeysInKeyboard:self];
    self.buttons = [NSMutableArray arrayWithCapacity:buttonsCount];
    for (int i = 0; i < buttonsCount; i++) {
        UIButton *button = [self.datasource buttonForKeyInKeyboard:self atIndex:i];
        button.tag = i;
        [self.buttons addObject:button];
        [self addSubview:button];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    // lookup for touched button and select it
    // unselect all another buttons
    for (UIButton *button in self.buttons) {
        if (CGRectContainsPoint(button.frame, [touch locationInView:touch.view])) {
            if (!button.isHighlighted) {
                button.highlighted = YES;
            }
        } else {
            button.highlighted = NO;
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    // lookup for touched button and select it
    // unselect all another buttons
    for (UIButton *button in self.buttons) {
        if (CGRectContainsPoint(button.frame, [touch locationInView:touch.view])) {
            if (!button.isHighlighted) {
                button.highlighted = YES;
            }
        } else {
            button.highlighted = NO;
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    // lookup for touched button, unselect it and submit action to delegate
    // unselect all another buttons
    for (UIButton *button in self.buttons) {
        if (CGRectContainsPoint(button.frame, [touch locationInView:touch.view])) {
            if ([self.delegate respondsToSelector:@selector(keyPressedInKeyboard:atIndex:)]) {
                [self.delegate keyPressedInKeyboard:self atIndex:button.tag];
            }
        }
        
        button.highlighted = NO;
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [self init];
    return self;
}

@end
