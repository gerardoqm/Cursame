//
//  CursameNotifications.m
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "CursameNotifications.h"


NSString *const kCursameNotificationsActive = @"active";
NSString *const kCursameNotificationsNotificatorId = @"notificator_id";
NSString *const kCursameNotificationsId = @"id";
NSString *const kCursameNotificationsNotificatorType = @"notificator_type";
NSString *const kCursameNotificationsCreatedAt = @"created_at";
NSString *const kCursameNotificationsUpdatedAt = @"updated_at";
NSString *const kCursameNotificationsKind = @"kind";


@interface CursameNotifications ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CursameNotifications

@synthesize active = _active;
@synthesize notificatorId = _notificatorId;
@synthesize notificationsIdentifier = _notificationsIdentifier;
@synthesize notificatorType = _notificatorType;
@synthesize createdAt = _createdAt;
@synthesize updatedAt = _updatedAt;
@synthesize kind = _kind;


+ (CursameNotifications *)modelObjectWithDictionary:(NSDictionary *)dict
{
    CursameNotifications *instance = [[CursameNotifications alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.active = [[self objectOrNilForKey:kCursameNotificationsActive fromDictionary:dict] boolValue];
            self.notificatorId = [[self objectOrNilForKey:kCursameNotificationsNotificatorId fromDictionary:dict] doubleValue];
            self.notificationsIdentifier = [[self objectOrNilForKey:kCursameNotificationsId fromDictionary:dict] doubleValue];
            self.notificatorType = [self objectOrNilForKey:kCursameNotificationsNotificatorType fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kCursameNotificationsCreatedAt fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kCursameNotificationsUpdatedAt fromDictionary:dict];
            self.kind = [self objectOrNilForKey:kCursameNotificationsKind fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.active] forKey:kCursameNotificationsActive];
    [mutableDict setValue:[NSNumber numberWithDouble:self.notificatorId] forKey:kCursameNotificationsNotificatorId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.notificationsIdentifier] forKey:kCursameNotificationsId];
    [mutableDict setValue:self.notificatorType forKey:kCursameNotificationsNotificatorType];
    [mutableDict setValue:self.createdAt forKey:kCursameNotificationsCreatedAt];
    [mutableDict setValue:self.updatedAt forKey:kCursameNotificationsUpdatedAt];
    [mutableDict setValue:self.kind forKey:kCursameNotificationsKind];

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

    self.active = [aDecoder decodeBoolForKey:kCursameNotificationsActive];
    self.notificatorId = [aDecoder decodeDoubleForKey:kCursameNotificationsNotificatorId];
    self.notificationsIdentifier = [aDecoder decodeDoubleForKey:kCursameNotificationsId];
    self.notificatorType = [aDecoder decodeObjectForKey:kCursameNotificationsNotificatorType];
    self.createdAt = [aDecoder decodeObjectForKey:kCursameNotificationsCreatedAt];
    self.updatedAt = [aDecoder decodeObjectForKey:kCursameNotificationsUpdatedAt];
    self.kind = [aDecoder decodeObjectForKey:kCursameNotificationsKind];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_active forKey:kCursameNotificationsActive];
    [aCoder encodeDouble:_notificatorId forKey:kCursameNotificationsNotificatorId];
    [aCoder encodeDouble:_notificationsIdentifier forKey:kCursameNotificationsId];
    [aCoder encodeObject:_notificatorType forKey:kCursameNotificationsNotificatorType];
    [aCoder encodeObject:_createdAt forKey:kCursameNotificationsCreatedAt];
    [aCoder encodeObject:_updatedAt forKey:kCursameNotificationsUpdatedAt];
    [aCoder encodeObject:_kind forKey:kCursameNotificationsKind];
}


@end
