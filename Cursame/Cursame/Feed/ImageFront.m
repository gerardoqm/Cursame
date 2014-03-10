//
//  ImageFront.m
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "ImageFront.h"
#import "Expanded.h"


NSString *const kImageFrontUrl = @"url";
NSString *const kImageFrontExpanded = @"expanded";


@interface ImageFront ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ImageFront

@synthesize url = _url;
@synthesize expanded = _expanded;


+ (ImageFront *)modelObjectWithDictionary:(NSDictionary *)dict
{
    ImageFront *instance = [[ImageFront alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.url = [self objectOrNilForKey:kImageFrontUrl fromDictionary:dict];
            self.expanded = [Expanded modelObjectWithDictionary:[dict objectForKey:kImageFrontExpanded]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.url forKey:kImageFrontUrl];
    [mutableDict setValue:[self.expanded dictionaryRepresentation] forKey:kImageFrontExpanded];

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

    self.url = [aDecoder decodeObjectForKey:kImageFrontUrl];
    self.expanded = [aDecoder decodeObjectForKey:kImageFrontExpanded];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_url forKey:kImageFrontUrl];
    [aCoder encodeObject:_expanded forKey:kImageFrontExpanded];
}


@end
