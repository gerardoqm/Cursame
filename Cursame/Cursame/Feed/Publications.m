//
//  Publications.m
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Publications.h"
#import "Publication.h"
#import "Users.h"
#import "Network.h"


NSString *const kPublicationsPublication = @"publication";
NSString *const kPublicationsPublicationId = @"publication_id";
NSString *const kPublicationsNetworkId = @"network_id";
NSString *const kPublicationsId = @"id";
NSString *const kPublicationsCreatedAt = @"created_at";
NSString *const kPublicationsPublicationType = @"publication_type";
NSString *const kPublicationsPublic = @"public";
NSString *const kPublicationsCourses = @"courses";
NSString *const kPublicationsUpdatedAt = @"updated_at";
NSString *const kPublicationsUsers = @"users";
NSString *const kPublicationsNetwork = @"network";


@interface Publications ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Publications

@synthesize publication = _publication;
@synthesize publicationId = _publicationId;
@synthesize networkId = _networkId;
@synthesize publicationsIdentifier = _publicationsIdentifier;
@synthesize createdAt = _createdAt;
@synthesize publicationType = _publicationType;
@synthesize publicProperty = _publicProperty;
@synthesize courses = _courses;
@synthesize updatedAt = _updatedAt;
@synthesize users = _users;
@synthesize network = _network;


+ (Publications *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Publications *instance = [[Publications alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.publication = [Publication modelObjectWithDictionary:[dict objectForKey:kPublicationsPublication]];
            self.publicationId = [[self objectOrNilForKey:kPublicationsPublicationId fromDictionary:dict] doubleValue];
            self.networkId = [[self objectOrNilForKey:kPublicationsNetworkId fromDictionary:dict] doubleValue];
            self.publicationsIdentifier = [[self objectOrNilForKey:kPublicationsId fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kPublicationsCreatedAt fromDictionary:dict];
            self.publicationType = [self objectOrNilForKey:kPublicationsPublicationType fromDictionary:dict];
            self.publicProperty = [[self objectOrNilForKey:kPublicationsPublic fromDictionary:dict] boolValue];
            self.courses = [self objectOrNilForKey:kPublicationsCourses fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kPublicationsUpdatedAt fromDictionary:dict];
    NSObject *receivedUsers = [dict objectForKey:kPublicationsUsers];
    NSMutableArray *parsedUsers = [NSMutableArray array];
    if ([receivedUsers isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedUsers) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedUsers addObject:[Users modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedUsers isKindOfClass:[NSDictionary class]]) {
       [parsedUsers addObject:[Users modelObjectWithDictionary:(NSDictionary *)receivedUsers]];
    }

    self.users = [NSArray arrayWithArray:parsedUsers];
            self.network = [Network modelObjectWithDictionary:[dict objectForKey:kPublicationsNetwork]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.publication dictionaryRepresentation] forKey:kPublicationsPublication];
    [mutableDict setValue:[NSNumber numberWithDouble:self.publicationId] forKey:kPublicationsPublicationId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.networkId] forKey:kPublicationsNetworkId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.publicationsIdentifier] forKey:kPublicationsId];
    [mutableDict setValue:self.createdAt forKey:kPublicationsCreatedAt];
    [mutableDict setValue:self.publicationType forKey:kPublicationsPublicationType];
    [mutableDict setValue:[NSNumber numberWithBool:self.publicProperty] forKey:kPublicationsPublic];
NSMutableArray *tempArrayForCourses = [NSMutableArray array];
    for (NSObject *subArrayObject in self.courses) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCourses addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCourses addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCourses] forKey:@"kPublicationsCourses"];
    [mutableDict setValue:self.updatedAt forKey:kPublicationsUpdatedAt];
NSMutableArray *tempArrayForUsers = [NSMutableArray array];
    for (NSObject *subArrayObject in self.users) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForUsers addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForUsers addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForUsers] forKey:@"kPublicationsUsers"];
    [mutableDict setValue:[self.network dictionaryRepresentation] forKey:kPublicationsNetwork];

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

    self.publication = [aDecoder decodeObjectForKey:kPublicationsPublication];
    self.publicationId = [aDecoder decodeDoubleForKey:kPublicationsPublicationId];
    self.networkId = [aDecoder decodeDoubleForKey:kPublicationsNetworkId];
    self.publicationsIdentifier = [aDecoder decodeDoubleForKey:kPublicationsId];
    self.createdAt = [aDecoder decodeObjectForKey:kPublicationsCreatedAt];
    self.publicationType = [aDecoder decodeObjectForKey:kPublicationsPublicationType];
    self.publicProperty = [aDecoder decodeBoolForKey:kPublicationsPublic];
    self.courses = [aDecoder decodeObjectForKey:kPublicationsCourses];
    self.updatedAt = [aDecoder decodeObjectForKey:kPublicationsUpdatedAt];
    self.users = [aDecoder decodeObjectForKey:kPublicationsUsers];
    self.network = [aDecoder decodeObjectForKey:kPublicationsNetwork];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_publication forKey:kPublicationsPublication];
    [aCoder encodeDouble:_publicationId forKey:kPublicationsPublicationId];
    [aCoder encodeDouble:_networkId forKey:kPublicationsNetworkId];
    [aCoder encodeDouble:_publicationsIdentifier forKey:kPublicationsId];
    [aCoder encodeObject:_createdAt forKey:kPublicationsCreatedAt];
    [aCoder encodeObject:_publicationType forKey:kPublicationsPublicationType];
    [aCoder encodeBool:_publicProperty forKey:kPublicationsPublic];
    [aCoder encodeObject:_courses forKey:kPublicationsCourses];
    [aCoder encodeObject:_updatedAt forKey:kPublicationsUpdatedAt];
    [aCoder encodeObject:_users forKey:kPublicationsUsers];
    [aCoder encodeObject:_network forKey:kPublicationsNetwork];
}


@end
