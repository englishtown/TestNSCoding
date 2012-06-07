//
//  MyObject2.m
//  TestNSCoding
//
//  Created by Lin Shi on 6/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyObject2.h"

@implementation MyObject2
@synthesize name,man;

- (NSString*) description{
    return [NSString stringWithFormat:@"uuid %@ name %@ is man %d", self.uuid ,name , man];
}
@end
