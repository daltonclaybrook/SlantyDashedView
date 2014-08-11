//
//  SlantyDashedView.m
//  SlantyDashedView
//
//  Created by Dalton Claybrook on 8/10/14.
//  Copyright (c) 2014 Space Factory Studios. All rights reserved.
//

#import "SlantyDashedView.h"

static NSInteger kAnimationFrameInterval = 1;

@interface SlantyDashedView ()

@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) CGFloat animationSpeed;
@property (nonatomic, assign) CGFloat currentPhase;

@end

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
    _horizontalTranslation = 8.0f;
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

- (void)setHorizontalTranslation:(CGFloat)horizontalTranslation
{
    if (fabsf(_horizontalTranslation - horizontalTranslation) < FLT_EPSILON)
    {
        return;
    }
    _horizontalTranslation = horizontalTranslation;
    [self setNeedsDisplay];
}

#pragma mark - UIView

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [self.dashColor CGColor]);
    CGContextSetLineWidth(context, self.dashWidth);
    
    CGFloat currentX = fmodf(self.currentPhase, self.dashSpacing + self.dashWidth) - (fabsf(self.horizontalTranslation) + self.dashWidth/2.0f);
    CGFloat viewWidth = CGRectGetWidth(self.bounds);
    CGFloat viewHeight = CGRectGetHeight(self.bounds);
    
    while (currentX < viewWidth + self.dashWidth/2.0f + fabsf(self.horizontalTranslation))
    {
        CGContextMoveToPoint(context, currentX, -self.dashWidth/2.0f);
        CGContextAddLineToPoint(context, currentX + self.horizontalTranslation, viewHeight + self.dashWidth/2.0f);
        currentX += (self.dashSpacing + self.dashWidth);
    }
    
    CGContextStrokePath(context);
}

#pragma mark - Public

- (void)startAnimatingWithSpeed:(NSTimeInterval)speed
{
    if (self.isAnimating)
    {
        NSAssert(NO, @"Dashed view is already animating. Call 'stopAnimating' first");
        return;
    }
    
    _animating = YES;
    self.animationSpeed = speed * kAnimationFrameInterval;
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(animationTimerFired:)];
    self.displayLink.frameInterval = kAnimationFrameInterval;
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)stopAnimating
{
    if (!self.isAnimating)
    {
        NSAssert(NO, @"Called %@ when dashed view was not animating", NSStringFromSelector(_cmd));
        return;
    }
    
    _animating = NO;
    [self.displayLink invalidate];
    self.displayLink = nil;
}

#pragma mark - Private

- (void)animationTimerFired:(CADisplayLink *)timer
{
    CGFloat update = (timer.duration * self.animationSpeed);
    if (self.animationDirection == SlantyDashedViewAnimationDirectionRightToLeft)
    {
        update = -update;
    }
    
    self.currentPhase += update;
    [self setNeedsDisplay];
}

@end
