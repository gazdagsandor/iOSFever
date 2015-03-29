//
//  RepositoryListRequest.m
//  iOSFever
//
//  Created by Sandor Gazdag on 29/03/15.
//  Copyright (c) 2015 iOS Fever. All rights reserved.
//

#import "RepositoryListRequest.h"

#import <AFNetworking.h>

#import "RepositoryCollection.h"

NSString *const kIFBitBucketBaseURL = @"https://api.bitbucket.org/2.0/";

@implementation RepositoryListRequest

- (void)repositoriesOnPage:(NSNumber *)page completion:(void (^)(RepositoryCollection *response, NSError *error))completionBlock {
	NSString *urlString = [NSString stringWithFormat:@"%@/repositories", kIFBitBucketBaseURL];

	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

	[manager GET:urlString parameters:nil success: ^(AFHTTPRequestOperation *operation, id responseObject) {
	    RepositoryCollection *repositoryCollection = [RepositoryCollection modelObjectWithDictionary:responseObject];
	    completionBlock(repositoryCollection, nil);
	} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
	    completionBlock(nil, error);
	}];
}

@end
