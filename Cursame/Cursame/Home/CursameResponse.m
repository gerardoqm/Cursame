//
//  CursameResponse.m
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "CursameResponse.h"
#import "CursameChannel.h"
#import "CursameUser.h"


NSString *const kCursameResponseSuccess = @"success";
NSString *const kCursameResponseChannel = @"channel";
NSString *const kCursameResponseToken = @"token";
NSString *const kCursameResponseUser = @"user";


@interface CursameResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CursameResponse

@synthesize success = _success;
@synthesize channel = _channel;
@synthesize token = _token;
@synthesize user = _user;


+ (CursameResponse *)modelObjectWithDictionary:(NSDictionary *)dict
{
    CursameResponse *instance = [[CursameResponse alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.success = [[self objectOrNilForKey:kCursameResponseSuccess fromDictionary:dict] boolValue];
            self.channel = [CursameChannel modelObjectWithDictionary:[dict objectForKey:kCursameResponseChannel]];
            self.token = [self objectOrNilForKey:kCursameResponseToken fromDictionary:dict];
            self.user = [CursameUser modelObjectWithDictionary:[dict objectForKey:kCursameResponseUser]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.success] forKey:kCursameResponseSuccess];
    [mutableDict setValue:[self.channel dictionaryRepresentation] forKey:kCursameResponseChannel];
    [mutableDict setValue:self.token forKey:kCursameResponseToken];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kCursameResponseUser];

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

    self.success = [aDecoder decodeBoolForKey:kCursameResponseSuccess];
    self.channel = [aDecoder decodeObjectForKey:kCursameResponseChannel];
    self.token = [aDecoder decodeObjectForKey:kCursameResponseToken];
    self.user = [aDecoder decodeObjectForKey:kCursameResponseUser];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_success forKey:kCursameResponseSuccess];
    [aCoder encodeObject:_channel forKey:kCursameResponseChannel];
    [aCoder encodeObject:_token forKey:kCursameResponseToken];
    [aCoder encodeObject:_user forKey:kCursameResponseUser];
}


@end
