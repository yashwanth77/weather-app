//
//  ForecastObservation1.m
//  sample_weather_app
//
//  Created by Yashwanth on 3/4/14.
//  Copyright (c) 2014 Yashwanth. All rights reserved.
//

#import "ForecastObservation1.h"

@implementation ForecastObservation1
+ (NSDictionary *)keyMapping
{
    static NSDictionary *keyMapping = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        keyMapping = @{
                       
                       @"icon"                         : @"iconName",
                       @"icon_url"                     : @"iconUrl",
                       @"title"                        : @"weathertitle",
                       @"icon"                         : @"iconName1",
                       @"icon_url"                     : @"iconUrl1",
                       @"title"                        : @"weathertitle1",
                       @"icon"                         : @"iconName2",
                       @"icon_url"                     : @"iconUrl2",
                       @"title"                        : @"weathertitle2",
                       
                       };
    });
    
    return keyMapping;
}

+ (instancetype)observationWithDictionary:(NSDictionary *)dictionary
{
    ForecastObservation1 *fobservation = nil;
    if (dictionary)
    {
        NSLog(@"all keys %@",[dictionary allKeys]);
        fobservation=[[ForecastObservation1 alloc]init];
        NSDictionary *newarr=[dictionary objectForKey:@"txt_forecast"];
        NSArray *arr1=[newarr objectForKey:@"forecastday"];
        int count=-1;
        NSLog(@"my arr is %@",arr1);
        for (NSDictionary *mydict  in arr1) {
            count++;
            if (count==2) {
                NSLog(@"value for cnt 2 %@",[mydict objectForKey:@"title"]);
                NSLog(@"value for icon cnt 2 %@",[mydict objectForKey:@"icon"]);
                NSLog(@"value for icon_url cnt 2 %@",[mydict objectForKey:@"icon_url"]);
                [fobservation setValue:[mydict objectForKey:@"title"] forKey:@"weathertitle"];
                [fobservation setValue:[mydict objectForKey:@"icon"] forKey:@"iconName"];
                [fobservation setValue:[mydict objectForKey:@"icon_url"] forKey:@"iconUrl"];
            }
            if (count==4) {
                NSLog(@"value for cnt 2 %@",[mydict objectForKey:@"title"]);
                NSLog(@"value for icon cnt 2 %@",[mydict objectForKey:@"icon"]);
                NSLog(@"value for icon_url cnt 2 %@",[mydict objectForKey:@"icon_url"]);
                [fobservation setValue:[mydict objectForKey:@"title"] forKey:@"weathertitle1"];
                [fobservation setValue:[mydict objectForKey:@"icon"] forKey:@"iconName1"];
                [fobservation setValue:[mydict objectForKey:@"icon_url"] forKey:@"iconUrl1"];
            }
            if (count==6) {
                NSLog(@"value for cnt 2 %@",[mydict objectForKey:@"title"]);
                NSLog(@"value for icon cnt 2 %@",[mydict objectForKey:@"icon"]);
                NSLog(@"value for icon_url cnt 2 %@",[mydict objectForKey:@"icon_url"]);
                [fobservation setValue:[mydict objectForKey:@"title"] forKey:@"weathertitle2"];
                [fobservation setValue:[mydict objectForKey:@"icon"] forKey:@"iconName2"];
                [fobservation setValue:[mydict objectForKey:@"icon_url"] forKey:@"iconUrl2"];
            }
        }
        
       }
    
     return fobservation;
}

@end
