//
//  WCMSplashView.m
//  MapDrawTest
//
//  Created by Jeremy Garrell on 11/4/14.
//  Copyright (c) 2014 Jeremy Garrell. All rights reserved.
//

#import "WCMSplashView.h"
#import "WCMViewController.h"

@implementation WCMSplashView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    // Figure our the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    UIImage *splashImage = [UIImage imageNamed:@"splashImage.jpeg"];
    
    CGPoint centerLogo;
    centerLogo.x = bounds.origin.x + bounds.size.width / 2.0;
    centerLogo.y = bounds.origin.y + bounds.size.height / 2.0;
    int logoWidth = 359 * 2/3;
    int logoHeight = 480 * 2/3;
    
    CGRect imageLayer = CGRectMake(centerLogo.x - (logoWidth / 2), centerLogo.y - (logoHeight / 2), logoWidth, logoHeight);
    
    [splashImage drawInRect:imageLayer];
    
    UIImage *welcomeImage = [UIImage imageNamed:@"welcomeImage.png"];
    
    CGPoint centerWelcome;
    centerWelcome.x = bounds.origin.x + bounds.size.width / 2;
    centerWelcome.y = bounds.origin.y + bounds.size.height / 2.66;
    int welcomeWidth = 304;
    int welcomeHeight = 51;
    
    CGRect welcomeLayer = CGRectMake(centerWelcome.x - (welcomeWidth / 2), centerWelcome.y - (welcomeHeight / 2), welcomeWidth, welcomeHeight);
    
    [welcomeImage drawInRect:welcomeLayer];
    
    UIImage *clkImage = [UIImage imageNamed:@"clkImage.png"];
    
    CGPoint centerClk;
    centerClk.x = bounds.origin.x + bounds.size.width / 1.66;
    centerClk.y = bounds.origin.y + bounds.size.height / 1.33;
    int clkWidth = 391 / 2;
    int clkHeight = 52 / 2;
    
    CGRect clkLayer = CGRectMake(centerClk.x - (clkWidth / 2), centerClk.y - (clkHeight / 2), clkWidth, clkHeight);
    
    [clkImage drawInRect:clkLayer];
}

- (void) switchView
{
    NSLog(@"Switch the view!");
}


@end
