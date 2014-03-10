//
//  Feed.m
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Feed.h"
#import "Publications.h"


NSString *const kFeedCount = @"count";
NSString *const kFeedPublications = @"publications";


@interface Feed ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Feed

@synthesize count = _count;
@synthesize publications = _publications;


+ (Feed *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Feed *instance = [[Feed alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.count = [[self objectOrNilForKey:kFeedCount fromDictionary:dict] doubleValue];
    NSObject *receivedPublications = [dict objectForKey:kFeedPublications];
    NSMutableArray *parsedPublications = [NSMutableArray array];
    if ([receivedPublications isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPublications) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPublications addObject:[Publications modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPublications isKindOfClass:[NSDictionary class]]) {
       [parsedPublications addObject:[Publications modelObjectWithDictionary:(NSDictionary *)receivedPublications]];
    }

    self.publications = [NSArray arrayWithArray:parsedPublications];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kFeedCount];
NSMutableArray *tempArrayForPublications = [NSMutableArray array];
    for (NSObject *subArrayObject in self.publications) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPublications addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPublications addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPublications] forKey:@"kFeedPublications"];

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

    self.count = [aDecoder decodeDoubleForKey:kFeedCount];
    self.publications = [aDecoder decodeObjectForKey:kFeedPublications];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_count forKey:kFeedCount];
    [aCoder encodeObject:_publications forKey:kFeedPublications];
}


@end
