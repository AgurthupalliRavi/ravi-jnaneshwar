//
//  GlobalSet.h
//  chevron mobile
//
//  Created by Praveen Reddy Thatiguttla on 6/2/13.
//  Copyright (c) 2013 chevron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalSet : NSObject

@property (nonatomic,retain) NSMutableArray *UserData;
@property (nonatomic,retain) NSMutableArray *QueueData;

@property (assign,readwrite) BOOL loginflag;

+ (GlobalSet *)sharedInstance;
+ (BOOL)connected;

@end