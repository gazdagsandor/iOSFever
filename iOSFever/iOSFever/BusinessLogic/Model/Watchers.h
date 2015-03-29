//
//  Watchers.h
//
//  Created by Sandor Gazdag on 29/03/15
//  Copyright (c) 2015 iOS Fever. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Watchers : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *href;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
