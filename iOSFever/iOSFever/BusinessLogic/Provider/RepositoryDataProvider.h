//
//  RepositoryDataProvider.h
//  iOSFever
//
//  Created by Sandor Gazdag on 29/03/15.
//  Copyright (c) 2015 iOS Fever. All rights reserved.
//

@import Foundation;

typedef void(^RepositoriesCompletionBlock)(NSArray *repositories, NSError *error);

@interface RepositoryDataProvider : NSObject

@property (nonatomic, strong) NSMutableArray *repositoryList;

@property (nonatomic, assign) NSUInteger currentPage;

- (void)repositoryPageWithCompletion:(RepositoriesCompletionBlock)completionBlock;

- (void)nextRepositoryPageWithCompletion:(RepositoriesCompletionBlock)completionBlock;

@end
