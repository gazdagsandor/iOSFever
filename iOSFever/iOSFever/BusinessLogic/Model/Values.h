//
//  Values.h
//
//  Created by Sandor Gazdag on 29/03/15
//  Copyright (c) 2015 iOS Fever. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Owner, Links;

@interface Values : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *uuid;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *valuesDescription;
@property (nonatomic, strong) Owner *owner;
@property (nonatomic, strong) NSNumber *size;
@property (nonatomic, strong) NSString *createdOn;
@property (nonatomic, assign) BOOL hasWiki;
@property (nonatomic, strong) NSString *forkPolicy;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) Links *links;
@property (nonatomic, assign) BOOL hasIssues;
@property (nonatomic, strong) NSString *scm;
@property (nonatomic, assign) BOOL isPrivate;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *updatedOn;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
