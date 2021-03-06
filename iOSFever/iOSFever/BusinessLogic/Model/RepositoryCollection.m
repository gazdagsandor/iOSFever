//
//  BaseClass.m
//
//  Created by Sandor Gazdag on 29/03/15
//
//

#import "RepositoryCollection.h"
#import "Repository.h"


NSString *const kBaseClassValues = @"values";
NSString *const kBaseClassPagelen = @"pagelen";
NSString *const kBaseClassNext = @"next";
NSString *const kBaseClassPage = @"page";


@implementation RepositoryCollection

@synthesize values = _values;
@synthesize pagelen = _pagelen;
@synthesize next = _next;
@synthesize page = _page;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
	return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
	self = [super init];

	// This check serves to make sure that a non-NSDictionary object
	// passed into the model class doesn't break the parsing.
	if (self && [dict isKindOfClass:[NSDictionary class]]) {
		NSObject *receivedValues = [dict objectForKey:kBaseClassValues];
		NSMutableArray *parsedValues = [NSMutableArray array];
		if ([receivedValues isKindOfClass:[NSArray class]]) {
			for (NSDictionary *item in (NSArray *)receivedValues) {
				if ([item isKindOfClass:[NSDictionary class]]) {
					[parsedValues addObject:[Repository modelObjectWithDictionary:item]];
				}
			}
		}
		else if ([receivedValues isKindOfClass:[NSDictionary class]]) {
			[parsedValues addObject:[Repository modelObjectWithDictionary:(NSDictionary *)receivedValues]];
		}

		self.values = [NSArray arrayWithArray:parsedValues];
		self.pagelen = [self objectOrNilForKey:kBaseClassPagelen fromDictionary:dict];
		self.next = [self objectOrNilForKey:kBaseClassNext fromDictionary:dict];
		self.page = [self objectOrNilForKey:kBaseClassPage fromDictionary:dict];
	}

	return self;
}

- (NSDictionary *)dictionaryRepresentation {
	NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
	NSMutableArray *tempArrayForValues = [NSMutableArray array];
	for (NSObject *subArrayObject in self.values) {
		if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
			// This class is a model object
			[tempArrayForValues addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
		}
		else {
			// Generic object
			[tempArrayForValues addObject:subArrayObject];
		}
	}
	[mutableDict setValue:[NSArray arrayWithArray:tempArrayForValues] forKey:kBaseClassValues];
	[mutableDict setValue:self.pagelen forKey:kBaseClassPagelen];
	[mutableDict setValue:self.next forKey:kBaseClassNext];
	[mutableDict setValue:self.page forKey:kBaseClassPage];

	return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
	return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

@end
