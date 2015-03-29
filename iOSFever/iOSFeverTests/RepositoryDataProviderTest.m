//
//  RepositoryDataProviderTest.m
//  iOSFever
//
//  Created by Sandor Gazdag on 29/03/15.
//  Copyright (c) 2015 iOS Fever. All rights reserved.
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
    
    [_provider repositoryPageWithCompletion:^(NSArray *repositories, NSError *error) {
        if (error) {
            XCTFail(@"%@",[error localizedDescription]);
        }
        XCTAssert([repositories count] > 0,@"The returned array is empty.");
    }];
    
    XCTAssert(YES, @"Pass");
}

@end
