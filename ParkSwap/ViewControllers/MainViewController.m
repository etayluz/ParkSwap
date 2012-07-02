//
//  MainViewController.m
//  ParkSwap
//
//  Created by Dan Berenholtz on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize buyButton, sellButton;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    /* Buy Button */
    self.buyButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [self.buyButton addTarget:self action:@selector(buyButtonTap) forControlEvents:UIControlEventTouchDown];
    [self.buyButton setTitle: @"Buy Spot" forState: UIControlStateNormal];
    self.buyButton.frame = CGRectMake(60, 100, 200, 30);
    [self.view addSubview:self.buyButton];
    
    /* Sell Button */
    self.sellButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [self.sellButton addTarget:self action:@selector(sellButtonTap) forControlEvents:UIControlEventTouchDown];
    [self.sellButton setTitle: @"Sell Spot" forState: UIControlStateNormal];
    self.sellButton.frame = CGRectMake(60, 300, 200, 30);
    [self.view addSubview:self.sellButton];
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