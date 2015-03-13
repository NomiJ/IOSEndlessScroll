//
//  ZigZagLineView.m
//  zigzag
//
//  Created by Nomi on 13/03/2015.
//  Copyright (c) 2015 SystematicBytes. All rights reserved.
//

#import "ZigZagLineView.h"

@implementation ZigZagLineView

- (void)initObject {
    // Initialization code
    [super setBackgroundColor:[UIColor clearColor]];
    self.contentMode = UIViewContentModeRedraw;
    self.clearsContextBeforeDrawing = YES;
}
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
        [self initObject];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aCoder {
    if (self = [super initWithCoder:aCoder]) {
        // Initialization code
        [self initObject];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
     // Draw a line from 'fromPoint' to 'toPoint'
    NSInteger xx = arc4random() % (int)(self.frame.size.width - 10);
    NSInteger yy = arc4random() % (int)(self.frame.size.height - 10);

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    // Draw them with a 2.0 stroke width so they are a bit more visible.
    CGContextSetLineWidth(context, 2.0f);
    
    CGContextMoveToPoint(context, 0.0f, 0.0f); //start at this point
    
    CGContextAddLineToPoint(context, xx, yy); //draw to this point
    
    // and now draw the Path!
    CGContextStrokePath(context);
   
}


@end