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
    NSUInteger pageBeforeRequest = _provider.currentPage;
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
    
    XCTAssert((pageBeforeRequest < _provider.currentPage),@"The provider page has not been changed.");
}

@end
