//
//  CursameRoles.m
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "CursameRoles.h"


NSString *const kCursameRolesCreated = @"created";
NSString *const kCursameRolesId = @"id";
NSString *const kCursameRolesTitle = @"title";
NSString *const kCursameRolesDescription = @"description";
NSString *const kCursameRolesUpdatedAt = @"updated_at";
NSString *const kCursameRolesCreatedAt = @"created_at";


@interface CursameRoles ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CursameRoles

@synthesize created = _created;
@synthesize rolesIdentifier = _rolesIdentifier;
@synthesize title = _title;
@synthesize rolesDescription = _rolesDescription;
@synthesize updatedAt = _updatedAt;
@synthesize createdAt = _createdAt;


+ (CursameRoles *)modelObjectWithDictionary:(NSDictionary *)dict
{
    CursameRoles *instance = [[CursameRoles alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.created = [self objectOrNilForKey:kCursameRolesCreated fromDictionary:dict];
            self.rolesIdentifier = [[self objectOrNilForKey:kCursameRolesId fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kCursameRolesTitle fromDictionary:dict];
            self.rolesDescription = [self objectOrNilForKey:kCursameRolesDescription fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kCursameRolesUpdatedAt fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kCursameRolesCreatedAt fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.created forKey:kCursameRolesCreated];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rolesIdentifier] forKey:kCursameRolesId];
    [mutableDict setValue:self.title forKey:kCursameRolesTitle];
    [mutableDict setValue:self.rolesDescription forKey:kCursameRolesDescription];
    [mutableDict setValue:self.updatedAt forKey:kCursameRolesUpdatedAt];
    [mutableDict setValue:self.createdAt forKey:kCursameRolesCreatedAt];

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

    self.created = [aDecoder decodeObjectForKey:kCursameRolesCreated];
    self.rolesIdentifier = [aDecoder decodeDoubleForKey:kCursameRolesId];
    self.title = [aDecoder decodeObjectForKey:kCursameRolesTitle];
    self.rolesDescription = [aDecoder decodeObjectForKey:kCursameRolesDescription];
    self.updatedAt = [aDecoder decodeObjectForKey:kCursameRolesUpdatedAt];
    self.createdAt = [aDecoder decodeObjectForKey:kCursameRolesCreatedAt];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_created forKey:kCursameRolesCreated];
    [aCoder encodeDouble:_rolesIdentifier forKey:kCursameRolesId];
    [aCoder encodeObject:_title forKey:kCursameRolesTitle];
    [aCoder encodeObject:_rolesDescription forKey:kCursameRolesDescription];
    [aCoder encodeObject:_updatedAt forKey:kCursameRolesUpdatedAt];
    [aCoder encodeObject:_createdAt forKey:kCursameRolesCreatedAt];
}


@end
