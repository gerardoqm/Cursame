//
//  Logo.h
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Response, Square;

@interface Logo : NSObject <NSCoding>

@property (nonatomic, assign) id url;
@property (nonatomic, strong) Response *response;
@property (nonatomic, strong) Square *square;

+ (Logo *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
