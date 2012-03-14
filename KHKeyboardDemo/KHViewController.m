//
//  KHViewController.m
//  KHKeyboardDemo
//
//  Created by Alexander Nazarenka on 3/14/12.
//  Copyright (c) 2012 ACME corp. All rights reserved.
//

#import "KHViewController.h"

#import "KHKeyboard.h"

@interface KHViewController ()

@property (nonatomic, retain) NSArray *rects; // frames for buttons
@property (nonatomic, retain) NSArray *titles; // titles for buttons

@end

@implementation KHViewController

@synthesize textField = _textField;
@synthesize rects = _rects;
@synthesize titles = _titles;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.rects = [NSArray arrayWithObjects:
                  [NSValue valueWithCGRect:CGRectMake(0, 0, 64, 50)],
                  [NSValue valueWithCGRect:CGRectMake(64, 0, 64, 50)],
                  [NSValue valueWithCGRect:CGRectMake(128, 0, 64, 50)],
                  [NSValue valueWithCGRect:CGRectMake(192, 0, 64, 50)],
                  [NSValue valueWithCGRect:CGRectMake(256, 0, 64, 50)],
                  [NSValue valueWithCGRect:CGRectMake(0, 50, 64, 50)],
                  [NSValue valueWithCGRect:CGRectMake(64, 50, 64, 50)],
                  [NSValue valueWithCGRect:CGRectMake(128, 50, 64, 50)],
                  [NSValue valueWithCGRect:CGRectMake(192, 50, 64, 50)],
                  [NSValue valueWithCGRect:CGRectMake(256, 50, 64, 50)],
                  [NSValue valueWithCGRect:CGRectMake(0, 100, 64, 50)],
                  [NSValue valueWithCGRect:CGRectMake(64, 100, 64, 50)],
                  [NSValue valueWithCGRect:CGRectMake(128, 100, 64, 50)],
                  [NSValue valueWithCGRect:CGRectMake(192, 100, 64, 50)],
                  [NSValue valueWithCGRect:CGRectMake(256, 100, 64, 100)],
                  [NSValue valueWithCGRect:CGRectMake(0, 150, 128, 50)],
                  [NSValue valueWithCGRect:CGRectMake(128, 150, 64, 50)],
                  [NSValue valueWithCGRect:CGRectMake(192, 150, 64, 50)],
                  nil];
    
    self.titles = [NSArray arrayWithObjects:
                   @"7", @"8", @"9", @"×", @"←",
                   @"4", @"5", @"6", @"÷", @"%",
                   @"1", @"2", @"3", @"+", @"↵",
                   @"0", @".", @"−",
                   nil];
    
    KHKeyboard *keyboard = [[[KHKeyboard alloc] init] autorelease];
    keyboard.datasource = self;
    keyboard.delegate = self;
    
    self.textField.inputView = keyboard;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.textField = nil;
    self.rects = nil;
    self.titles = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc
{
    [_textField release];
    [_rects release];
    [_titles release];
    [super dealloc];
}

- (NSInteger)numberOfKeysInKeyboard:(KHKeyboard *)keyboard
{
    return [self.rects count];
}

- (UIButton *)buttonForKeyInKeyboard:(KHKeyboard *)keyboard atIndex:(NSInteger)index
{
    NSString *title = [self.titles objectAtIndex:index];
    CGRect rect = [(NSValue *)[self.rects objectAtIndex:index] CGRectValue];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = rect;
    [button setTitle:title forState:UIControlStateNormal];
    [button setUserInteractionEnabled:NO];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [button setReversesTitleShadowWhenHighlighted:YES];
    
    if (index == 14) {
        [button setBackgroundImage:[UIImage imageNamed:@"button_normal_2.png"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"button_highlighted_2.png"] forState:UIControlStateHighlighted];
        
    } else if (index == 15) {
        [button setBackgroundImage:[UIImage imageNamed:@"button_normal_1.png"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"button_highlighted_1.png"] forState:UIControlStateHighlighted];
        
    } else {
        [button setBackgroundImage:[UIImage imageNamed:@"button_normal.png"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"button_highlighted.png"] forState:UIControlStateHighlighted];
    }
    
    [button.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    
    return button;
}

- (void)keyPressedInKeyboard:(KHKeyboard *)keyboard atIndex:(NSInteger)index
{
    if (index == 14) { // return key
        [self.textField resignFirstResponder];
        
    } else if (index == 4) { // backspace key
        NSInteger length = [self.textField.text length];
        if (length == 0) {
            return;
        } else {
            NSString *newValue = [self.textField.text substringToIndex:length - 1];
            self.textField.text = newValue;
        }
        
    } else {
        NSString *value = [self.titles objectAtIndex:index];
        NSMutableString *newValue = [NSMutableString stringWithFormat:@"%@%@", self.textField.text, value];
        self.textField.text = newValue;
    }
}

@end
