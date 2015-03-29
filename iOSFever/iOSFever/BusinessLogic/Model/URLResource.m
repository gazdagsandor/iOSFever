//
//  URLResource.m
//  iOSFever
//
//  Created by Sandor Gazdag on 29/03/15.
//
//

#import "URLResource.h"

NSString *const kResourceHref = @"href";


@implementation URLResource

@synthesize href = _href;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
	return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
	self = [super init];

	if (self && [dict isKindOfClass:[NSDictionary class]]) {
		self.href = [self objectOrNilForKey:kResourceHref fromDictionary:dict];
	}

	return self;
}

- (NSDictionary *)dictionaryRepresentation {
	NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
	[mutableDict setValue:self.href forKey:kResourceHref];

	return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
	return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

@end
