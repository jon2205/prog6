//
//  ShotNetworkManager.h
//  prog6
//
//  Created by Admin on 10/18/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface ShotNetworkManager : NSObject

+ (id)sharedManager;

- (void)shotRequest:(void (^) (NSArray *shots))success failure:(void (^)(NSString *errorMessage))failure;

@end
