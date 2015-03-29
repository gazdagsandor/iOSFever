//
//  BaseModel.h
//  iOSFever
//
//  Created by Sandor Gazdag on 29/03/15.
//  Copyright (c) 2015 iOS Fever. All rights reserved.
//

@import Foundation;

/**
 *  Base model class with helper methods for serialization.
 */
@interface BaseModel : NSObject

/**
 *  Returns an object or nil if the given key does not exists in the dictioary
 */
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end
