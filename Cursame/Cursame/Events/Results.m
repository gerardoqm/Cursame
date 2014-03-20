//
//  Results.m
//
//  Created by Gerardo Quintanar Morales on 3/19/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Results.h"


NSString *const kResultsAllDay = @"allDay";
NSString *const kResultsEnd = @"end";
NSString *const kResultsStart = @"start";
NSString *const kResultsId = @"id";
NSString *const kResultsTitle = @"title";
NSString *const kResultsRecurring = @"recurring";
NSString *const kResultsDescription = @"description";
NSString *const kResultsUrl = @"url";


@interface Results ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Results

@synthesize allDay = _allDay;
@synthesize endProperty = _endProperty;
@synthesize start = _start;
@synthesize resultsIdentifier = _resultsIdentifier;
@synthesize title = _title;
@synthesize recurring = _recurring;
@synthesize resultsDescription = _resultsDescription;
@synthesize url = _url;


+ (Results *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Results *instance = [[Results alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.allDay = [self objectOrNilForKey:kResultsAllDay fromDictionary:dict];
            self.endProperty = [self objectOrNilForKey:kResultsEnd fromDictionary:dict];
            self.start = [self objectOrNilForKey:kResultsStart fromDictionary:dict];
            self.resultsIdentifier = [[self objectOrNilForKey:kResultsId fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kResultsTitle fromDictionary:dict];
            self.recurring = [[self objectOrNilForKey:kResultsRecurring fromDictionary:dict] boolValue];
            self.resultsDescription = [self objectOrNilForKey:kResultsDescription fromDictionary:dict];
            self.url = [self objectOrNilForKey:kResultsUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.allDay forKey:kResultsAllDay];
    [mutableDict setValue:self.endProperty forKey:kResultsEnd];
    [mutableDict setValue:self.start forKey:kResultsStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resultsIdentifier] forKey:kResultsId];
    [mutableDict setValue:self.title forKey:kResultsTitle];
    [mutableDict setValue:[NSNumber numberWithBool:self.recurring] forKey:kResultsRecurring];
    [mutableDict setValue:self.resultsDescription forKey:kResultsDescription];
    [mutableDict setValue:self.url forKey:kResultsUrl];

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

    self.allDay = [aDecoder decodeObjectForKey:kResultsAllDay];
    self.endProperty = [aDecoder decodeObjectForKey:kResultsEnd];
    self.start = [aDecoder decodeObjectForKey:kResultsStart];
    self.resultsIdentifier = [aDecoder decodeDoubleForKey:kResultsId];
    self.title = [aDecoder decodeObjectForKey:kResultsTitle];
    self.recurring = [aDecoder decodeBoolForKey:kResultsRecurring];
    self.resultsDescription = [aDecoder decodeObjectForKey:kResultsDescription];
    self.url = [aDecoder decodeObjectForKey:kResultsUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_allDay forKey:kResultsAllDay];
    [aCoder encodeObject:_endProperty forKey:kResultsEnd];
    [aCoder encodeObject:_start forKey:kResultsStart];
    [aCoder encodeDouble:_resultsIdentifier forKey:kResultsId];
    [aCoder encodeObject:_title forKey:kResultsTitle];
    [aCoder encodeBool:_recurring forKey:kResultsRecurring];
    [aCoder encodeObject:_resultsDescription forKey:kResultsDescription];
    [aCoder encodeObject:_url forKey:kResultsUrl];
}


@end
