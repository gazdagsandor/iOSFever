//
//  RepositoryDataProvider.m
//  iOSFever
//
//  Created by Sandor Gazdag on 29/03/15.
//
//

#import "RepositoryDataProvider.h"

#import "RepositoryListRequest.h"
#import "RepositoryCollection.h"
#import "Repository.h"

@implementation RepositoryDataProvider

#pragma mark - Lifecycle

- (instancetype)init {
	self = [super init];
	if (self) {
		_repositoryList = [[NSMutableArray alloc] init];
	}
	return self;
}

#pragma mark - Public

- (void)repositoryPageWithCompletion:(RepositoriesListCompletionBlock)completionBlock {

    RepositoryListRequest *request = [[RepositoryListRequest alloc] init];
	[request repositoriesWithCompletion: ^(RepositoryCollection *response, NSError *error) {
	    
        // If no next page url is supplied added then setting a clean list for Repository instances
	    if (!self.nextPageURL || (NSNull *)self.nextPageURL == [NSNull null]) {
	        _repositoryList = [NSMutableArray arrayWithArray:response.values];
		}
        
	    if (error) {
	        completionBlock(nil, error);
	        return;
		}
	    
        self.nextPageURL = response.next;
	    completionBlock(response.values, nil);
	}];
}

- (void)nextRepositoryPageWithCompletion:(RepositoriesListCompletionBlock)completionBlock {

    RepositoryListRequest *request = [[RepositoryListRequest alloc] init];
	[request repositoriesViaURL:self.nextPageURL completion: ^(RepositoryCollection *response, NSError *error) {

        if (error) {
	        completionBlock(nil, error);
	        return;
		}

	    // Adding additional Repositories
	    for (Repository *repositoryItem in response.values) {
	        [_repositoryList addObject:repositoryItem];
		}

	    completionBlock(response.values, nil);
	}];
}

@end
