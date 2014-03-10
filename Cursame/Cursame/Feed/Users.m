//
//  Users.m
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Users.h"
#import "Coverphoto.h"
#import "Avatar.h"


NSString *const kUsersId = @"id";
NSString *const kUsersDescription = @"description";
NSString *const kUsersCoverphoto = @"coverphoto";
NSString *const kUsersBios = @"bios";
NSString *const kUsersKeyAnalytics = @"key_analytics";
NSString *const kUsersTwitterLink = @"twitter_link";
NSString *const kUsersCreatedAt = @"created_at";
NSString *const kUsersTourInfo = @"tour_info";
NSString *const kUsersDomain = @"domain";
NSString *const kUsersAcceptedTerms = @"accepted_terms";
NSString *const kUsersFacebookLink = @"facebook_link";
NSString *const kUsersAvatar = @"avatar";
NSString *const kUsersSubdomain = @"subdomain";
NSString *const kUsersFirstName = @"first_name";
NSString *const kUsersUpdatedAt = @"updated_at";
NSString *const kUsersLastName = @"last_name";
NSString *const kUsersEmail = @"email";
NSString *const kUsersOnline = @"online";
NSString *const kUsersPersonalUrl = @"personal_url";


@interface Users ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Users

@synthesize usersIdentifier = _usersIdentifier;
@synthesize usersDescription = _usersDescription;
@synthesize coverphoto = _coverphoto;
@synthesize bios = _bios;
@synthesize keyAnalytics = _keyAnalytics;
@synthesize twitterLink = _twitterLink;
@synthesize createdAt = _createdAt;
@synthesize tourInfo = _tourInfo;
@synthesize domain = _domain;
@synthesize acceptedTerms = _acceptedTerms;
@synthesize facebookLink = _facebookLink;
@synthesize avatar = _avatar;
@synthesize subdomain = _subdomain;
@synthesize firstName = _firstName;
@synthesize updatedAt = _updatedAt;
@synthesize lastName = _lastName;
@synthesize email = _email;
@synthesize online = _online;
@synthesize personalUrl = _personalUrl;


