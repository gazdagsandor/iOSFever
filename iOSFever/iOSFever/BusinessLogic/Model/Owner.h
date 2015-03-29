//
//  Owner.h
//
//  Created by Sandor Gazdag on 29/03/15
//
//

#import "BaseModel.h"

@class Links;

@interface Owner : BaseModel

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) Links *links;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) NSString *uuid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
