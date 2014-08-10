//
//  ViewController.m
//  SlantyDashedView
//
//  Created by Dalton Claybrook on 8/10/14.
//  Copyright (c) 2014 Space Factory Studios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self setupViews];
}

#pragma mark - Private

- (void)setupViews
{
    self.dashedView1.backgroundColor = [self r:143 g:218 b:34];
    self.dashedView1.dashColor = [self r:128 g:209 b:37];
    
    self.dashedView2.backgroundColor = [self r:243 g:185 b:85];
    self.dashedView2.dashColor = [self r:233 g:165 b:48];
    self.dashedView2.dashWidth = 20;
    self.dashedView2.dashSpacing = 20;
    
    self.dashedView3.backgroundColor = [self r:219 g:147 b:219];
    self.dashedView3.dashColor = [self r:215 g:119 b:215];
    self.dashedView3.dashWidth = 4.0f;
    self.dashedView3.dashSpacing = 12.0f;
    self.dashedView3.horizontalTranslation = 16.0f;
    
    self.dashedView2.animationDirection = SlantyDashedViewAnimationDirectionRightToLeft;
    [self.dashedView2 startAnimatingWithSpeed:40.0f];
}

- (UIColor *)r:(CGFloat)r g:(CGFloat)g b:(CGFloat)b
{
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f];
}
                                        
@end
