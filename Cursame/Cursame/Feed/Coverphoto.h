//
//  Coverphoto.h
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Expanded, Mosaic;

@interface Coverphoto : NSObject <NSCoding>

@property (nonatomic, assign) id url;
@property (nonatomic, strong) Expanded *expanded;
@property (nonatomic, strong) Mosaic *mosaic;

+ (Coverphoto *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
