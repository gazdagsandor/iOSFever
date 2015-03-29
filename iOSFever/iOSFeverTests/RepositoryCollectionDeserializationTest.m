//
//  RepositoryCollectionDeserializationTest.m
//  iOSFever
//
//  Created by Sandor Gazdag on 29/03/15.
//
//

@import Foundation;
@import XCTest;

#import "Clone.h"
#import "Links.h"
#import "Owner.h"
#import "Repository.h"
#import "RepositoryCollection.h"
#import "URLResource.h"

@interface RepositoryCollectionDeserializationTest : XCTestCase

@end

@implementation RepositoryCollectionDeserializationTest

- (void)testDeserialization {
	// GIVEN
	NSDictionary *jsonDictionary = [self readMockData];

	// WHEN
	RepositoryCollection *const collection = [RepositoryCollection modelObjectWithDictionary:jsonDictionary];

	// THEN
	XCTAssert(collection, @"Deserialization error: No root object.");
	XCTAssert([collection.pagelen integerValue] == 10, @"Deserialization error: pagelen.");
	XCTAssert([collection.values count] == 1, @"Deserialization error: values.");
	XCTAssert([collection.page integerValue] == 2, @"Deserialization error: page.");
	XCTAssert([collection.next length] > 0, @"Deserialization error: next.");

	Repository *const repository = (Repository *)[collection.values firstObject];
	XCTAssert([repository.scm isEqualToString:@"hg"], @"Deserialization error: repository.scm.");
	XCTAssert(repository.hasWiki == YES, @"Deserialization error: repository.hasWiki.");
	XCTAssert([repository.forkPolicy isEqualToString:@"allow_forks"], @"Deserialization error: repository.forkPolicy.");
	XCTAssert([repository.name isEqualToString:@"test-repo"], @"Deserialization error: repository.name.");
	XCTAssert([repository.language isEqualToString:@"en"], @"Deserialization error: repository.language.");
	XCTAssert([repository.fullName isEqualToString:@"testuser/test-repo"], @"Deserialization error: repository.fullName.");
	XCTAssert(repository.hasIssues == YES, @"Deserialization error: repository.hasIssues.");
    XCTAssert([repository.size integerValue] == 20377, @"Deserialization error: repository.size.");
    XCTAssert(repository.isPrivate == NO, @"Deserialization error: repository.isPrivate.");
    XCTAssert([repository.uuid isEqualToString:@"{2a8b27dc-4671-42e4-bf09-81970ca80b3f}"], @"Deserialization error: repository.uuid.");

    XCTAssert([repository.links.watchers isKindOfClass:[URLResource class]],@"Deserialization error: repository.links.watchers.");
    XCTAssert([repository.links.commits isKindOfClass:[URLResource class]],@"Deserialization error: repository.links.commits.");
    XCTAssert([repository.links.linksSelf isKindOfClass:[URLResource class]],@"Deserialization error: repository.links.linksSelf.");
    XCTAssert([repository.links.html isKindOfClass:[URLResource class]],@"Deserialization error: repository.links.html.");
    XCTAssert([repository.links.avatar isKindOfClass:[URLResource class]],@"Deserialization error: repository.links.avatar.");
    XCTAssert([repository.links.forks isKindOfClass:[URLResource class]],@"Deserialization error: repository.links.forks.");
    XCTAssert([repository.links.pullrequests isKindOfClass:[URLResource class]],@"Deserialization error: repository.links.pullrequests.");
    XCTAssert([repository.links.clone count] > 0,@"Deserialization error: repository.links.clone.");

    // URLResource content
    XCTAssert([repository.links.watchers.href isEqualToString:@"https://watchers"],@"Deserialization error: repository.links.watchers.");

    Owner *const owner = repository.owner;
    XCTAssert([owner.username isEqualToString:@"testuser"], @"Deserialization error: owner.username.");
    XCTAssert([owner.displayName isEqualToString:@"Test User"], @"Deserialization error: owner.displayName.");
    XCTAssert([owner.uuid isEqualToString:@"{123123123}"], @"Deserialization error: repository.hasIssues.");

    XCTAssert([owner.links isKindOfClass:[Links class]], @"Deserialization error: owner.links.");
    XCTAssert([owner.links.linksSelf isKindOfClass:[URLResource class]],@"Deserialization error: owner.links.linksSelf.");
    XCTAssert([owner.links.html isKindOfClass:[URLResource class]],@"Deserialization error: owner.links.html.");
    XCTAssert([owner.links.avatar isKindOfClass:[URLResource class]],@"Deserialization error: owner.links.avatar.");
}

#pragma mark - Private helper

- (NSDictionary *)readMockData {
	NSString *mockJSONPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"ResourceCollectionMock" ofType:@"json"];

	NSData *mockData = [NSData dataWithContentsOfFile:mockJSONPath];

	NSError *error;

	NSDictionary *const jsonDictionary = [NSJSONSerialization JSONObjectWithData:mockData options:NSJSONReadingAllowFragments error:&error];

	if (error) {
		XCTFail(@"Could not read json mock data.");
	}
	return jsonDictionary;
}

@end
