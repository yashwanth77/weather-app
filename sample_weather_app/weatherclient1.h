//
//  weatherclient1.h
//  sample_weather_app
//
//  Created by Yashwanth on 2/27/14.
//  Copyright (c) 2014 Yashwanth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Observation.h"
#import "ForecastObservation.h"
#import "Observation1.h"
#import "ForecastObservation1.h"
@interface weatherclient1 : AFHTTPClient
+ (instancetype)sharedClient;
- (void)getCurrentWeatherObservationForLocation:(CLLocation *)location
                                     completion:(void(^)(Observation *observation, NSError *error))completion;

- (void)getForecastWeatherObservationForLocation:(CLLocation *)location1 completion:(void(^)(ForecastObservation *observation1, NSError *error))completion;
- (void)getForecastWeatherObservationForLocationtwo:(CLLocation *)location2 completion:(void(^)(Observation1 *observation1, NSError *error))completion;
- (void)getForecastWeatherObservationForEnteredlocation:(CLLocation *)location1 completion:(void(^)(ForecastObservation1 *observation1, NSError *error))completion;
+(void)getLocationFromUser:(NSString *)enteredloc;
@end
