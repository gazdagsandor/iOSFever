//
//  Repository.m
//
//  Created by Sandor Gazdag on 29/03/15
//
//

#import "Repository.h"
#import "Owner.h"
#import "Links.h"


NSString *const kValuesUuid = @"uuid";
NSString *const kValuesFullName = @"full_name";
NSString *const kValuesDescription = @"description";
NSString *const kValuesOwner = @"owner";
NSString *const kValuesSize = @"size";
NSString *const kValuesCreatedOn = @"created_on";
NSString *const kValuesHasWiki = @"has_wiki";
NSString *const kValuesForkPolicy = @"fork_policy";
NSString *const kValuesLanguage = @"language";
NSString *const kValuesLinks = @"links";
NSString *const kValuesHasIssues = @"has_issues";
NSString *const kValuesScm = @"scm";
NSString *const kValuesIsPrivate = @"is_private";
NSString *const kValuesName = @"name";
NSString *const kValuesUpdatedOn = @"updated_on";


@implementation Repository

@synthesize uuid = _uuid;
@synthesize fullName = _fullName;
@synthesize valuesDescription = _valuesDescription;
@synthesize owner = _owner;
@synthesize size = _size;
@synthesize createdOn = _createdOn;
@synthesize hasWiki = _hasWiki;
@synthesize forkPolicy = _forkPolicy;
@synthesize language = _language;
@synthesize links = _links;
@synthesize hasIssues = _hasIssues;
@synthesize scm = _scm;
@synthesize isPrivate = _isPrivate;
@synthesize name = _name;
@synthesize updatedOn = _updatedOn;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
	return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
	self = [super init];

	// This check serves to make sure that a non-NSDictionary object
	// passed into the model class doesn't break the parsing.
	if (self && [dict isKindOfClass:[NSDictionary class]]) {
		self.uuid = [self objectOrNilForKey:kValuesUuid fromDictionary:dict];
		self.fullName = [self objectOrNilForKey:kValuesFullName fromDictionary:dict];
		self.valuesDescription = [self objectOrNilForKey:kValuesDescription fromDictionary:dict];
		self.owner = [Owner modelObjectWithDictionary:[dict objectForKey:kValuesOwner]];
		self.size = [self objectOrNilForKey:kValuesSize fromDictionary:dict];
		self.createdOn = [self objectOrNilForKey:kValuesCreatedOn fromDictionary:dict];
		self.hasWiki = [[self objectOrNilForKey:kValuesHasWiki fromDictionary:dict] boolValue];
		self.forkPolicy = [self objectOrNilForKey:kValuesForkPolicy fromDictionary:dict];
		self.language = [self objectOrNilForKey:kValuesLanguage fromDictionary:dict];
		self.links = [Links modelObjectWithDictionary:[dict objectForKey:kValuesLinks]];
		self.hasIssues = [[self objectOrNilForKey:kValuesHasIssues fromDictionary:dict] boolValue];
		self.scm = [self objectOrNilForKey:kValuesScm fromDictionary:dict];
		self.isPrivate = [[self objectOrNilForKey:kValuesIsPrivate fromDictionary:dict] boolValue];
		self.name = [self objectOrNilForKey:kValuesName fromDictionary:dict];
		self.updatedOn = [self objectOrNilForKey:kValuesUpdatedOn fromDictionary:dict];
	}

	return self;
}

- (NSDictionary *)dictionaryRepresentation {
	NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
	[mutableDict setValue:self.uuid forKey:kValuesUuid];
	[mutableDict setValue:self.fullName forKey:kValuesFullName];
	[mutableDict setValue:self.valuesDescription forKey:kValuesDescription];
	[mutableDict setValue:[self.owner dictionaryRepresentation] forKey:kValuesOwner];
	[mutableDict setValue:self.size forKey:kValuesSize];
	[mutableDict setValue:self.createdOn forKey:kValuesCreatedOn];
	[mutableDict setValue:[NSNumber numberWithBool:self.hasWiki] forKey:kValuesHasWiki];
	[mutableDict setValue:self.forkPolicy forKey:kValuesForkPolicy];
	[mutableDict setValue:self.language forKey:kValuesLanguage];
	[mutableDict setValue:[self.links dictionaryRepresentation] forKey:kValuesLinks];
	[mutableDict setValue:[NSNumber numberWithBool:self.hasIssues] forKey:kValuesHasIssues];
	[mutableDict setValue:self.scm forKey:kValuesScm];
	[mutableDict setValue:[NSNumber numberWithBool:self.isPrivate] forKey:kValuesIsPrivate];
	[mutableDict setValue:self.name forKey:kValuesName];
	[mutableDict setValue:self.updatedOn forKey:kValuesUpdatedOn];

	return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
	return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

@end
