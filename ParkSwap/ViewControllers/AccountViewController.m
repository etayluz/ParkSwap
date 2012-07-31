//
//  ProfileViewController.m
//  ParkSwap
//
//  Created by David Tay on 7/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AccountViewController.h"

@interface AccountViewController ()

@end

@implementation AccountViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    balanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 50, 100, 20)];
    balanceLabel.text = @"Balance = $3";
    [self.view addSubview:balanceLabel];
    
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
