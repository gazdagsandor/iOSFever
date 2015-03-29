//
//  Links.m
//
//  Created by Sandor Gazdag on 29/03/15
//
//

#import "Links.h"

#import "Clone.h"
#import "URLResource.h"

NSString *const kLinksForks = @"forks";
NSString *const kLinksAvatar = @"avatar";
NSString *const kLinksWatchers = @"watchers";
NSString *const kLinksCommits = @"commits";
NSString *const kLinksHtml = @"html";
NSString *const kLinksSelf = @"self";
NSString *const kLinksClone = @"clone";
NSString *const kLinksPullrequests = @"pullrequests";


@implementation Links

@synthesize forks = _forks;
@synthesize avatar = _avatar;
@synthesize watchers = _watchers;
@synthesize commits = _commits;
@synthesize html = _html;
@synthesize linksSelf = _linksSelf;
@synthesize clone = _clone;
@synthesize pullrequests = _pullrequests;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
	return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
	self = [super init];

	// This check serves to make sure that a non-NSDictionary object
	// passed into the model class doesn't break the parsing.
	if (self && [dict isKindOfClass:[NSDictionary class]]) {
		self.forks = [URLResource modelObjectWithDictionary:[dict objectForKey:kLinksForks]];
		self.avatar = [URLResource modelObjectWithDictionary:[dict objectForKey:kLinksAvatar]];
		self.watchers = [URLResource modelObjectWithDictionary:[dict objectForKey:kLinksWatchers]];
		self.commits = [URLResource modelObjectWithDictionary:[dict objectForKey:kLinksCommits]];
		self.html = [URLResource modelObjectWithDictionary:[dict objectForKey:kLinksHtml]];
		self.linksSelf = [URLResource modelObjectWithDictionary:[dict objectForKey:kLinksSelf]];
		NSObject *receivedClone = [dict objectForKey:kLinksClone];
		NSMutableArray *parsedClone = [NSMutableArray array];
		if ([receivedClone isKindOfClass:[NSArray class]]) {
			for (NSDictionary *item in (NSArray *)receivedClone) {
				if ([item isKindOfClass:[NSDictionary class]]) {
					[parsedClone addObject:[Clone modelObjectWithDictionary:item]];
				}
			}
		}
		else if ([receivedClone isKindOfClass:[NSDictionary class]]) {
			[parsedClone addObject:[Clone modelObjectWithDictionary:(NSDictionary *)receivedClone]];
		}

		self.clone = [NSArray arrayWithArray:parsedClone];
		self.pullrequests = [URLResource modelObjectWithDictionary:[dict objectForKey:kLinksPullrequests]];
	}

	return self;
}

- (NSDictionary *)dictionaryRepresentation {
	NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
	[mutableDict setValue:[self.forks dictionaryRepresentation] forKey:kLinksForks];
	[mutableDict setValue:[self.avatar dictionaryRepresentation] forKey:kLinksAvatar];
	[mutableDict setValue:[self.watchers dictionaryRepresentation] forKey:kLinksWatchers];
	[mutableDict setValue:[self.commits dictionaryRepresentation] forKey:kLinksCommits];
	[mutableDict setValue:[self.html dictionaryRepresentation] forKey:kLinksHtml];
	[mutableDict setValue:[self.linksSelf dictionaryRepresentation] forKey:kLinksSelf];
	NSMutableArray *tempArrayForClone = [NSMutableArray array];
	for (NSObject *subArrayObject in self.clone) {
		if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
			// This class is a model object
			[tempArrayForClone addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
		}
		else {
			// Generic object
			[tempArrayForClone addObject:subArrayObject];
		}
	}
	[mutableDict setValue:[NSArray arrayWithArray:tempArrayForClone] forKey:kLinksClone];
	[mutableDict setValue:[self.pullrequests dictionaryRepresentation] forKey:kLinksPullrequests];

	return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
	return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

@end
