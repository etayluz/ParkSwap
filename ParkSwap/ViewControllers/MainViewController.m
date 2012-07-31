//
//  MainViewController.m
//  ParkSwap
//
//  Created by Dan Berenholtz on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "SellMapViewController.h"
#import "BuyMapViewController.h"
#import "AccountViewController.h"

@interface MainViewController () 

@end

@implementation MainViewController

@synthesize buyButton, sellButton, window, tabBarController;


- (void)viewDidLoad
{
    [super viewDidLoad];

    UIImageView* imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    imgView.image = [UIImage imageNamed:@"Logo.png"];
    
    [self.view addSubview:imgView];

    //UIColor *background = [[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Logo.png"]] autorelease];
    //UIColor *background = [[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Logo.png"]] autorelease];
    //self.view.backgroundColor = background; 
    
    /* Buy Button */
    self.buyButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [self.buyButton addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchDown];
    [self.buyButton setTitle: @"Find Spot" forState: UIControlStateNormal];
    self.buyButton.frame = CGRectMake(60, 290, 200, 30);
    [self.view addSubview:self.buyButton];
    
    /* Sell Button */
    self.sellButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [self.sellButton addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchDown];
    [self.sellButton setTitle: @"Offer Spot" forState: UIControlStateNormal];
    self.sellButton.frame = CGRectMake(60, 370, 200, 30);
    [self.view addSubview:self.sellButton];

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
    if (sender == self.sellButton)
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
