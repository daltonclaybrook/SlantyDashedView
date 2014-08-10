//
//  SlantyDashedView.h
//  SlantyDashedView
//
//  Created by Dalton Claybrook on 8/10/14.
//  Copyright (c) 2014 Space Factory Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SlantyDashedViewAnimationDirection)
{
    SlantyDashedViewAnimationDirectionLeftToRight,
    SlantyDashedViewAnimationDirectionRightToLeft
};

@interface SlantyDashedView : UIView

@property (nonatomic, strong) UIColor *dashColor;   // default black
@property (nonatomic, assign) CGFloat dashWidth;    // default 10.0f
@property (nonatomic, assign) CGFloat dashSpacing;  // default 10.0f
@property (nonatomic, assign) CGFloat horizontalTranslation;    // default 8.0f

@property (nonatomic, assign, readonly, getter = isAnimating) BOOL animating;
@property (nonatomic, assign) SlantyDashedViewAnimationDirection animationDirection; // default left-to-right

/**
 *  Animation speed is measured in points per second.
 */
- (void)startAnimatingWithSpeed:(NSTimeInterval)speed;
- (void)stopAnimating;

@end
