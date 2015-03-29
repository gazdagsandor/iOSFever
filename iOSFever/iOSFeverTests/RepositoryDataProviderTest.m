//
//  RepositoryDataProviderTest.m
//  iOSFever
//
//  Created by Sandor Gazdag on 29/03/15.
//  
//

@import Foundation;
@import XCTest;

#import "RepositoryDataProvider.h"

@interface RepositoryDataProviderTest : XCTestCase

@end

@implementation RepositoryDataProviderTest {
	RepositoryDataProvider *_provider;
}

- (void)setUp {
	[super setUp];
	_provider = [[RepositoryDataProvider alloc] init];
}

- (void)tearDown {
	_provider = nil;

	[super tearDown];
}

- (void)testRepositoryPageRequest {
	__block BOOL requestFinished = NO;

	[_provider repositoryPageWithCompletion: ^(NSArray *repositories, NSError *error) {
	    requestFinished = YES;
	    if (error) {
	        XCTFail(@"%@", [error localizedDescription]);
		}
	    XCTAssert([repositories count] > 0, @"The returned array is empty.");
	}];

	while (!requestFinished) {
		[[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
	}
}

- (void)testNextRepositoryPageRequest {
    __block BOOL requestFinished = NO;

    XCTAssertNil(_provider.nextPageURL, @"The prerequisite next page Url is not nil.");

    [_provider repositoryPageWithCompletion:^(NSArray *repositories, NSError *error) {
        if (error) {
            XCTFail(@"The initial request did not succeeded.");
            return;
        }
        requestFinished = YES;
    }];
    
    while (!requestFinished) {
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
    }
    
    // Re-initializing request completion marker.
    requestFinished = NO;
    
    [_provider nextRepositoryPageWithCompletion:^(NSArray *repositories, NSError *error) {

        requestFinished = YES;
        if (error) {
            XCTFail(@"%@", [error localizedDescription]);
        }
        XCTAssert([repositories count] > 0, @"The returned array is empty.");
    }];
    
    while (!requestFinished) {
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
    }
    
    XCTAssert([_provider.nextPageURL length] > 0,@"The provider next page has not been set to the proper value.");
}

@end
