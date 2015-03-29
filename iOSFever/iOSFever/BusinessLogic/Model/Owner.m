//
//  Owner.m
//
//  Created by Sandor Gazdag on 29/03/15
//
//

#import "Owner.h"
#import "Links.h"


NSString *const kOwnerUsername = @"username";
NSString *const kOwnerLinks = @"links";
NSString *const kOwnerDisplayName = @"display_name";
NSString *const kOwnerUuid = @"uuid";


@implementation Owner

@synthesize username = _username;
@synthesize links = _links;
@synthesize displayName = _displayName;
@synthesize uuid = _uuid;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
	return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
	self = [super init];

	// This check serves to make sure that a non-NSDictionary object
	// passed into the model class doesn't break the parsing.
	if (self && [dict isKindOfClass:[NSDictionary class]]) {
		self.username = [self objectOrNilForKey:kOwnerUsername fromDictionary:dict];
		self.links = [Links modelObjectWithDictionary:[dict objectForKey:kOwnerLinks]];
		self.displayName = [self objectOrNilForKey:kOwnerDisplayName fromDictionary:dict];
		self.uuid = [self objectOrNilForKey:kOwnerUuid fromDictionary:dict];
	}

	return self;
}

- (NSDictionary *)dictionaryRepresentation {
	NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
	[mutableDict setValue:self.username forKey:kOwnerUsername];
	[mutableDict setValue:[self.links dictionaryRepresentation] forKey:kOwnerLinks];
	[mutableDict setValue:self.displayName forKey:kOwnerDisplayName];
	[mutableDict setValue:self.uuid forKey:kOwnerUuid];

	return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
	return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

@end
