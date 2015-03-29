//
//  BaseClass.h
//
//  Created by Sandor Gazdag on 29/03/15
//
//

#import "BaseModel.h"

@interface RepositoryCollection : BaseModel

@property (nonatomic, strong) NSArray *values;
@property (nonatomic, strong) NSNumber *pagelen;
@property (nonatomic, strong) NSString *next;
@property (nonatomic, strong) NSNumber *page;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
