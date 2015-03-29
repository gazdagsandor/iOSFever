//
//  Clone.h
//
//  Created by Sandor Gazdag on 29/03/15
//
//

#import "BaseModel.h"

@interface Clone : BaseModel

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *href;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
