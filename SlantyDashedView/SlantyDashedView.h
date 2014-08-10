//
//  SlantyDashedView.h
//  SlantyDashedView
//
//  Created by Dalton Claybrook on 8/10/14.
//  Copyright (c) 2014 Space Factory Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlantyDashedView : UIView

@property (nonatomic, strong) UIColor *dashColor;
@property (nonatomic, assign) CGFloat dashWidth;
@property (nonatomic, assign) CGFloat dashSpacing;
@property (nonatomic, assign) CGFloat horizontalTranslation;

@end
