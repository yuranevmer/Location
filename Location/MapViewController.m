//
//  MapViewController.m
//  Location
//
//  Created by yura on 5/29/13.
//  Copyright (c) 2013 yura. All rights reserved.
//

#import "MapViewController.h"



@interface MapViewController ()
-(void) findLocation;


@property (retain, nonatomic) IBOutlet UIButton *searchButton;
@property (retain, nonatomic) IBOutlet UITextField *searchTextField;
@property (retain, nonatomic) IBOutlet MKMapView* mapView;
@property (nonatomic,retain) CLLocation* currentLocation;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@end

@implementation MapViewController
@synthesize mapView = _mapView;
@synthesize locationManager = _locationManager;
@synthesize currentLocation = _currentLocation;
@synthesize activityIndicator = _activityIndicator;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = kCLDistanceFilterNone;
    }
    return self;
}

- (IBAction)clickedSearchButton:(id)sender {
    CLLocationCoordinate2D coords = self.currentLocation.coordinate;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coords, 100, 100);
    [self.mapView setRegion:region animated:YES];
}

-(void) startFindingLocation
{
    [self.activityIndicator startAnimating];
    [self.locationManager startUpdatingLocation];
}


-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    self.currentLocation = newLocation;
    NSLog(@"%@", newLocation);
}

-(void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D coords = userLocation.coordinate;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coords, 2000, 2000);
    [self.mapView setRegion:region animated:YES];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mapView.showsUserLocation = YES;
    self.mapView.delegate = self;
    [self startFindingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_mapView release];
    [_searchTextField release];
    [_searchButton release];
    [_activityIndicator release];
    [super dealloc];
}
@end
