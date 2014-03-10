//
//  CursameCoverphoto.m
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "CursameCoverphoto.h"
#import "CursameExpanded.h"
#import "CursameMosaic.h"


NSString *const kCursameCoverphotoUrl = @"url";
NSString *const kCursameCoverphotoExpanded = @"expanded";
NSString *const kCursameCoverphotoMosaic = @"mosaic";


@interface CursameCoverphoto ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CursameCoverphoto

@synthesize url = _url;
@synthesize expanded = _expanded;
@synthesize mosaic = _mosaic;


+ (CursameCoverphoto *)modelObjectWithDictionary:(NSDictionary *)dict
{
    CursameCoverphoto *instance = [[CursameCoverphoto alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.url = [self objectOrNilForKey:kCursameCoverphotoUrl fromDictionary:dict];
            self.expanded = [CursameExpanded modelObjectWithDictionary:[dict objectForKey:kCursameCoverphotoExpanded]];
            self.mosaic = [CursameMosaic modelObjectWithDictionary:[dict objectForKey:kCursameCoverphotoMosaic]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.url forKey:kCursameCoverphotoUrl];
    [mutableDict setValue:[self.expanded dictionaryRepresentation] forKey:kCursameCoverphotoExpanded];
    [mutableDict setValue:[self.mosaic dictionaryRepresentation] forKey:kCursameCoverphotoMosaic];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.url = [aDecoder decodeObjectForKey:kCursameCoverphotoUrl];
    self.expanded = [aDecoder decodeObjectForKey:kCursameCoverphotoExpanded];
    self.mosaic = [aDecoder decodeObjectForKey:kCursameCoverphotoMosaic];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_url forKey:kCursameCoverphotoUrl];
    [aCoder encodeObject:_expanded forKey:kCursameCoverphotoExpanded];
    [aCoder encodeObject:_mosaic forKey:kCursameCoverphotoMosaic];
}


@end
