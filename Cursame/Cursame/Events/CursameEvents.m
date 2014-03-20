//
//  CursameEvents.m
//
//  Created by Gerardo Quintanar Morales on 3/19/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "CursameEvents.h"
#import "Results.h"


NSString *const kCursameEventsResults = @"results";
NSString *const kCursameEventsCount = @"count";


@interface CursameEvents ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CursameEvents

@synthesize results = _results;
@synthesize count = _count;


+ (CursameEvents *)modelObjectWithDictionary:(NSDictionary *)dict
{
    CursameEvents *instance = [[CursameEvents alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedResults = [dict objectForKey:kCursameEventsResults];
    NSMutableArray *parsedResults = [NSMutableArray array];
    if ([receivedResults isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedResults) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedResults addObject:[Results modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedResults isKindOfClass:[NSDictionary class]]) {
       [parsedResults addObject:[Results modelObjectWithDictionary:(NSDictionary *)receivedResults]];
    }

    self.results = [NSArray arrayWithArray:parsedResults];
            self.count = [[self objectOrNilForKey:kCursameEventsCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
NSMutableArray *tempArrayForResults = [NSMutableArray array];
    for (NSObject *subArrayObject in self.results) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForResults addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForResults addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResults] forKey:@"kCursameEventsResults"];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kCursameEventsCount];

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

    self.results = [aDecoder decodeObjectForKey:kCursameEventsResults];
    self.count = [aDecoder decodeDoubleForKey:kCursameEventsCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_results forKey:kCursameEventsResults];
    [aCoder encodeDouble:_count forKey:kCursameEventsCount];
}


@end
