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
 *  @param page            the page of repositories to be retrieved
 *  @param completionBlock the block to be called upon completion
 */
- (void)repositoriesOnPage:(NSNumber *)page completion:(void (^)(RepositoryCollection *response, NSError *error))completionBlock;

@end
