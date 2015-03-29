//
//  Watchers.m
//
//  Created by Sandor Gazdag on 29/03/15
//  Copyright (c) 2015 iOS Fever. All rights reserved.
//

#import "Watchers.h"


NSString *const kWatchersHref = @"href";


@interface Watchers ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Watchers

@synthesize href = _href;


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
            self.href = [self objectOrNilForKey:kWatchersHref fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.href forKey:kWatchersHref];

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

    self.href = [aDecoder decodeObjectForKey:kWatchersHref];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_href forKey:kWatchersHref];
}

- (id)copyWithZone:(NSZone *)zone
{
    Watchers *copy = [[Watchers alloc] init];
    
    if (copy) {

        copy.href = [self.href copyWithZone:zone];
    }
    
    return copy;
}


@end
