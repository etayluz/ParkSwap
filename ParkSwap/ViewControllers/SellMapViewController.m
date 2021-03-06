//
//  MapViewController.m
//  ParkSwap
//
//  Created by Etay Luz on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SellMapViewController.h"

@interface SellMapViewController ()

@end

@implementation SellMapViewController

@synthesize request;

- (void)viewDidLoad
{   
    [super viewDidLoad];

    UILabel *myNavigationTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, self.view.frame.size.width, 33)];
    myNavigationTitleLabel.textColor = [UIColor whiteColor];
    myNavigationTitleLabel.backgroundColor = [UIColor clearColor];
    myNavigationTitleLabel.text = @"Tap on the map where you are parked";
    myNavigationTitleLabel.textAlignment = UITextAlignmentCenter;
    myNavigationTitleLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:17];
    [self.navigationController.navigationBar addSubview:myNavigationTitleLabel];
    [myNavigationTitleLabel release];
    //instructionsLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 320, 20)];
    //instructionsLabel.text = @"Tap on the map where your car is parked";
    //[self.view addSubview:instructionsLabel];
    
    mapView = [[MKMapView alloc] init]; 
    mapView.frame = CGRectMake(0, 0, 320, 640);
    [mapView setDelegate:self];
#if TARGET_IPHONE_SIMULATOR
    /* Upper West Side */
    MKCoordinateRegion region = {40.782, -73.974338};
    region.span.longitudeDelta = 0.01;
    region.span.latitudeDelta = 0.01;  
    [mapView setRegion:region animated:YES];
#endif
    [self.view addSubview:mapView];
    
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] 
                                   initWithTarget:self action:@selector(handleGesture:)];
    tgr.numberOfTapsRequired = 1;
    tgr.numberOfTouchesRequired = 1;
    [mapView addGestureRecognizer:tgr];
    
    [tgr release];
}

- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded)
        return;
    
    CGPoint touchPoint = [gestureRecognizer locationInView:mapView];
    CLLocationCoordinate2D touchMapCoordinate = 
    [mapView convertPoint:touchPoint toCoordinateFromView:mapView];


    //NSLog(@"touchPoint=%@", touchPoint);
    NSLog(@"touchMapCoordinate.latitude=%f", touchMapCoordinate.latitude);
    NSLog(@"touchMapCoordinate.longitude=%f", touchMapCoordinate.longitude);

    MKPointAnnotation *pa = [[MKPointAnnotation alloc] init];
    pa.coordinate = touchMapCoordinate;
    pa.title = @"Hello";
    [mapView addAnnotation:pa];
    [pa release];
    
    [self send:touchMapCoordinate];
}

- (void) send:(CLLocationCoordinate2D) touchMapCoordinate
{
    NSString *latitude = [NSString stringWithFormat:@"%f", touchMapCoordinate.latitude];
    NSString *longitude = [NSString stringWithFormat:@"%f", touchMapCoordinate.longitude];
    
    //NSString *url = @"http://localhost:9393/form";
    //NSString *url = @"http://localhost:9292/form";
    //NSString *url = @"http://localhost:3000/locations/";
    NSString *url = @"http://lit-plains-9735.herokuapp.com/locations";

    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys: 
                            latitude, @"latitude", longitude, @"longitude", nil];

    //NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys: 
    //                        latitude, @"latitude", nil];
    
    [self sendToUrl:url withParams:params];
}

- (void) sendToUrl:(NSString *)url withParams:(NSDictionary *)params
{
    NSURL *u = [NSURL URLWithString:url];
    self.request = [ASIFormDataRequest requestWithURL:u];
    self.request.delegate = self;
    
    for (id key in params) {
        [self.request setPostValue:[params objectForKey:key] forKey:key];
    }
    
    [self.request startAsynchronous];
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
