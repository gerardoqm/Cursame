//
//  CursameProfile.m
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "CursameProfile.h"


NSString *const kCursameProfileUrl = @"url";


@interface CursameProfile ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CursameProfile

@synthesize url = _url;


+ (CursameProfile *)modelObjectWithDictionary:(NSDictionary *)dict
{
    CursameProfile *instance = [[CursameProfile alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.url = [self objectOrNilForKey:kCursameProfileUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.url forKey:kCursameProfileUrl];

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

    self.url = [aDecoder decodeObjectForKey:kCursameProfileUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_url forKey:kCursameProfileUrl];
}


@end
