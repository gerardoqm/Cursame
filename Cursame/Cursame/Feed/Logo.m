//
//  Logo.m
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Logo.h"
#import "Response.h"
#import "Square.h"


NSString *const kLogoUrl = @"url";
NSString *const kLogoResponse = @"response";
NSString *const kLogoSquare = @"square";


@interface Logo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Logo

@synthesize url = _url;
@synthesize response = _response;
@synthesize square = _square;


+ (Logo *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Logo *instance = [[Logo alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.url = [self objectOrNilForKey:kLogoUrl fromDictionary:dict];
            self.response = [Response modelObjectWithDictionary:[dict objectForKey:kLogoResponse]];
            self.square = [Square modelObjectWithDictionary:[dict objectForKey:kLogoSquare]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.url forKey:kLogoUrl];
    [mutableDict setValue:[self.response dictionaryRepresentation] forKey:kLogoResponse];
    [mutableDict setValue:[self.square dictionaryRepresentation] forKey:kLogoSquare];

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

    self.url = [aDecoder decodeObjectForKey:kLogoUrl];
    self.response = [aDecoder decodeObjectForKey:kLogoResponse];
    self.square = [aDecoder decodeObjectForKey:kLogoSquare];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_url forKey:kLogoUrl];
    [aCoder encodeObject:_response forKey:kLogoResponse];
    [aCoder encodeObject:_square forKey:kLogoSquare];
}


@end
