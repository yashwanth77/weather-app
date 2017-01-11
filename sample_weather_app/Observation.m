//
//  Observation.m
//  sample_weather_app
//
//  Created by Yashwanth on 2/27/14.
//  Copyright (c) 2014 Yashwanth. All rights reserved.
//

#import "Observation.h"

@implementation Observation
+ (NSDictionary *)keyMapping
{
    static NSDictionary *keyMapping = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        keyMapping = @{
                       @"display_location"             : @"location",
                       @"observation_location"         : @"observationLocation",
                       @"image"                        : @"weatherUndergroundImageInfo",
                       @"observation_time"             : @"timeString",
                       @"weather"                      : @"weatherDescription",
                       @"wind_string"                  : @"windDescription",
                       @"feelslike_string"             : @"feelslikestring",
                       @"relative_humidity"            : @"relativeHumidity",
                       @"dewpoint_string"              : @"dewpointDescription",
                       @"icon"                         : @"iconName",
                       @"icon_url"                     : @"iconUrl",
                       @"temp_f"                       : @"temperatureF",
                       @"temp_c"                       : @"temperatureC",
                       };
    });
    
    return keyMapping;
}
+ (instancetype)observationWithDictionary:(NSDictionary *)dictionary
{
    Observation *observation = nil;
    if (dictionary)
    {
        observation = [[Observation alloc] init];
        NSDictionary *keyMapping = [self keyMapping];
        for (NSString *key in keyMapping)
        {
            id value = dictionary[key];
            
            if (value)
            {
                [observation setValue:value forKey:keyMapping[key]];
            }
        }
        return observation;
    }
     else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SORRY!!!"
                                                        message:@"DATA NOT FOUND"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return nil;
    }
}

@end
