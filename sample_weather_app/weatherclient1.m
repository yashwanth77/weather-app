//
//  weatherclient1.m
//  sample_weather_app
//
//  Created by Yashwanth on 2/27/14.
//  Copyright (c) 2014 Yashwanth. All rights reserved.
//

#import "weatherclient1.h"
#import "Headerfile.h"
#import "ViewController.h"

//#import "ForecastObservation.h"
static NSString * const kWeatherUndergroundAPIBaseURLString = @"http://api.wunderground.com/api/";
static  NSString *mynewlocation;

@implementation weatherclient1



#pragma mark - Singleton
+ (instancetype)sharedClient
{
    static weatherclient1 *sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        NSString *baseURLString = [kWeatherUndergroundAPIBaseURLString stringByAppendingString:kWeatherUndergroundAPIKey];
        sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:baseURLString]];
      });
    NSLog(@"shared client is %@",sharedClient);
    return sharedClient;
}
#pragma mark - Initialization

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self)
    {
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
          [self setDefaultHeader:@"Accept" value:@"application/json"];
     }
    NSLog(@"json class is %@",self);
    return self;
}
- (void)getCurrentWeatherObservationForLocation:(CLLocation *)location1 completion:(void(^)(Observation *observation1, NSError *error))completion
{
    NSLog(@"observ is %@",completion);
    if (location1)
    {
        NSString *getPath = [NSString stringWithFormat:@"conditions/q/%.6f,%.6f.json", location1.coordinate.latitude, location1.coordinate.longitude];
        NSLog(@"path is %@",getPath);
        weatherclient1 *client = [weatherclient1 sharedClient];
        [client getPath:getPath
             parameters:nil
                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    NSLog(@"success %@",operation);
                    Observation *observation = [Observation observationWithDictionary:responseObject[@"current_observation"]];
                    NSLog(@"hai %@",completion);
                    completion(observation, nil);
                }
                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    completion(nil, error);
                }
         ];
    }
    else
    {
        completion(nil, [NSError errorWithDomain:@"Invalid Location as argument" code:-1 userInfo:nil]);
        
    }
}
//--------------------------------------------------------------------------------------------------------------
- (void)getForecastWeatherObservationForLocation:(CLLocation *)location1 completion:(void(^)(ForecastObservation *observation1, NSError *error))completion
{
    if (location1)
    {
        NSLog(@"hai %@",completion);
        NSString *getPath = [NSString stringWithFormat:@"forecast10day/q/%.6f,%.6f.json", location1.coordinate.latitude, location1.coordinate.longitude];
        weatherclient1 *client = [weatherclient1 sharedClient];
        [client getPath:getPath
             parameters:nil
                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    NSLog(@"success %f",location1.coordinate.longitude);
                   ForecastObservation  *forobservation = [ForecastObservation observationWithDictionary:responseObject[@"forecast"]];
                    completion(forobservation, nil);
                }
                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    completion(nil, error);
                }
         ];
    }
    else
    {
        completion(nil, [NSError errorWithDomain:@"Invalid Location as argument" code:-1 userInfo:nil]);
        
    }
}
//----------------------------------------------------------------------------------------------------------
+(void)getLocationFromUser:(NSString *)enteredloc
{
    mynewlocation=enteredloc;
}

- (void)getForecastWeatherObservationForLocationtwo:(CLLocation *)location1 completion:(void(^)(Observation1 *observation1, NSError *error))completion
{
    if (location1)
    {
        NSLog(@"hai %@",completion);
        NSString *getPath = [NSString stringWithFormat:@"conditions/q/CA/%@.json",mynewlocation];
        weatherclient1 *client = [weatherclient1 sharedClient];
        [client getPath:getPath
             parameters:nil
                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    NSLog(@"success %f",location1.coordinate.longitude);
                Observation1  *forobservation = [Observation1 observationWithDictionary:responseObject[@"current_observation"]];
                    NSLog(@"ref of for obs is %@",forobservation);
                     NSLog(@"ref of for obs111 is %@",responseObject);
                    NSLog(@"ref of for obs2222 is %@",responseObject[@"current_observation"]);
                    completion(forobservation, nil);
                }
                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    completion(nil, error);
                }
         ];
    }
    else
    {
        completion(nil, [NSError errorWithDomain:@"Invalid Location as argument" code:-1 userInfo:nil]);
        
    }
}
//--------------------------------------------------------------------------------------------------

- (void)getForecastWeatherObservationForEnteredlocation:(CLLocation *)location1 completion:(void(^)(ForecastObservation1 *observation1, NSError *error))completion
    {
        if (location1)
        {
            // We have to do this because their API is not exactly rest
            NSLog(@"hai %@",completion);
             NSString *getPath = [NSString stringWithFormat:@"forecast10day/q/CA/%@.json",mynewlocation];
            weatherclient1 *client = [weatherclient1 sharedClient];
            [client getPath:getPath
                 parameters:nil
                    success:^(AFHTTPRequestOperation *operation, id responseObject) {
                        NSLog(@"success %f",location1.coordinate.longitude);
                        ForecastObservation1  *forobservation = [ForecastObservation1 observationWithDictionary:responseObject[@"forecast"]];
                        completion(forobservation, nil);
                    }
                    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                        completion(nil, error);
                    }
             ];
        }
        else
        {
            completion(nil, [NSError errorWithDomain:@"Invalid Location as argument" code:-1 userInfo:nil]);
            
        }
    }


@end
