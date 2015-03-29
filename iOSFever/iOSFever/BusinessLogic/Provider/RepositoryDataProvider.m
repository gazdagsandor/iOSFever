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
		_currentPage = 1;
		_repositoryList = [[NSMutableArray alloc] init];
	}
	return self;
}

#pragma mark - Public

- (void)repositoryPageWithCompletion:(RepositoriesListCompletionBlock)completionBlock {
	RepositoryListRequest *request = [[RepositoryListRequest alloc] init];
	[request repositoriesOnPage:[NSNumber numberWithUnsignedInteger:_currentPage] completion: ^(RepositoryCollection *response, NSError *error) {
	    if (_currentPage == 1) {
	        _repositoryList = [NSMutableArray arrayWithArray:response.values];
		}
	    completionBlock(response.values, error);
	}];
}

- (void)nextRepositoryPageWithCompletion:(RepositoriesListCompletionBlock)completionBlock {
	_currentPage++;

	[self repositoryPageWithCompletion: ^(NSArray *repositories, NSError *error) {
	    for (Repository *repositoryItem in repositories) {
	        [_repositoryList addObject:repositoryItem];
		}
	    completionBlock(repositories, error);
	}];
}

@end
