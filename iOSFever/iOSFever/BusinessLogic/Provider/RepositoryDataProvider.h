//
//  RepositoryDataProvider.h
//  iOSFever
//
//  Created by Sandor Gazdag on 29/03/15.
//  
//

@import Foundation;

/**
 *  The completion block for the repository list requests
 *
 *  @param repositories the array of repositories on success
 *  @param error        the error instance on failure
 */
typedef void (^RepositoriesListCompletionBlock)(NSArray *repositories, NSError *error);

/**
 * Responsible for handling the repository related requests with the bitbucket API
*repositories endpoint
 *
 * For further clarification see the following link:
 * https://confluence.atlassian.com/display/BITBUCKET/repositories+Endpoint
 */
@interface RepositoryDataProvider : NSObject

/**
 *  Contains the list of repositories
 */
@property (nonatomic, strong) NSMutableArray *repositoryList;

/**
 *  Contains the current page index
 */
@property (nonatomic, assign) NSUInteger currentPage;

/**
 *  Initial query for requesting the first batch of repositories
 *
 *  @param completionBlock the block which called upon completion
 */
- (void)repositoryPageWithCompletion:(RepositoriesListCompletionBlock)completionBlock;

/**
 *  Requests additional batches of repositories
 *
 *  @param completionBlock completionBlock the block which called upon completion
 */
- (void)nextRepositoryPageWithCompletion:(RepositoriesListCompletionBlock)completionBlock;

@end
