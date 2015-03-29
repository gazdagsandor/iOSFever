//
//  Links.m
//
//  Created by Sandor Gazdag on 29/03/15
//  Copyright (c) 2015 iOS Fever. All rights reserved.
//

#import "Links.h"
#import "Forks.h"
#import "Avatar.h"
#import "Watchers.h"
#import "Commits.h"
#import "Html.h"
#import "SelfClass.h"
#import "Clone.h"
#import "Pullrequests.h"


NSString *const kLinksForks = @"forks";
NSString *const kLinksAvatar = @"avatar";
NSString *const kLinksWatchers = @"watchers";
NSString *const kLinksCommits = @"commits";
NSString *const kLinksHtml = @"html";
NSString *const kLinksSelf = @"self";
NSString *const kLinksClone = @"clone";
NSString *const kLinksPullrequests = @"pullrequests";


@interface Links ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Links

@synthesize forks = _forks;
@synthesize avatar = _avatar;
@synthesize watchers = _watchers;
@synthesize commits = _commits;
@synthesize html = _html;
@synthesize linksSelf = _linksSelf;
@synthesize clone = _clone;
@synthesize pullrequests = _pullrequests;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.forks = [Forks modelObjectWithDictionary:[dict objectForKey:kLinksForks]];
            self.avatar = [Avatar modelObjectWithDictionary:[dict objectForKey:kLinksAvatar]];
            self.watchers = [Watchers modelObjectWithDictionary:[dict objectForKey:kLinksWatchers]];
            self.commits = [Commits modelObjectWithDictionary:[dict objectForKey:kLinksCommits]];
            self.html = [Html modelObjectWithDictionary:[dict objectForKey:kLinksHtml]];
            self.linksSelf = [SelfClass modelObjectWithDictionary:[dict objectForKey:kLinksSelf]];
    NSObject *receivedClone = [dict objectForKey:kLinksClone];
    NSMutableArray *parsedClone = [NSMutableArray array];
    if ([receivedClone isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedClone) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedClone addObject:[Clone modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedClone isKindOfClass:[NSDictionary class]]) {
       [parsedClone addObject:[Clone modelObjectWithDictionary:(NSDictionary *)receivedClone]];
    }

    self.clone = [NSArray arrayWithArray:parsedClone];
            self.pullrequests = [Pullrequests modelObjectWithDictionary:[dict objectForKey:kLinksPullrequests]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.forks dictionaryRepresentation] forKey:kLinksForks];
    [mutableDict setValue:[self.avatar dictionaryRepresentation] forKey:kLinksAvatar];
    [mutableDict setValue:[self.watchers dictionaryRepresentation] forKey:kLinksWatchers];
    [mutableDict setValue:[self.commits dictionaryRepresentation] forKey:kLinksCommits];
    [mutableDict setValue:[self.html dictionaryRepresentation] forKey:kLinksHtml];
    [mutableDict setValue:[self.linksSelf dictionaryRepresentation] forKey:kLinksSelf];
    NSMutableArray *tempArrayForClone = [NSMutableArray array];
    for (NSObject *subArrayObject in self.clone) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForClone addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForClone addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForClone] forKey:kLinksClone];
    [mutableDict setValue:[self.pullrequests dictionaryRepresentation] forKey:kLinksPullrequests];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.forks = [aDecoder decodeObjectForKey:kLinksForks];
    self.avatar = [aDecoder decodeObjectForKey:kLinksAvatar];
    self.watchers = [aDecoder decodeObjectForKey:kLinksWatchers];
    self.commits = [aDecoder decodeObjectForKey:kLinksCommits];
    self.html = [aDecoder decodeObjectForKey:kLinksHtml];
    self.linksSelf = [aDecoder decodeObjectForKey:kLinksSelf];
    self.clone = [aDecoder decodeObjectForKey:kLinksClone];
    self.pullrequests = [aDecoder decodeObjectForKey:kLinksPullrequests];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_forks forKey:kLinksForks];
    [aCoder encodeObject:_avatar forKey:kLinksAvatar];
    [aCoder encodeObject:_watchers forKey:kLinksWatchers];
    [aCoder encodeObject:_commits forKey:kLinksCommits];
    [aCoder encodeObject:_html forKey:kLinksHtml];
    [aCoder encodeObject:_linksSelf forKey:kLinksSelf];
    [aCoder encodeObject:_clone forKey:kLinksClone];
    [aCoder encodeObject:_pullrequests forKey:kLinksPullrequests];
}

- (id)copyWithZone:(NSZone *)zone
{
    Links *copy = [[Links alloc] init];
    
    if (copy) {

        copy.forks = [self.forks copyWithZone:zone];
        copy.avatar = [self.avatar copyWithZone:zone];
        copy.watchers = [self.watchers copyWithZone:zone];
        copy.commits = [self.commits copyWithZone:zone];
        copy.html = [self.html copyWithZone:zone];
        copy.linksSelf = [self.linksSelf copyWithZone:zone];
        copy.clone = [self.clone copyWithZone:zone];
        copy.pullrequests = [self.pullrequests copyWithZone:zone];
    }
    
    return copy;
}


@end
