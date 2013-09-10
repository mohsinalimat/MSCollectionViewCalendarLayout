//
//  MSTimeRowHeader.m
//  Example
//
//  Created by Eric Horacek on 2/26/13.
//  Copyright (c) 2013 Monospace Ltd. All rights reserved.
//

#import "MSTimeRowHeader.h"

@implementation MSTimeRowHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.title = [UILabel new];
        self.title.backgroundColor = [UIColor clearColor];
        self.title.font = [UIFont systemFontOfSize:12.0];
        [self addSubview:self.title];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    UIEdgeInsets margin = UIEdgeInsetsMake(0.0, 0.0, 0.0, 5.0);
    
    [self.title sizeToFit];
    CGRect titleFrame = self.title.frame;
    titleFrame.origin.x = nearbyintf(CGRectGetWidth(self.frame) - CGRectGetWidth(titleFrame)) - margin.right;
    titleFrame.origin.y = nearbyintf((CGRectGetHeight(self.frame) / 2.0) - (CGRectGetHeight(titleFrame) / 2.0));
    self.title.frame = titleFrame;
}

#pragma mark - MSTimeRowHeader

- (void)setTime:(NSDate *)time
{
    _time = time;
    
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"h";
    }
    self.title.text = [dateFormatter stringFromDate:time];
    [self setNeedsLayout];
}

@end
