//
//  RepositoryListRequest.h
//  iOSFever
//
//  Created by Sandor Gazdag on 29/03/15.
//  Copyright (c) 2015 iOS Fever. All rights reserved.
//

@import Foundation;

@class RepositoryCollection;

@interface RepositoryListRequest : NSObject

- (void)repositoriesOnPage:(NSNumber *)page completion:(void (^)(RepositoryCollection *response, NSError *error))completionBlock;

@end
