//
//  User.m
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "User.h"
#import "Coverphoto.h"
#import "Avatar.h"


NSString *const kUserId = @"id";
NSString *const kUserDescription = @"description";
NSString *const kUserCoverphoto = @"coverphoto";
NSString *const kUserBios = @"bios";
NSString *const kUserKeyAnalytics = @"key_analytics";
NSString *const kUserTwitterLink = @"twitter_link";
NSString *const kUserCreatedAt = @"created_at";
NSString *const kUserTourInfo = @"tour_info";
NSString *const kUserDomain = @"domain";
NSString *const kUserAcceptedTerms = @"accepted_terms";
NSString *const kUserFacebookLink = @"facebook_link";
NSString *const kUserAvatar = @"avatar";
NSString *const kUserSubdomain = @"subdomain";
NSString *const kUserFirstName = @"first_name";
NSString *const kUserUpdatedAt = @"updated_at";
NSString *const kUserLastName = @"last_name";
NSString *const kUserEmail = @"email";
NSString *const kUserOnline = @"online";
NSString *const kUserPersonalUrl = @"personal_url";


@interface User ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation User

@synthesize userIdentifier = _userIdentifier;
@synthesize userDescription = _userDescription;
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


+ (User *)modelObjectWithDictionary:(NSDictionary *)dict
{
    User *instance = [[User alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.userIdentifier = [[self objectOrNilForKey:kUserId fromDictionary:dict] doubleValue];
            self.userDescription = [self objectOrNilForKey:kUserDescription fromDictionary:dict];
            self.coverphoto = [Coverphoto modelObjectWithDictionary:[dict objectForKey:kUserCoverphoto]];
            self.bios = [self objectOrNilForKey:kUserBios fromDictionary:dict];
            self.keyAnalytics = [self objectOrNilForKey:kUserKeyAnalytics fromDictionary:dict];
            self.twitterLink = [self objectOrNilForKey:kUserTwitterLink fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kUserCreatedAt fromDictionary:dict];
            self.tourInfo = [self objectOrNilForKey:kUserTourInfo fromDictionary:dict];
            self.domain = [self objectOrNilForKey:kUserDomain fromDictionary:dict];
            self.acceptedTerms = [[self objectOrNilForKey:kUserAcceptedTerms fromDictionary:dict] boolValue];
            self.facebookLink = [self objectOrNilForKey:kUserFacebookLink fromDictionary:dict];
            self.avatar = [Avatar modelObjectWithDictionary:[dict objectForKey:kUserAvatar]];
            self.subdomain = [self objectOrNilForKey:kUserSubdomain fromDictionary:dict];
            self.firstName = [self objectOrNilForKey:kUserFirstName fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kUserUpdatedAt fromDictionary:dict];
            self.lastName = [self objectOrNilForKey:kUserLastName fromDictionary:dict];
            self.email = [self objectOrNilForKey:kUserEmail fromDictionary:dict];
            self.online = [[self objectOrNilForKey:kUserOnline fromDictionary:dict] boolValue];
            self.personalUrl = [self objectOrNilForKey:kUserPersonalUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdentifier] forKey:kUserId];
    [mutableDict setValue:self.userDescription forKey:kUserDescription];
    [mutableDict setValue:[self.coverphoto dictionaryRepresentation] forKey:kUserCoverphoto];
    [mutableDict setValue:self.bios forKey:kUserBios];
    [mutableDict setValue:self.keyAnalytics forKey:kUserKeyAnalytics];
    [mutableDict setValue:self.twitterLink forKey:kUserTwitterLink];
    [mutableDict setValue:self.createdAt forKey:kUserCreatedAt];
    [mutableDict setValue:self.tourInfo forKey:kUserTourInfo];
    [mutableDict setValue:self.domain forKey:kUserDomain];
    [mutableDict setValue:[NSNumber numberWithBool:self.acceptedTerms] forKey:kUserAcceptedTerms];
    [mutableDict setValue:self.facebookLink forKey:kUserFacebookLink];
    [mutableDict setValue:[self.avatar dictionaryRepresentation] forKey:kUserAvatar];
    [mutableDict setValue:self.subdomain forKey:kUserSubdomain];
    [mutableDict setValue:self.firstName forKey:kUserFirstName];
    [mutableDict setValue:self.updatedAt forKey:kUserUpdatedAt];
    [mutableDict setValue:self.lastName forKey:kUserLastName];
    [mutableDict setValue:self.email forKey:kUserEmail];
    [mutableDict setValue:[NSNumber numberWithBool:self.online] forKey:kUserOnline];
    [mutableDict setValue:self.personalUrl forKey:kUserPersonalUrl];

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

    self.userIdentifier = [aDecoder decodeDoubleForKey:kUserId];
    self.userDescription = [aDecoder decodeObjectForKey:kUserDescription];
    self.coverphoto = [aDecoder decodeObjectForKey:kUserCoverphoto];
    self.bios = [aDecoder decodeObjectForKey:kUserBios];
    self.keyAnalytics = [aDecoder decodeObjectForKey:kUserKeyAnalytics];
    self.twitterLink = [aDecoder decodeObjectForKey:kUserTwitterLink];
    self.createdAt = [aDecoder decodeObjectForKey:kUserCreatedAt];
    self.tourInfo = [aDecoder decodeObjectForKey:kUserTourInfo];
    self.domain = [aDecoder decodeObjectForKey:kUserDomain];
    self.acceptedTerms = [aDecoder decodeBoolForKey:kUserAcceptedTerms];
    self.facebookLink = [aDecoder decodeObjectForKey:kUserFacebookLink];
    self.avatar = [aDecoder decodeObjectForKey:kUserAvatar];
    self.subdomain = [aDecoder decodeObjectForKey:kUserSubdomain];
    self.firstName = [aDecoder decodeObjectForKey:kUserFirstName];
    self.updatedAt = [aDecoder decodeObjectForKey:kUserUpdatedAt];
    self.lastName = [aDecoder decodeObjectForKey:kUserLastName];
    self.email = [aDecoder decodeObjectForKey:kUserEmail];
    self.online = [aDecoder decodeBoolForKey:kUserOnline];
    self.personalUrl = [aDecoder decodeObjectForKey:kUserPersonalUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_userIdentifier forKey:kUserId];
    [aCoder encodeObject:_userDescription forKey:kUserDescription];
    [aCoder encodeObject:_coverphoto forKey:kUserCoverphoto];
    [aCoder encodeObject:_bios forKey:kUserBios];
    [aCoder encodeObject:_keyAnalytics forKey:kUserKeyAnalytics];
    [aCoder encodeObject:_twitterLink forKey:kUserTwitterLink];
    [aCoder encodeObject:_createdAt forKey:kUserCreatedAt];
    [aCoder encodeObject:_tourInfo forKey:kUserTourInfo];
    [aCoder encodeObject:_domain forKey:kUserDomain];
    [aCoder encodeBool:_acceptedTerms forKey:kUserAcceptedTerms];
    [aCoder encodeObject:_facebookLink forKey:kUserFacebookLink];
    [aCoder encodeObject:_avatar forKey:kUserAvatar];
    [aCoder encodeObject:_subdomain forKey:kUserSubdomain];
    [aCoder encodeObject:_firstName forKey:kUserFirstName];
    [aCoder encodeObject:_updatedAt forKey:kUserUpdatedAt];
    [aCoder encodeObject:_lastName forKey:kUserLastName];
    [aCoder encodeObject:_email forKey:kUserEmail];
    [aCoder encodeBool:_online forKey:kUserOnline];
    [aCoder encodeObject:_personalUrl forKey:kUserPersonalUrl];
}


@end
