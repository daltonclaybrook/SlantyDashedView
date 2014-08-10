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

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.dashedView.backgroundColor = [UIColor colorWithRed:143.0f/255.0f green:218.0f/255.0f blue:34.0f/255.0f alpha:1.0f];
    self.dashedView.dashColor = [UIColor colorWithRed:128.0f/255.0f green:209.0f/255.0f blue:37.0f/255.0f alpha:1.0f];
}

@end
