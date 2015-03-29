//
//  Owner.h
//
//  Created by Sandor Gazdag on 29/03/15
//  Copyright (c) 2015 iOS Fever. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Links;

@interface Owner : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) Links *links;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) NSString *uuid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
