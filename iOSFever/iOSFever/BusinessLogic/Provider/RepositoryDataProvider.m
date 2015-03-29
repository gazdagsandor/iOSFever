//
//  RepositoryDataProvider.m
//  iOSFever
//
//  Created by Sandor Gazdag on 29/03/15.
//  Copyright (c) 2015 iOS Fever. All rights reserved.
//

#import "RepositoryDataProvider.h"

#import "RepositoryListRequest.h"
#import "RepositoryCollection.h"

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

- (void)repositoryPageWithCompletion:(RepositoriesCompletionBlock)completionBlock {
    RepositoryListRequest *request = [[RepositoryListRequest alloc] init];
    [request repositoriesOnPage:[NSNumber numberWithUnsignedInteger:_currentPage] completion:^(RepositoryCollection *response, NSError *error) {
        completionBlock(response.values, error);
    }];
}

- (void)nextRepositoryPageWithCompletion:(RepositoriesCompletionBlock)completionBlock {

    _currentPage++;
    
    [self repositoryPageWithCompletion:^(NSArray *repositories, NSError *error) {
        completionBlock(repositories, error);
    }];

}

@end
