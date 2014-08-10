SlantyDashedView
================
A view requested by a redditor

![image](https://raw.githubusercontent.com/daltonclaybrook/SlantyDashedView/master/examples.png)

##Example Usage

Initialize the view from a `XIB` / `Storyboard`, or programmatically using any of the initializer methods on `UIView`

    SlantyDashedView *dashedView = [[SlantyDashedView alloc] initWithFrame:CGRectMake(0, 0, 200, 12)];

Choose colors:

    dashedView.backgroundColor = [UIColor redColor];
    dashedView.dashColor = [UIColor greenColor];
    
Specify width and spacing values for the dashes:

    dashedView.dashWidth = 8.0f;
    dashedView.dashSpacing = 12.0f;
    
Specify the horizontal translation of the dashes:

    dashedView.horizontalTranslation = 6.0f;
    
Animate the dashes:

    dashedView.animationDirection = SlantyDashedViewAnimationDirectionRightToLeft;
    
    // animation speed is specified in points per second
    [dashedView startAnimatingWithSpeed:40.0f];
    
    // after some time has elapsed
    [dashedView stopAnimating];


