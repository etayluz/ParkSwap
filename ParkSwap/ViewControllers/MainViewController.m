//
//  MainViewController.m
//  ParkSwap
//
//  Created by Dan Berenholtz on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "MapViewController.h"

@interface MainViewController () 

@end

@implementation MainViewController

@synthesize buyButton, sellButton, window, tabBarController;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    /* Buy Button */
    self.buyButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [self.buyButton addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchDown];
    [self.buyButton setTitle: @"Buy Spot" forState: UIControlStateNormal];
    self.buyButton.frame = CGRectMake(60, 100, 200, 30);
    [self.view addSubview:self.buyButton];
    
    /* Sell Button */
    self.sellButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [self.sellButton addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchDown];
    [self.sellButton setTitle: @"Sell Spot" forState: UIControlStateNormal];
    self.sellButton.frame = CGRectMake(60, 300, 200, 30);
    [self.view addSubview:self.sellButton];

}

- (void)buttonTap: (id)sender;
{
    [super viewDidUnload];
    
    MapViewController *mapBuyViewController = [[MapViewController alloc] init];
    UITabBarItem* buyTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Buy Spot" image: [UIImage imageNamed:@"trolley.png"] tag:0];
    mapBuyViewController.tabBarItem = buyTabBarItem;
    
    MapViewController *mapSellViewController = [[MapViewController alloc] init];
    UITabBarItem* sellTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Sell Spot" image: [UIImage imageNamed:@"pricetag.png"]tag:1];
    mapSellViewController.tabBarItem = sellTabBarItem;

    //[self presentModalViewController:mapViewController animated:YES];

    self.tabBarController = [[[UITabBarController alloc] init] autorelease];


    self.tabBarController.viewControllers = [NSArray arrayWithObjects:
                                             mapBuyViewController, mapSellViewController, nil];

    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
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
