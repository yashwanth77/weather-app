//
//  ViewController.m
//  sample_weather_app
//
//  Created by Yashwanth on 2/26/14.
//  Copyright (c) 2014 Yashwanth. All rights reserved.
//

#import "ViewController.h"
#import "LocationManager.h"
#import "weatherclient1.h"

@interface ViewController ()

@end

@implementation ViewController

{
    NSString *infarenheit,*incentigrade;
   // static NSString *mynewloc;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *lpgr = [[UITapGestureRecognizer alloc]
                                    initWithTarget:self action:@selector(longpressToGetLocation:)];
    [_mapicon setUserInteractionEnabled:YES];
    [_mapicon addGestureRecognizer:lpgr];
    _maplocaton.hidden=YES;
    _searchbar.hidden=YES;
    
    UITapGestureRecognizer *locicon = [[UITapGestureRecognizer alloc]
                                    initWithTarget:self action:@selector(tapToEnterLoc:)];
    [_searchicon setUserInteractionEnabled:YES];
    [_searchicon addGestureRecognizer:locicon];
    
    UILongPressGestureRecognizer *lpgr1 = [[UILongPressGestureRecognizer alloc]
                                           initWithTarget:self action:@selector(longpressToGetLocation1:)];
    lpgr1.minimumPressDuration = 0.7;  
    [_maplocaton addGestureRecognizer:lpgr1];
    [self Forecastreloaddata];
    [self currentreloaddata];
     self.searchbar.delegate=self;
   [[LocationManager sharedManager] startMonitoringLocationChanges];
    [_actiindi startAnimating];
    [[UISwitch appearance] setOnImage:[UIImage imageNamed:@"centi.png"]];
    [[UISwitch appearance] setOffImage:[UIImage imageNamed:@"faren.png"]];
    [_myswitch setOnTintColor: [UIColor whiteColor]];
    [_myswitch setTintColor: [UIColor whiteColor]];
    [_myswitch setThumbTintColor: [UIColor blackColor]];
    [_infaren setHidden:YES];
 }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)updateUIWithObservation:(Observation *)obs
{
    if (obs) {
        [self.weatherimage setImageWithURL:[NSURL URLWithString:obs.iconUrl]];
        self.humidityLabel.text = obs.relativeHumidity;
        incentigrade= [obs.temperatureC stringValue];
        self.incenti.text=incentigrade;
         infarenheit = [[obs.temperatureF stringValue]substringToIndex:2];
        self.infaren.text=infarenheit;
        self.statusofweather.text=obs.iconName;
        self.dewpoint.text=obs.dewpointDescription;
        self.weatherstatus.text=obs.weatherDescription;
        self.winddirection.text=obs.windDescription;
        self.visibilityindicator.text=obs.feelslikestring;
          NSDictionary *getcity=obs.observationLocation;
          self.cityname.text=[getcity objectForKey:@"city"];
        self.lastupdated.text=[obs.timeString substringToIndex:33];
         }
    
}
-(void)currentreloaddata
{
    weatherclient1 *wc=[weatherclient1 sharedClient];
    CLLocation *loc=[[LocationManager sharedManager]currentLocation];
     [wc getCurrentWeatherObservationForLocation:loc completion:^(Observation *observation, NSError *error)
    {
        NSLog(@"here obs is %@",observation);
       if (error)
        {
            NSLog(@"Web Service Error: %@", [error description]);
            
        }
        else
        {
            [self updateUIWithObservation:observation];
              [_actiindi stopAnimating];
        }
    }];
    
}
-(void)updateUIWithObservation1:(ForecastObservation *)obs
{
    if (obs) {
        [self.tomorrowweatherimage setImageWithURL:[NSURL URLWithString:obs.iconUrl]];
        self.tomorrow.text=obs.iconName;
        self.tomorrowstatus.text=obs.weathertitle;
        [self.dayafterimg setImageWithURL:[NSURL URLWithString:obs.iconUrl1]];
        self.dayafterstatus.text=obs.weathertitle1;
        self.dayafter.text=obs.iconName1;
        [self.thirddayimage setImageWithURL:[NSURL URLWithString:obs.iconUrl2]];
        self.thirdday.text=obs.iconName2;
        self.thirddaystatus.text=obs.weathertitle2;
        
    }
    
}

