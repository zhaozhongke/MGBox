//
//  Created by Matt Greenfield on 3/01/12.
//  Copyright 2012 Big Paua. All rights reserved.
//

#import "MGStyledBox.h"

#define DEFAULT_WIDTH          310.0
#define DEFAULT_TOP_MARGIN       5.0
#define DEFAULT_LEFT_MARGIN      5.0
#define CORNER_RADIUS            3.0

@implementation MGStyledBox

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizesSubviews = YES;
        self.topMargin = DEFAULT_TOP_MARGIN;
        self.bottomMargin = 0;
    }
    return self;
}

+ (id)box {
    CGRect frame = CGRectMake(DEFAULT_LEFT_MARGIN, 0, DEFAULT_WIDTH, 0);
    MGStyledBox *box = [[self alloc] initWithFrame:frame];
    return box;
}

+ (id)boxWithWidth:(CGFloat)width {
    CGRect frame = CGRectMake(DEFAULT_LEFT_MARGIN, 0, width, 0);
    MGStyledBox *box = [[self alloc] initWithFrame:frame];
    return box;
}

- (void)addLayers {
    [super addLayers];
    self.backgroundColor =
            [UIColor colorWithRed:0.94 green:0.94 blue:0.95 alpha:1];
    self.layer.cornerRadius = CORNER_RADIUS;
    self.layer.shadowColor = [UIColor colorWithWhite:0.22 alpha:1].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 0.5);
    self.layer.shadowRadius = 0.7;
    self.layer.shadowOpacity = 1;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)draw {
    [super draw];

    // make shadow faster
    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
            cornerRadius:self.layer.cornerRadius].CGPath;
}

@end
