//
//  URLResource.h
//  iOSFever
//
//  Created by Sandor Gazdag on 29/03/15.
//
//

#import "BaseModel.h"

@interface URLResource : BaseModel

@property (nonatomic, strong) NSString *href;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
