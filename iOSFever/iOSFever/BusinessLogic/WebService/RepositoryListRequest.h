//
//  RepositoryListRequest.h
//  iOSFever
//
//  Created by Sandor Gazdag on 29/03/15.
//
//

@import Foundation;

@class RepositoryCollection;

/**
 *  The web service request handler instance for the bitbucket API repositories endpoint
 */
@interface RepositoryListRequest : NSObject

/**
 *  Issues a GET request for the repository list with the supplied page argument
 *
 *  @param URLString       the string of the repository endpoint
 *  @param completionBlock the block to be called upon completion
 */
- (void)repositoriesViaURL:(NSString *)urlString completion:(void (^)(RepositoryCollection *response, NSError *error))completionBlock;

/**
 *  Issues a GET request for the repository list
 *  Uses repositoriesViaURL:completion: method
 *
 *  @param completionBlock the block to be called upon completion
 */
- (void)repositoriesWithCompletion:(void (^)(RepositoryCollection *response, NSError *error))completionBlock;

@end
