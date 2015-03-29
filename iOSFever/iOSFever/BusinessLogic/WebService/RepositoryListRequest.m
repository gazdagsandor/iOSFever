//
//  RepositoryListRequest.m
//  iOSFever
//
//  Created by Sandor Gazdag on 29/03/15.
//
//

#import "RepositoryListRequest.h"

#import <AFNetworking/AFNetworking.h>

#import "RepositoryCollection.h"

NSString *const kIFBitBucketBaseURL = @"https://api.bitbucket.org/2.0";

@implementation RepositoryListRequest

- (void)repositoriesWithCompletion:(void (^)(RepositoryCollection *response, NSError *error))completionBlock {
	NSString *urlString = [NSString stringWithFormat:@"%@/repositories", kIFBitBucketBaseURL];

	[self repositoriesViaURL:urlString completion: ^(RepositoryCollection *response, NSError *error) {
	    completionBlock(response, error);
	}];
}

- (void)repositoriesViaURL:(NSString *)urlString completion:(void (^)(RepositoryCollection *, NSError *))completionBlock {
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

	[manager GET:urlString parameters:nil success: ^(AFHTTPRequestOperation *operation, id responseObject) {
	    RepositoryCollection *repositoryCollection = [RepositoryCollection modelObjectWithDictionary:responseObject];
	    completionBlock(repositoryCollection, nil);
	} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
	    completionBlock(nil, error);
	}];
}

@end
