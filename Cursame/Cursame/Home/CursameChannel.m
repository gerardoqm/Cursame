//
//  CursameChannel.m
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "CursameChannel.h"


NSString *const kCursameChannelSignature = @"signature";
NSString *const kCursameChannelChannel = @"channel";
NSString *const kCursameChannelTimestamp = @"timestamp";
NSString *const kCursameChannelServer = @"server";


@interface CursameChannel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CursameChannel

@synthesize signature = _signature;
@synthesize channel = _channel;
@synthesize timestamp = _timestamp;
@synthesize server = _server;


+ (CursameChannel *)modelObjectWithDictionary:(NSDictionary *)dict
{
    CursameChannel *instance = [[CursameChannel alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.signature = [self objectOrNilForKey:kCursameChannelSignature fromDictionary:dict];
            self.channel = [self objectOrNilForKey:kCursameChannelChannel fromDictionary:dict];
            self.timestamp = [[self objectOrNilForKey:kCursameChannelTimestamp fromDictionary:dict] doubleValue];
            self.server = [self objectOrNilForKey:kCursameChannelServer fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.signature forKey:kCursameChannelSignature];
    [mutableDict setValue:self.channel forKey:kCursameChannelChannel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.timestamp] forKey:kCursameChannelTimestamp];
    [mutableDict setValue:self.server forKey:kCursameChannelServer];

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

    self.signature = [aDecoder decodeObjectForKey:kCursameChannelSignature];
    self.channel = [aDecoder decodeObjectForKey:kCursameChannelChannel];
    self.timestamp = [aDecoder decodeDoubleForKey:kCursameChannelTimestamp];
    self.server = [aDecoder decodeObjectForKey:kCursameChannelServer];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_signature forKey:kCursameChannelSignature];
    [aCoder encodeObject:_channel forKey:kCursameChannelChannel];
    [aCoder encodeDouble:_timestamp forKey:kCursameChannelTimestamp];
    [aCoder encodeObject:_server forKey:kCursameChannelServer];
}


@end
