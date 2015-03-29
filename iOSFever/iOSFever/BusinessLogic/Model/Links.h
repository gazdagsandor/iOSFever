//
//  Links.h
//
//  Created by Sandor Gazdag on 29/03/15
//  Copyright (c) 2015 iOS Fever. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Forks, Avatar, Watchers, Commits, Html, SelfClass, Pullrequests;

@interface Links : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) Forks *forks;
@property (nonatomic, strong) Avatar *avatar;
@property (nonatomic, strong) Watchers *watchers;
@property (nonatomic, strong) Commits *commits;
@property (nonatomic, strong) Html *html;
@property (nonatomic, strong) SelfClass *linksSelf;
@property (nonatomic, strong) NSArray *clone;
@property (nonatomic, strong) Pullrequests *pullrequests;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
