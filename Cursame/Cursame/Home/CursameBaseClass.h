//
//  CursameBaseClass.h
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CursameResponse;

@interface CursameBaseClass : NSObject <NSCoding>

@property (nonatomic, strong) CursameResponse *response;

+ (CursameBaseClass *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
