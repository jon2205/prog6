//
//  ShotNetworkManager.m
//  prog6
//
//  Created by Admin on 10/18/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "ShotNetworkManager.h"

@implementation ShotNetworkManager

+ (id)sharedManager {
    static ShotNetworkManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (void)shotRequest:(void (^) (NSArray *shots))success failure:(void (^)(NSString *errorMessage))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://api.dribbble.com/shots/popular?per_page=50" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         if ([responseObject[@"shots"] isKindOfClass:[NSArray class]]) {
             success(responseObject[@"shots"]);
         } else {
             failure(@"Responce not array");
         }         
     }
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         failure([error localizedDescription]);
         NSLog(@"Error: %@", error);
     }];
}


@end
