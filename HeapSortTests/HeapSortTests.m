#import <XCTest/XCTest.h>
#import "PriorityQueue.h"

@interface HeapSortTests : XCTestCase

@end

@implementation HeapSortTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void) testExample
{
    PriorityQueue* priorityQueue = [[PriorityQueue alloc] initWithSize:10];

    XCTAssertTrue(priorityQueue.length == 0, @"Not Initialized");

    [priorityQueue insert:@10000];
    [priorityQueue insert:@100];
    [priorityQueue insert:@1000];
    [priorityQueue insert:@10];
    [priorityQueue insert:@1];

    XCTAssertTrue(priorityQueue.length == 5, @"Not Inserting");


    XCTAssert([[[priorityQueue array] objectAtIndex:0] integerValue] == 1, @"NOOOOOOO");
    XCTAssert([[[priorityQueue array] objectAtIndex:1] integerValue] == 10, @"NOOOOOOO");
    XCTAssert([[[priorityQueue array] objectAtIndex:2] integerValue] == 1000, @"NOOOOOOO");
    XCTAssert([[[priorityQueue array] objectAtIndex:3] integerValue] == 10000, @"NOOOOOOO");
    XCTAssert([[[priorityQueue array] objectAtIndex:4] integerValue] == 100, @"NOOOOOOO");

    XCTAssert([[priorityQueue popMin] integerValue] == 1, @"NOOOOOOO");
    XCTAssert([[priorityQueue popMin] integerValue] == 10, @"NOOOOOOO");
    XCTAssert([[priorityQueue popMin] integerValue] == 100, @"NOOOOOOO");
    XCTAssert([[priorityQueue popMin] integerValue] == 1000, @"NOOOOOOO");
}

- (void) testExample2
{
    PriorityQueue* priorityQueue = [[PriorityQueue alloc] initWithSize:10];

    XCTAssertTrue(priorityQueue.length == 0, @"Not Initialized");

    [priorityQueue insert:@"10000"];
    [priorityQueue insert:@"100"];
    [priorityQueue insert:@"1000"];
    [priorityQueue insert:@"10"];
    [priorityQueue insert:@"1"];

    XCTAssertTrue(priorityQueue.length == 5, @"Not Inserting");

    XCTAssert([[[priorityQueue array] objectAtIndex:0] isEqualToString: @"1"], @"NOOOOOOO");
    XCTAssert([[[priorityQueue array] objectAtIndex:1] isEqualToString: @"10"], @"NOOOOOOO");
    XCTAssert([[[priorityQueue array] objectAtIndex:2] isEqualToString: @"1000"], @"NOOOOOOO");
    XCTAssert([[[priorityQueue array] objectAtIndex:3] isEqualToString: @"10000"], @"NOOOOOOO");
    XCTAssert([[[priorityQueue array] objectAtIndex:4] isEqualToString: @"100"], @"NOOOOOOO");

    XCTAssert([[priorityQueue popMin] isEqual:@"1"], @"NOOOOOOO");
    XCTAssert([[priorityQueue popMin] isEqual:@"10"], @"NOOOOOOO");
    XCTAssert([[priorityQueue popMin] isEqual:@"100"], @"NOOOOOOO");
    XCTAssert([[priorityQueue popMin] isEqual:@"1000"], @"NOOOOOOO");
}

@end