+ (Users *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Users *instance = [[Users alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.usersIdentifier = [[self objectOrNilForKey:kUsersId fromDictionary:dict] doubleValue];
            self.usersDescription = [self objectOrNilForKey:kUsersDescription fromDictionary:dict];
            self.coverphoto = [Coverphoto modelObjectWithDictionary:[dict objectForKey:kUsersCoverphoto]];
            self.bios = [self objectOrNilForKey:kUsersBios fromDictionary:dict];
            self.keyAnalytics = [self objectOrNilForKey:kUsersKeyAnalytics fromDictionary:dict];
            self.twitterLink = [self objectOrNilForKey:kUsersTwitterLink fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kUsersCreatedAt fromDictionary:dict];
            self.tourInfo = [self objectOrNilForKey:kUsersTourInfo fromDictionary:dict];
            self.domain = [self objectOrNilForKey:kUsersDomain fromDictionary:dict];
            self.acceptedTerms = [[self objectOrNilForKey:kUsersAcceptedTerms fromDictionary:dict] boolValue];
            self.facebookLink = [self objectOrNilForKey:kUsersFacebookLink fromDictionary:dict];
            self.avatar = [Avatar modelObjectWithDictionary:[dict objectForKey:kUsersAvatar]];
            self.subdomain = [self objectOrNilForKey:kUsersSubdomain fromDictionary:dict];
            self.firstName = [self objectOrNilForKey:kUsersFirstName fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kUsersUpdatedAt fromDictionary:dict];
            self.lastName = [self objectOrNilForKey:kUsersLastName fromDictionary:dict];
            self.email = [self objectOrNilForKey:kUsersEmail fromDictionary:dict];
            self.online = [[self objectOrNilForKey:kUsersOnline fromDictionary:dict] boolValue];
            self.personalUrl = [self objectOrNilForKey:kUsersPersonalUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.usersIdentifier] forKey:kUsersId];
    [mutableDict setValue:self.usersDescription forKey:kUsersDescription];
    [mutableDict setValue:[self.coverphoto dictionaryRepresentation] forKey:kUsersCoverphoto];
    [mutableDict setValue:self.bios forKey:kUsersBios];
    [mutableDict setValue:self.keyAnalytics forKey:kUsersKeyAnalytics];
    [mutableDict setValue:self.twitterLink forKey:kUsersTwitterLink];
    [mutableDict setValue:self.createdAt forKey:kUsersCreatedAt];
    [mutableDict setValue:self.tourInfo forKey:kUsersTourInfo];
    [mutableDict setValue:self.domain forKey:kUsersDomain];
    [mutableDict setValue:[NSNumber numberWithBool:self.acceptedTerms] forKey:kUsersAcceptedTerms];
    [mutableDict setValue:self.facebookLink forKey:kUsersFacebookLink];
    [mutableDict setValue:[self.avatar dictionaryRepresentation] forKey:kUsersAvatar];
    [mutableDict setValue:self.subdomain forKey:kUsersSubdomain];
    [mutableDict setValue:self.firstName forKey:kUsersFirstName];
    [mutableDict setValue:self.updatedAt forKey:kUsersUpdatedAt];
    [mutableDict setValue:self.lastName forKey:kUsersLastName];
    [mutableDict setValue:self.email forKey:kUsersEmail];
    [mutableDict setValue:[NSNumber numberWithBool:self.online] forKey:kUsersOnline];
    [mutableDict setValue:self.personalUrl forKey:kUsersPersonalUrl];

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

    self.usersIdentifier = [aDecoder decodeDoubleForKey:kUsersId];
    self.usersDescription = [aDecoder decodeObjectForKey:kUsersDescription];
    self.coverphoto = [aDecoder decodeObjectForKey:kUsersCoverphoto];
    self.bios = [aDecoder decodeObjectForKey:kUsersBios];
    self.keyAnalytics = [aDecoder decodeObjectForKey:kUsersKeyAnalytics];
    self.twitterLink = [aDecoder decodeObjectForKey:kUsersTwitterLink];
    self.createdAt = [aDecoder decodeObjectForKey:kUsersCreatedAt];
    self.tourInfo = [aDecoder decodeObjectForKey:kUsersTourInfo];
    self.domain = [aDecoder decodeObjectForKey:kUsersDomain];
    self.acceptedTerms = [aDecoder decodeBoolForKey:kUsersAcceptedTerms];
    self.facebookLink = [aDecoder decodeObjectForKey:kUsersFacebookLink];
    self.avatar = [aDecoder decodeObjectForKey:kUsersAvatar];
    self.subdomain = [aDecoder decodeObjectForKey:kUsersSubdomain];
    self.firstName = [aDecoder decodeObjectForKey:kUsersFirstName];
    self.updatedAt = [aDecoder decodeObjectForKey:kUsersUpdatedAt];
    self.lastName = [aDecoder decodeObjectForKey:kUsersLastName];
    self.email = [aDecoder decodeObjectForKey:kUsersEmail];
    self.online = [aDecoder decodeBoolForKey:kUsersOnline];
    self.personalUrl = [aDecoder decodeObjectForKey:kUsersPersonalUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_usersIdentifier forKey:kUsersId];
    [aCoder encodeObject:_usersDescription forKey:kUsersDescription];
    [aCoder encodeObject:_coverphoto forKey:kUsersCoverphoto];
    [aCoder encodeObject:_bios forKey:kUsersBios];
    [aCoder encodeObject:_keyAnalytics forKey:kUsersKeyAnalytics];
    [aCoder encodeObject:_twitterLink forKey:kUsersTwitterLink];
    [aCoder encodeObject:_createdAt forKey:kUsersCreatedAt];
    [aCoder encodeObject:_tourInfo forKey:kUsersTourInfo];
    [aCoder encodeObject:_domain forKey:kUsersDomain];
    [aCoder encodeBool:_acceptedTerms forKey:kUsersAcceptedTerms];
    [aCoder encodeObject:_facebookLink forKey:kUsersFacebookLink];
    [aCoder encodeObject:_avatar forKey:kUsersAvatar];
    [aCoder encodeObject:_subdomain forKey:kUsersSubdomain];
    [aCoder encodeObject:_firstName forKey:kUsersFirstName];
    [aCoder encodeObject:_updatedAt forKey:kUsersUpdatedAt];
    [aCoder encodeObject:_lastName forKey:kUsersLastName];
    [aCoder encodeObject:_email forKey:kUsersEmail];
    [aCoder encodeBool:_online forKey:kUsersOnline];
    [aCoder encodeObject:_personalUrl forKey:kUsersPersonalUrl];
}


@end
