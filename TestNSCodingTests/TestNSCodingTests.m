//
//  TestNSCodingTests.m
//  TestNSCodingTests
//
//  Created by Lin Shi on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TestNSCodingTests.h"
#import "BaseCodingModel.h"
#import "MyObject2.h"

@implementation TestNSCodingTests

- (NSString*) filePathToArchive:(NSString*) fileName {
    NSArray *filePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *file = [NSString stringWithFormat:@"%@/%@", [filePath lastObject] , fileName ];
    return file;
}

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testMyObject1
{
    //STFail(@"Unit tests are not implemented yet in TestNSCodingTests");
    
    BaseCodingModel *bcObj1 = [[BaseCodingModel alloc] init];
    bcObj1.uuid = @"12345";
    
    [NSKeyedArchiver archiveRootObject:bcObj1 toFile:[self filePathToArchive:@"bcobj"]];
}

- (void)testMyObject2
{
    //STFail(@"Unit tests are not implemented yet in TestNSCodingTests");
    
    BaseCodingModel *bcObj2 = [NSKeyedUnarchiver unarchiveObjectWithFile:[self filePathToArchive:@"bcobj"]];
    NSLog(@"unarchived %@", bcObj2.uuid);
    
}

- (void) testMyObject3{
    
    MyObject2   *obj1 = [[MyObject2 alloc] init];
    obj1.name = @"forrest";
    obj1.man = YES;
    obj1.uuid = @"67890";

    BOOL result = [NSKeyedArchiver archiveRootObject:obj1 toFile:[self filePathToArchive:@"obj1"]];
        
    STAssertTrue(result,@"Failed to archive ");
}

- (void)testMyObject4
{
    //STFail(@"Unit tests are not implemented yet in TestNSCodingTests");
    
    MyObject2 *obj1 = [NSKeyedUnarchiver unarchiveObjectWithFile:[self filePathToArchive:@"obj1"]];
    NSLog(@"unarchived %@", obj1);
    
}

@end
