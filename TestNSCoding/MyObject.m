//
//  MyObject.m
//  TestNSCoding
//
//  Created by Lin Shi on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyObject.h"

#define kID @"myId"

@implementation MyObject
@synthesize myId = _myId;


- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_myId forKey:kID];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.myId = [aDecoder decodeObjectForKey:kID];
    }
    return self;
}

@end
