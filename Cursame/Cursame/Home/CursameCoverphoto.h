//
//  CursameCoverphoto.h
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CursameExpanded, CursameMosaic;

@interface CursameCoverphoto : NSObject <NSCoding>

@property (nonatomic, assign) id url;
@property (nonatomic, strong) CursameExpanded *expanded;
@property (nonatomic, strong) CursameMosaic *mosaic;

+ (CursameCoverphoto *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
