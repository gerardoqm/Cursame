//
//  CursameImageFront.m
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "CursameImageFront.h"
#import "CursameExpanded.h"


NSString *const kCursameImageFrontUrl = @"url";
NSString *const kCursameImageFrontExpanded = @"expanded";


@interface CursameImageFront ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CursameImageFront

@synthesize url = _url;
@synthesize expanded = _expanded;


+ (CursameImageFront *)modelObjectWithDictionary:(NSDictionary *)dict
{
    CursameImageFront *instance = [[CursameImageFront alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.url = [self objectOrNilForKey:kCursameImageFrontUrl fromDictionary:dict];
            self.expanded = [CursameExpanded modelObjectWithDictionary:[dict objectForKey:kCursameImageFrontExpanded]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.url forKey:kCursameImageFrontUrl];
    [mutableDict setValue:[self.expanded dictionaryRepresentation] forKey:kCursameImageFrontExpanded];

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

    self.url = [aDecoder decodeObjectForKey:kCursameImageFrontUrl];
    self.expanded = [aDecoder decodeObjectForKey:kCursameImageFrontExpanded];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_url forKey:kCursameImageFrontUrl];
    [aCoder encodeObject:_expanded forKey:kCursameImageFrontExpanded];
}


@end
