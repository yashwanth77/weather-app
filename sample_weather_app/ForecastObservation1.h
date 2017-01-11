//
//  ForecastObservation1.h
//  sample_weather_app
//
//  Created by Yashwanth on 3/4/14.
//  Copyright (c) 2014 Yashwanth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ForecastObservation1 : NSObject
@property (nonatomic, strong) NSString      *iconName;
@property (nonatomic, strong) NSString      *iconUrl;
@property (nonatomic, strong) NSString      *weathertitle;
@property (nonatomic, strong) NSString      *iconName1;
@property (nonatomic, strong) NSString      *iconUrl1;
@property (nonatomic, strong) NSString      *weathertitle1;
@property (nonatomic, strong) NSString      *iconName2;
@property (nonatomic, strong) NSString      *iconUrl2;
@property (nonatomic, strong) NSString      *weathertitle2;
+ (instancetype)observationWithDictionary:(NSDictionary *)dictionary;

@end
