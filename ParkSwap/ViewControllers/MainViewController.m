//
//  MainViewController.m
//  ParkSwap
//
//  Created by Dan Berenholtz on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "MainViewController.h"
#import "SellMapViewController.h"
#import "BuyMapViewController.h"
#import "AccountViewController.h"


@interface MainViewController () 

@end

@implementation MainViewController

@synthesize findSpotButton, offerSpotButton, window, tabBarController;


- (void)viewDidLoad
{
    [super viewDidLoad];

    UIImageView* imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    imgView.image = [UIImage imageNamed:@"Logo.png"];
    
    [self.view addSubview:imgView];

    /* Find Spot Button */
    UIImage *findSpotButtonImg = [UIImage imageNamed:@"FindSpot.png"];
    self.findSpotButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.findSpotButton.frame = CGRectMake(60, 290, 200, 50);
    [self.findSpotButton addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchDown];
    [self.findSpotButton setTitle: @"" forState: UIControlStateNormal];

    [self.findSpotButton setBackgroundImage:findSpotButtonImg forState:UIControlStateNormal];
    [self.view addSubview:self.findSpotButton];  
    
    /* Offer Spot Button */
    UIImage *offerSpotButtonImg = [UIImage imageNamed:@"OfferSpot.png"];
    self.offerSpotButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.offerSpotButton.frame = CGRectMake(60, 370, 200, 50);
    [self.offerSpotButton addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchDown];
    [self.offerSpotButton setTitle: @"" forState: UIControlStateNormal];
    [self.offerSpotButton setBackgroundImage:offerSpotButtonImg forState:UIControlStateNormal];
    [self.view addSubview:self.offerSpotButton];  
}

- (void)buttonTap: (id)sender;
{
    [super viewDidUnload];
    
    BuyMapViewController *mapBuyViewController = [[BuyMapViewController alloc] init];
    UITabBarItem* buyTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Buy Spot" image: [UIImage imageNamed:@"trolley.png"] tag:0];
    mapBuyViewController.tabBarItem = buyTabBarItem;
    
    SellMapViewController *mapSellViewController = [[SellMapViewController alloc] init];
    UITabBarItem* sellTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Sell Spot" image: [UIImage imageNamed:@"pricetag.png"]tag:1];
    mapSellViewController.tabBarItem = sellTabBarItem;

    AccountViewController *profileViewController = [[AccountViewController alloc] init];
    UITabBarItem* profileTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Account" image: [UIImage imageNamed:@"profile_icon.png"] tag:0];
    profileViewController.tabBarItem = profileTabBarItem;
    

    self.tabBarController = [[[UITabBarController alloc] init] autorelease];


    self.tabBarController.viewControllers = [NSArray arrayWithObjects:
                                             mapBuyViewController, mapSellViewController, profileViewController, nil];
    
    [self presentModalViewController:self.tabBarController animated:YES];
    if (sender == self.offerSpotButton)
        [self.tabBarController setSelectedIndex:1];
}

- (void) viewDidAppear:(BOOL)animated
{
    /* UNCOMMENT TO SKIP TO MAP VIEW */
    //[self buyButtonTap];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
