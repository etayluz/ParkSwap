//
//  MapViewController.h
//  ParkSwap
//
//  Created by Etay Luz on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ASIHTTPRequestDelegate.h"
#import "ASIFormDataRequest.h"

@interface SellMapViewController : UIViewController <MKMapViewDelegate> {
    
    MKMapView *mapView;
    UILabel *instructionsLabel;
}
@property (nonatomic, retain) ASIFormDataRequest *request;
@end