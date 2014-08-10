//
//  SlantyDashedView.h
//  SlantyDashedView
//
//  Created by Dalton Claybrook on 8/10/14.
//  Copyright (c) 2014 Space Factory Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlantyDashedView : UIView

@property (nonatomic, strong) UIColor *dashColor;   // default black
@property (nonatomic, assign) CGFloat dashWidth;    // default 10.0f
@property (nonatomic, assign) CGFloat dashSpacing;  // default 10.0f
@property (nonatomic, assign) CGFloat horizontalTranslation;    // default 8.0f

@end
