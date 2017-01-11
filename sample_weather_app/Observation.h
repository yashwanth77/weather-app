//
//  Observation.h
//  sample_weather_app
//
//  Created by Yashwanth on 2/27/14.
//  Copyright (c) 2014 Yashwanth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Observation : NSObject

@property (nonatomic, strong) NSDictionary  *location;
@property (nonatomic, strong) NSDictionary  *observationLocation;
@property (nonatomic, strong) NSDictionary  *weatherUndergroundImageInfo;
@property (nonatomic, strong) NSString      *weatherDescription;
@property (nonatomic, strong) NSString      *windDescription;
@property (nonatomic, strong) NSString      *relativeHumidity;
@property (nonatomic, strong) NSString      *dewpointDescription;
@property (nonatomic, strong) NSString      *iconName;
@property (nonatomic, strong) NSString      *iconUrl;
@property (nonatomic, strong) NSNumber      *temperatureF;
@property (nonatomic, strong) NSNumber      *temperatureC;
@property (nonatomic, strong) NSString      *feelslikestring;
@property (nonatomic, strong) NSString      *timeString;
+ (instancetype)observationWithDictionary:(NSDictionary *)dictionary;

@end