-(void)Forecastreloaddata
{
    weatherclient1 *wc=[weatherclient1 sharedClient];
    CLLocation *loc=[[LocationManager sharedManager]currentLocation];
    //CLLocation *loc=[[LocationManager sharedManager]currentLocation];
    NSLog(@"lat value is %f",loc.coordinate.longitude);
    NSLog(@"haiiiiiii %@",loc);

    [wc getForecastWeatherObservationForLocation:loc completion:^(ForecastObservation *observation, NSError *error)
    {
        if (error)
        {
            NSLog(@"Web Service Error: %@", [error description]);
        }
        else
        {
            [self updateUIWithObservation1:observation];
            [_actiindi stopAnimating];
        }
    }];
    
}
- (void)longpressToGetLocation:(UIGestureRecognizer *)gestureRecognizer
{
    NSUInteger nooftouches=[gestureRecognizer numberOfTouches];
    if (nooftouches==1) {
        [self.maplocaton setShowsUserLocation:YES];
        [UIView animateWithDuration:0.5 animations:^{
                   _maplocaton.frame = CGRectMake(0,
                                     548,
                                     320,
                                     -548);
            _maplocaton.hidden=NO;
            CLLocation *loc=[[LocationManager sharedManager]currentLocation];
            MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc.coordinate, 180000, 180000);
            [self.maplocaton setRegion:[self.maplocaton regionThatFits:region] animated:YES];
            MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
            point.coordinate = loc.coordinate;
            point.title = @"Temperature in Centigrade is";
            point.subtitle=incentigrade;
            [self.maplocaton addAnnotation:point];
                  }];
           }
}
- (void)tapToEnterLoc:(UIGestureRecognizer *)gestureRecognizer
{
    NSUInteger nooftouches=[gestureRecognizer numberOfTouches];
    if (nooftouches==1) {
        _apptitle.hidden=YES;
        _searchbar.hidden=NO;
       
        [UIView animateWithDuration:0.5 animations:^{
                    }];
    }
}
- (void)longpressToGetLocation1:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan)
        return;
    if ([gestureRecognizer numberOfTouches]==1) {
        _maplocaton.frame = CGRectMake(1,
                                 404,
                                 50,
                                 53);
           }
    _maplocaton.hidden=YES;
    if (!_searchbar.hidden) {
        _searchbar.hidden=YES;
        _apptitle.hidden=NO;
    }
}

- (IBAction)changetemp:(id)sender {
   // BOOL i=self.incenti.hidden;
    if (!self.incenti.hidden) {
        [_incenti setHidden:YES];
        [_infaren setHidden:NO];
    }
    else
    {
        [_incenti setHidden:NO];
        [_infaren setHidden:YES];
    }
    
}

//-------------------------------------------------------------

-(void)updateUIWithEnteredObservation:(Observation1 *)obs
{
    if (obs) {
        [self.weatherimage setImageWithURL:[NSURL URLWithString:obs.iconUrl]];
        self.humidityLabel.text = obs.relativeHumidity;
          NSString *centi = [obs.temperatureC stringValue];
         NSString *faren = [obs.temperatureF stringValue];
        self.incenti.text=centi;
        //faren = [[obs.temperatureF stringValue]substringToIndex:2];
        self.infaren.text=faren;
          self.statusofweather.text=obs.iconName;
        self.dewpoint.text=obs.dewpointDescription;
        self.weatherstatus.text=obs.weatherDescription;
        self.winddirection.text=obs.windDescription;
        self.visibilityindicator.text=obs.feelslikestring;
           NSDictionary *getcity=obs.observationLocation;
           self.cityname.text=[getcity objectForKey:@"city"];
        if ([obs.timeString length]<33) {
            self.lastupdated.text=@"";
        }
        else
          self.lastupdated.text=[obs.timeString substringToIndex:33];
         
    }
    
}

-(void)EnteredLocationreloaddata
{
    weatherclient1 *wc=[weatherclient1 sharedClient];
    CLLocation *loc=[[LocationManager sharedManager]currentLocation];
    [wc getForecastWeatherObservationForLocationtwo:loc completion:^(Observation1 *observation2, NSError *error) {
        if (error)
        {
            NSLog(@"Web Service Error: %@", [error description]);
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SORRY"
                                                            message:@"PROBLEM IN CONNECTION"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];

        }
        else
        {
            [self updateUIWithEnteredObservation:observation2];
            [_actiindi stopAnimating];
        }
    }];
    
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    _searchbar.hidden=YES;
    _apptitle.hidden=NO;
    [searchBar resignFirstResponder];
   NSString *mynewloc=_searchbar.text;
    [weatherclient1 getLocationFromUser:mynewloc];
     _searchbar.text=@"";
    [self EnteredLocationreloaddata];
    [self reloadForecastDataNewloc];
     [_actiindi startAnimating];
    
}
//-----------------------------------------------------------------------------------------------
-(void)updateUIWithObservationofLoc:(ForecastObservation1 *)obs
{
    if (obs) {
        [self.tomorrowweatherimage setImageWithURL:[NSURL URLWithString:obs.iconUrl]];
        // self.humidityLabel.text = obs.relativeHumidity;
        self.tomorrow.text=obs.iconName;
        self.tomorrowstatus.text=obs.weathertitle;
        [self.dayafterimg setImageWithURL:[NSURL URLWithString:obs.iconUrl1]];
        self.dayafterstatus.text=obs.weathertitle1;
        self.dayafter.text=obs.iconName1;
        [self.thirddayimage setImageWithURL:[NSURL URLWithString:obs.iconUrl2]];
        self.thirdday.text=obs.iconName2;
        self.thirddaystatus.text=obs.weathertitle2;
        
    }
    
}

-(void)reloadForecastDataNewloc
{
    weatherclient1 *wc=[weatherclient1 sharedClient];
    CLLocation *loc=[[LocationManager sharedManager]currentLocation];
    //CLLocation *loc=[[LocationManager sharedManager]currentLocation];
    NSLog(@"lat value is %f",loc.coordinate.longitude);
    NSLog(@"haiiiiiii %@",loc);
    
    [wc getForecastWeatherObservationForEnteredlocation:loc completion:^(ForecastObservation1 *observation, NSError *error) {
        if (error)
        {
            NSLog(@"Web Service Error: %@", [error description]);
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SORRY"
                                                            message:@"PROBLEM IN CONNECTION"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];

        }
        else
        {
            [self updateUIWithObservationofLoc:observation];
            [_actiindi stopAnimating];
        }
    }];
    
}

@end
