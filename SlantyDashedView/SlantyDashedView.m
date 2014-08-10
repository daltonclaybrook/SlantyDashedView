//
//  SlantyDashedView.m
//  SlantyDashedView
//
//  Created by Dalton Claybrook on 8/10/14.
//  Copyright (c) 2014 Space Factory Studios. All rights reserved.
//

#import "SlantyDashedView.h"

static CGFloat const kSlantDistance = 8.0f;

@implementation SlantyDashedView

#pragma mark - Initializers

- (id)init
{
    self = [super init];
    if (self)
    {
        [self SlantyDashedViewCommonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self SlantyDashedViewCommonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self SlantyDashedViewCommonInit];
    }
    return self;
}

- (void)SlantyDashedViewCommonInit
{
    _dashColor = [UIColor blackColor];
    _dashWidth = 10.0f;
    _dashSpacing = 10.0f;
}

#pragma mark - Accessors

- (void)setDashColor:(UIColor *)dashColor
{
    if ([_dashColor isEqual:dashColor])
    {
        return;
    }
    _dashColor = dashColor;
    [self setNeedsDisplay];
}

- (void)setDashWidth:(CGFloat)dashWidth
{
    if (fabsf(_dashWidth - dashWidth) < FLT_EPSILON)
    {
        return;
    }
    _dashWidth = dashWidth;
    [self setNeedsDisplay];
}

- (void)setDashSpacing:(CGFloat)dashSpacing
{
    if (fabsf(_dashSpacing - dashSpacing) < FLT_EPSILON)
    {
        return;
    }
    _dashSpacing = dashSpacing;
    [self setNeedsDisplay];
}

#pragma mark - UIView

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [self.dashColor CGColor]);
    CGContextSetLineWidth(context, self.dashWidth);
    
    CGFloat currentX = 0.0f;
    CGFloat viewWidth = CGRectGetWidth(self.bounds);
    CGFloat viewHeight = CGRectGetHeight(self.bounds);
    
    while (currentX < viewWidth)
    {
        CGContextMoveToPoint(context, currentX, -self.dashWidth/2.0f);
        CGContextAddLineToPoint(context, currentX + kSlantDistance, viewHeight + self.dashWidth/2.0f);
        currentX += (self.dashSpacing + self.dashWidth);
    }
    
    CGContextStrokePath(context);
}

@end
