//
//  CTDDetailViewController.m
//  ClickableTextDemo
//
//  Created by 0day on 14-3-20.
//  Copyright (c) 2014年 0dayzh. All rights reserved.
//

#import "CTDDetailViewController.h"

#import "NSString+Detector.h"

@interface CTDDetailViewController ()
<
UITextViewDelegate
>

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation CTDDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tap];
    
    NSAttributedString *attibutedString = [self.content attributedStringWithTypes:NSTextCheckingTypeLink | NSTextCheckingTypePhoneNumber];
    self.textView.attributedText = attibutedString;
    self.textView.editable = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleTextDidChangeNotification:)
                                                 name:UITextViewTextDidChangeNotification
                                               object:nil];
}

- (void)handleTap:(UITapGestureRecognizer *)tap {
    if ([self.textView isFirstResponder]) {
        self.textView.editable = NO;
        [self.textView resignFirstResponder];
    } else {
        self.textView.editable = YES;
        [self.textView becomeFirstResponder];
    }
}

- (void)handleTextDidChangeNotification:(NSNotification *)notif {
    NSAttributedString *attibutedString = [self.textView.text attributedStringWithTypes:NSTextCheckingTypeLink | NSTextCheckingTypePhoneNumber];
    self.textView.attributedText = attibutedString;
}

@end
