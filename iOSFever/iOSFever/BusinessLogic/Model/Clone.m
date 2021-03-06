//
//  Clone.m
//
//  Created by Sandor Gazdag on 29/03/15
//
//

#import "Clone.h"


NSString *const kCloneName = @"name";
NSString *const kCloneHref = @"href";


@implementation Clone

@synthesize name = _name;
@synthesize href = _href;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
	return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
	self = [super init];

	// This check serves to make sure that a non-NSDictionary object
	// passed into the model class doesn't break the parsing.
	if (self && [dict isKindOfClass:[NSDictionary class]]) {
		self.name = [self objectOrNilForKey:kCloneName fromDictionary:dict];
		self.href = [self objectOrNilForKey:kCloneHref fromDictionary:dict];
	}

	return self;
}

- (NSDictionary *)dictionaryRepresentation {
	NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
	[mutableDict setValue:self.name forKey:kCloneName];
	[mutableDict setValue:self.href forKey:kCloneHref];

	return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
	return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

@end
