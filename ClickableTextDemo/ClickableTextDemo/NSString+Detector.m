//
//  NSString+Detector.m
//  ClickableTextDemo
//
//  Created by 0day on 14-3-20.
//  Copyright (c) 2014年 0dayzh. All rights reserved.
//

#import "NSString+Detector.h"

@implementation NSString (Detector)

- (NSAttributedString *)attributedStringWithTypes:(NSTextCheckingTypes)types {
    NSDataDetector *detector = [[NSDataDetector alloc] initWithTypes:types
                                                               error:nil];
    __block NSMutableAttributedString *attibutedString = [[NSMutableAttributedString alloc] initWithString:self
                                                                                                attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]}];
    [detector enumerateMatchesInString:self
                               options:NSMatchingReportProgress
                                 range:(NSRange){0, self.length}
                            usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop){
                                if (result.URL) {
                                    NSDictionary *attibutes = @{NSLinkAttributeName:result.URL};
                                    [attibutedString addAttributes:attibutes range:result.range];
                                }
                            }];
    
    return attibutedString;
}

@end
