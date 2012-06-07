//
//  BaseCodingModel.m
//  TestNSCoding
//
//  Created by Lin Shi on 6/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BaseCodingModel.h"

#import "objc/runtime.h"
#import <objc/message.h>

@implementation BaseCodingModel
@synthesize uuid = _uuid;


- (NSArray *)propertyKeys
{
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count; i++)
    {
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        NSString *key = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
        [array addObject:key];
    }
    free(properties);
    
    NSLog(@"%s array %@", __PRETTY_FUNCTION__ , array);
    
    return array;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [self init]))
    {
        for (NSString *key in [self propertyKeys])
        {
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    for (NSString *key in [self propertyKeys])
    {
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
}


@end
