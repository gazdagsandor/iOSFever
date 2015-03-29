//
//  BaseClass.h
//
//  Created by Sandor Gazdag on 29/03/15
//  Copyright (c) 2015 iOS Fever. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RepositoryCollection : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *values;
@property (nonatomic, strong) NSNumber *pagelen;
@property (nonatomic, strong) NSString *next;
@property (nonatomic, strong) NSNumber *page;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
