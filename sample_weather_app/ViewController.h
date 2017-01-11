//
//  ViewController.h
//  sample_weather_app
//
//  Created by Yashwanth on 2/26/14.
//  Copyright (c) 2014 Yashwanth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Observation1.h"
@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *weatherimage;
@property (strong, nonatomic) IBOutlet UIView *refresh;
@property (strong, nonatomic) IBOutlet UILabel *humidityLabel;
@property (strong, nonatomic) IBOutlet UILabel *cityname;
@property (strong, nonatomic) IBOutlet UIImageView *tomorrowweatherimage;
@property (strong, nonatomic) IBOutlet MKMapView *maplocaton;
@property (strong, nonatomic) IBOutlet UILabel *dewpoint;
@property (strong, nonatomic) IBOutlet UILabel *weatherstatus;
@property (strong, nonatomic) IBOutlet UILabel *visibilityindicator;
@property (strong, nonatomic) IBOutlet UILabel *winddirection;
@property (strong, nonatomic) IBOutlet UILabel *tomorrow;
@property (strong, nonatomic) IBOutlet UILabel *tomorrowstatus;
@property (strong, nonatomic) IBOutlet UILabel *dayafter;
@property (strong, nonatomic) IBOutlet UIImageView *dayafterimg;
@property (strong, nonatomic) IBOutlet UILabel *dayafterstatus;
@property (strong, nonatomic) IBOutlet UILabel *statusofweather;
@property (strong, nonatomic) IBOutlet UILabel *incenti;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *actiindi;
@property (strong, nonatomic) IBOutlet UISwitch *myswitch;
- (IBAction)changetemp:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *infaren;
@property (strong, nonatomic) IBOutlet UISearchBar *searchbar;
@property (strong, nonatomic) IBOutlet UILabel *thirddaystatus;
@property (strong, nonatomic) IBOutlet UIImageView *thirddayimage;
@property (strong, nonatomic) IBOutlet UILabel *thirdday;
@property (strong, nonatomic) IBOutlet UIImageView *mapicon;
@property (strong, nonatomic) IBOutlet UIImageView *searchicon;
@property (strong, nonatomic) IBOutlet UILabel *apptitle;
@property (strong, nonatomic) IBOutlet UILabel *lastupdated;
@end
