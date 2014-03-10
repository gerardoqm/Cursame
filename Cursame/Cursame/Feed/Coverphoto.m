//
//  Coverphoto.m
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Coverphoto.h"
#import "Expanded.h"
#import "Mosaic.h"


NSString *const kCoverphotoUrl = @"url";
NSString *const kCoverphotoExpanded = @"expanded";
NSString *const kCoverphotoMosaic = @"mosaic";


@interface Coverphoto ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Coverphoto

@synthesize url = _url;
@synthesize expanded = _expanded;
@synthesize mosaic = _mosaic;


+ (Coverphoto *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Coverphoto *instance = [[Coverphoto alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.url = [self objectOrNilForKey:kCoverphotoUrl fromDictionary:dict];
            self.expanded = [Expanded modelObjectWithDictionary:[dict objectForKey:kCoverphotoExpanded]];
            self.mosaic = [Mosaic modelObjectWithDictionary:[dict objectForKey:kCoverphotoMosaic]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.url forKey:kCoverphotoUrl];
    [mutableDict setValue:[self.expanded dictionaryRepresentation] forKey:kCoverphotoExpanded];
    [mutableDict setValue:[self.mosaic dictionaryRepresentation] forKey:kCoverphotoMosaic];

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

    self.url = [aDecoder decodeObjectForKey:kCoverphotoUrl];
    self.expanded = [aDecoder decodeObjectForKey:kCoverphotoExpanded];
    self.mosaic = [aDecoder decodeObjectForKey:kCoverphotoMosaic];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_url forKey:kCoverphotoUrl];
    [aCoder encodeObject:_expanded forKey:kCoverphotoExpanded];
    [aCoder encodeObject:_mosaic forKey:kCoverphotoMosaic];
}


@end
