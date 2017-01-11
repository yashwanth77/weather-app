//
//  LocationManager.h
//  sample_weather_app
//
//  Created by Yashwanth on 2/27/14.
//  Copyright (c) 2014 Yashwanth. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kLocationDidChangeNotificationKey;

@interface LocationManager : NSObject

@property (nonatomic, readonly) CLLocation  *currentLocation;
@property (nonatomic, readonly) BOOL       isMonitoringLocation;

+ (instancetype)sharedManager;

- (void)startMonitoringLocationChanges;
- (void)stopMonitoringLocationChanges;

@end