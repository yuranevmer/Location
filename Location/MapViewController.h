//
//  MapViewController.h
//  Location
//
//  Created by yura on 5/29/13.
//  Copyright (c) 2013 yura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>

@property (nonatomic, retain) CLLocationManager* locationManager;
@end
