//
//  Links.h
//
//  Created by Sandor Gazdag on 29/03/15
//
//

#import "BaseModel.h"

@class URLResource;

@interface Links : BaseModel

@property (nonatomic, strong) URLResource *forks;
@property (nonatomic, strong) URLResource *avatar;
@property (nonatomic, strong) URLResource *watchers;
@property (nonatomic, strong) URLResource *commits;
@property (nonatomic, strong) URLResource *html;
@property (nonatomic, strong) URLResource *linksSelf;
@property (nonatomic, strong) NSArray *clone;
@property (nonatomic, strong) URLResource *pullrequests;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
