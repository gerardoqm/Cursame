//
//  CursameEvents.h
//
//  Created by Gerardo Quintanar Morales on 3/19/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CursameEvents : NSObject <NSCoding>

@property (nonatomic, strong) NSArray *results;
@property (nonatomic, assign) double count;

+ (CursameEvents *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
