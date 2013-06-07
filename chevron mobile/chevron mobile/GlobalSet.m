//
//  GlobalSet.m
//  chevron mobile
//
//  Created by Praveen Reddy Thatiguttla on 6/2/13.
//  Copyright (c) 2013 chevron. All rights reserved.
//

#import "GlobalSet.h"
#import "Reachability.h"
#import <SystemConfiguration/SystemConfiguration.h>

@implementation GlobalSet
@synthesize loginflag=_loginflag;
@synthesize UserData=_UserData;
@synthesize QueueData=_QueueData;

+ (GlobalSet *)sharedInstance
{
    // the instance of this class is stored here
    static GlobalSet *myInstance = nil;
    
    // check to see if an instance already exists
    if (nil == myInstance) {
        myInstance  = [[[self class] alloc] init];
        // initialize variables here
    }
    // return the instance of this class
    return myInstance;
}

+ (BOOL)connected
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    return (networkStatus == ReachableViaWiFi);
}

@end
