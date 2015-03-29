//
//  Owner.m
//
//  Created by Sandor Gazdag on 29/03/15
//  Copyright (c) 2015 iOS Fever. All rights reserved.
//

#import "Owner.h"
#import "Links.h"


NSString *const kOwnerUsername = @"username";
NSString *const kOwnerLinks = @"links";
NSString *const kOwnerDisplayName = @"display_name";
NSString *const kOwnerUuid = @"uuid";


@interface Owner ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Owner

@synthesize username = _username;
@synthesize links = _links;
@synthesize displayName = _displayName;
@synthesize uuid = _uuid;


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
            self.username = [self objectOrNilForKey:kOwnerUsername fromDictionary:dict];
            self.links = [Links modelObjectWithDictionary:[dict objectForKey:kOwnerLinks]];
            self.displayName = [self objectOrNilForKey:kOwnerDisplayName fromDictionary:dict];
            self.uuid = [self objectOrNilForKey:kOwnerUuid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.username forKey:kOwnerUsername];
    [mutableDict setValue:[self.links dictionaryRepresentation] forKey:kOwnerLinks];
    [mutableDict setValue:self.displayName forKey:kOwnerDisplayName];
    [mutableDict setValue:self.uuid forKey:kOwnerUuid];

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

    self.username = [aDecoder decodeObjectForKey:kOwnerUsername];
    self.links = [aDecoder decodeObjectForKey:kOwnerLinks];
    self.displayName = [aDecoder decodeObjectForKey:kOwnerDisplayName];
    self.uuid = [aDecoder decodeObjectForKey:kOwnerUuid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_username forKey:kOwnerUsername];
    [aCoder encodeObject:_links forKey:kOwnerLinks];
    [aCoder encodeObject:_displayName forKey:kOwnerDisplayName];
    [aCoder encodeObject:_uuid forKey:kOwnerUuid];
}

- (id)copyWithZone:(NSZone *)zone
{
    Owner *copy = [[Owner alloc] init];
    
    if (copy) {

        copy.username = [self.username copyWithZone:zone];
        copy.links = [self.links copyWithZone:zone];
        copy.displayName = [self.displayName copyWithZone:zone];
        copy.uuid = [self.uuid copyWithZone:zone];
    }
    
    return copy;
}


@end
