//
//  MyObjects.m
//  TestNSCoding
//
//  Created by Lin Shi on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyObjects.h"

@implementation MyObjects

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:objectArray forKey:@"array"];
}


- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [self init];
    if (self) {
        objectArray = [aDecoder decodeObjectForKey:@"array"];
    }
    return self;
}

@end
