//
//  Clone.m
//
//  Created by Sandor Gazdag on 29/03/15
//  Copyright (c) 2015 iOS Fever. All rights reserved.
//

#import "Clone.h"


NSString *const kCloneName = @"name";
NSString *const kCloneHref = @"href";


@interface Clone ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Clone

@synthesize name = _name;
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
            self.name = [self objectOrNilForKey:kCloneName fromDictionary:dict];
            self.href = [self objectOrNilForKey:kCloneHref fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kCloneName];
    [mutableDict setValue:self.href forKey:kCloneHref];

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

    self.name = [aDecoder decodeObjectForKey:kCloneName];
    self.href = [aDecoder decodeObjectForKey:kCloneHref];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kCloneName];
    [aCoder encodeObject:_href forKey:kCloneHref];
}

- (id)copyWithZone:(NSZone *)zone
{
    Clone *copy = [[Clone alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.href = [self.href copyWithZone:zone];
    }
    
    return copy;
}


@end
