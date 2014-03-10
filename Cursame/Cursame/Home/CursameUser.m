//
//  CursameUser.m
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "CursameUser.h"
#import "CursameNotifications.h"
#import "CursameNetworks.h"
#import "CursameCoverphoto.h"
#import "CursameRoles.h"
#import "CursameAvatar.h"


NSString *const kCursameUserDescription = @"description";
NSString *const kCursameUserTwitterLink = @"twitter_link";
NSString *const kCursameUserAcceptedTerms = @"accepted_terms";
NSString *const kCursameUserBios = @"bios";
NSString *const kCursameUserUpdatedAt = @"updated_at";
NSString *const kCursameUserNotifications = @"notifications";
NSString *const kCursameUserNetworks = @"networks";
NSString *const kCursameUserLastName = @"last_name";
NSString *const kCursameUserFacebookLink = @"facebook_link";
NSString *const kCursameUserDomain = @"domain";
NSString *const kCursameUserId = @"id";
NSString *const kCursameUserCoverphoto = @"coverphoto";
NSString *const kCursameUserRoles = @"roles";
NSString *const kCursameUserPersonalUrl = @"personal_url";
NSString *const kCursameUserEmail = @"email";
NSString *const kCursameUserAvatar = @"avatar";
NSString *const kCursameUserSubdomain = @"subdomain";
NSString *const kCursameUserCreatedAt = @"created_at";
NSString *const kCursameUserTourInfo = @"tour_info";
NSString *const kCursameUserFirstName = @"first_name";
NSString *const kCursameUserOnline = @"online";
NSString *const kCursameUserKeyAnalytics = @"key_analytics";


@interface CursameUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CursameUser

@synthesize userDescription = _userDescription;
@synthesize twitterLink = _twitterLink;
@synthesize acceptedTerms = _acceptedTerms;
@synthesize bios = _bios;
@synthesize updatedAt = _updatedAt;
@synthesize notifications = _notifications;
@synthesize networks = _networks;
@synthesize lastName = _lastName;
@synthesize facebookLink = _facebookLink;
@synthesize domain = _domain;
@synthesize userIdentifier = _userIdentifier;
@synthesize coverphoto = _coverphoto;
@synthesize roles = _roles;
@synthesize personalUrl = _personalUrl;
@synthesize email = _email;
@synthesize avatar = _avatar;
@synthesize subdomain = _subdomain;
@synthesize createdAt = _createdAt;
@synthesize tourInfo = _tourInfo;
@synthesize firstName = _firstName;
@synthesize online = _online;
@synthesize keyAnalytics = _keyAnalytics;


+ (CursameUser *)modelObjectWithDictionary:(NSDictionary *)dict
{
    CursameUser *instance = [[CursameUser alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.userDescription = [self objectOrNilForKey:kCursameUserDescription fromDictionary:dict];
            self.twitterLink = [self objectOrNilForKey:kCursameUserTwitterLink fromDictionary:dict];
            self.acceptedTerms = [[self objectOrNilForKey:kCursameUserAcceptedTerms fromDictionary:dict] boolValue];
            self.bios = [self objectOrNilForKey:kCursameUserBios fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kCursameUserUpdatedAt fromDictionary:dict];
    NSObject *receivedCursameNotifications = [dict objectForKey:kCursameUserNotifications];
    NSMutableArray *parsedCursameNotifications = [NSMutableArray array];
    if ([receivedCursameNotifications isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCursameNotifications) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCursameNotifications addObject:[CursameNotifications modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCursameNotifications isKindOfClass:[NSDictionary class]]) {
       [parsedCursameNotifications addObject:[CursameNotifications modelObjectWithDictionary:(NSDictionary *)receivedCursameNotifications]];
    }

    self.notifications = [NSArray arrayWithArray:parsedCursameNotifications];
    NSObject *receivedCursameNetworks = [dict objectForKey:kCursameUserNetworks];
    NSMutableArray *parsedCursameNetworks = [NSMutableArray array];
    if ([receivedCursameNetworks isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCursameNetworks) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCursameNetworks addObject:[CursameNetworks modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCursameNetworks isKindOfClass:[NSDictionary class]]) {
       [parsedCursameNetworks addObject:[CursameNetworks modelObjectWithDictionary:(NSDictionary *)receivedCursameNetworks]];
    }

    self.networks = [NSArray arrayWithArray:parsedCursameNetworks];
            self.lastName = [self objectOrNilForKey:kCursameUserLastName fromDictionary:dict];
            self.facebookLink = [self objectOrNilForKey:kCursameUserFacebookLink fromDictionary:dict];
            self.domain = [self objectOrNilForKey:kCursameUserDomain fromDictionary:dict];
            self.userIdentifier = [[self objectOrNilForKey:kCursameUserId fromDictionary:dict] doubleValue];
            self.coverphoto = [CursameCoverphoto modelObjectWithDictionary:[dict objectForKey:kCursameUserCoverphoto]];
    NSObject *receivedCursameRoles = [dict objectForKey:kCursameUserRoles];
    NSMutableArray *parsedCursameRoles = [NSMutableArray array];
    if ([receivedCursameRoles isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCursameRoles) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCursameRoles addObject:[CursameRoles modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCursameRoles isKindOfClass:[NSDictionary class]]) {
       [parsedCursameRoles addObject:[CursameRoles modelObjectWithDictionary:(NSDictionary *)receivedCursameRoles]];
    }

    self.roles = [NSArray arrayWithArray:parsedCursameRoles];
            self.personalUrl = [self objectOrNilForKey:kCursameUserPersonalUrl fromDictionary:dict];
            self.email = [self objectOrNilForKey:kCursameUserEmail fromDictionary:dict];
            self.avatar = [CursameAvatar modelObjectWithDictionary:[dict objectForKey:kCursameUserAvatar]];
            self.subdomain = [self objectOrNilForKey:kCursameUserSubdomain fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kCursameUserCreatedAt fromDictionary:dict];
            self.tourInfo = [self objectOrNilForKey:kCursameUserTourInfo fromDictionary:dict];
            self.firstName = [self objectOrNilForKey:kCursameUserFirstName fromDictionary:dict];
            self.online = [[self objectOrNilForKey:kCursameUserOnline fromDictionary:dict] boolValue];
            self.keyAnalytics = [self objectOrNilForKey:kCursameUserKeyAnalytics fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.userDescription forKey:kCursameUserDescription];
    [mutableDict setValue:self.twitterLink forKey:kCursameUserTwitterLink];
    [mutableDict setValue:[NSNumber numberWithBool:self.acceptedTerms] forKey:kCursameUserAcceptedTerms];
    [mutableDict setValue:self.bios forKey:kCursameUserBios];
    [mutableDict setValue:self.updatedAt forKey:kCursameUserUpdatedAt];
NSMutableArray *tempArrayForNotifications = [NSMutableArray array];
    for (NSObject *subArrayObject in self.notifications) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForNotifications addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForNotifications addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForNotifications] forKey:@"kCursameUserNotifications"];
NSMutableArray *tempArrayForNetworks = [NSMutableArray array];
    for (NSObject *subArrayObject in self.networks) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForNetworks addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForNetworks addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForNetworks] forKey:@"kCursameUserNetworks"];
    [mutableDict setValue:self.lastName forKey:kCursameUserLastName];
    [mutableDict setValue:self.facebookLink forKey:kCursameUserFacebookLink];
    [mutableDict setValue:self.domain forKey:kCursameUserDomain];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdentifier] forKey:kCursameUserId];
    [mutableDict setValue:[self.coverphoto dictionaryRepresentation] forKey:kCursameUserCoverphoto];
NSMutableArray *tempArrayForRoles = [NSMutableArray array];
    for (NSObject *subArrayObject in self.roles) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForRoles addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForRoles addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRoles] forKey:@"kCursameUserRoles"];
    [mutableDict setValue:self.personalUrl forKey:kCursameUserPersonalUrl];
    [mutableDict setValue:self.email forKey:kCursameUserEmail];
    [mutableDict setValue:[self.avatar dictionaryRepresentation] forKey:kCursameUserAvatar];
    [mutableDict setValue:self.subdomain forKey:kCursameUserSubdomain];
    [mutableDict setValue:self.createdAt forKey:kCursameUserCreatedAt];
    [mutableDict setValue:self.tourInfo forKey:kCursameUserTourInfo];
    [mutableDict setValue:self.firstName forKey:kCursameUserFirstName];
    [mutableDict setValue:[NSNumber numberWithBool:self.online] forKey:kCursameUserOnline];
    [mutableDict setValue:self.keyAnalytics forKey:kCursameUserKeyAnalytics];

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

    self.userDescription = [aDecoder decodeObjectForKey:kCursameUserDescription];
    self.twitterLink = [aDecoder decodeObjectForKey:kCursameUserTwitterLink];
    self.acceptedTerms = [aDecoder decodeBoolForKey:kCursameUserAcceptedTerms];
    self.bios = [aDecoder decodeObjectForKey:kCursameUserBios];
    self.updatedAt = [aDecoder decodeObjectForKey:kCursameUserUpdatedAt];
    self.notifications = [aDecoder decodeObjectForKey:kCursameUserNotifications];
    self.networks = [aDecoder decodeObjectForKey:kCursameUserNetworks];
    self.lastName = [aDecoder decodeObjectForKey:kCursameUserLastName];
    self.facebookLink = [aDecoder decodeObjectForKey:kCursameUserFacebookLink];
    self.domain = [aDecoder decodeObjectForKey:kCursameUserDomain];
    self.userIdentifier = [aDecoder decodeDoubleForKey:kCursameUserId];
    self.coverphoto = [aDecoder decodeObjectForKey:kCursameUserCoverphoto];
    self.roles = [aDecoder decodeObjectForKey:kCursameUserRoles];
    self.personalUrl = [aDecoder decodeObjectForKey:kCursameUserPersonalUrl];
    self.email = [aDecoder decodeObjectForKey:kCursameUserEmail];
    self.avatar = [aDecoder decodeObjectForKey:kCursameUserAvatar];
    self.subdomain = [aDecoder decodeObjectForKey:kCursameUserSubdomain];
    self.createdAt = [aDecoder decodeObjectForKey:kCursameUserCreatedAt];
    self.tourInfo = [aDecoder decodeObjectForKey:kCursameUserTourInfo];
    self.firstName = [aDecoder decodeObjectForKey:kCursameUserFirstName];
    self.online = [aDecoder decodeBoolForKey:kCursameUserOnline];
    self.keyAnalytics = [aDecoder decodeObjectForKey:kCursameUserKeyAnalytics];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_userDescription forKey:kCursameUserDescription];
    [aCoder encodeObject:_twitterLink forKey:kCursameUserTwitterLink];
    [aCoder encodeBool:_acceptedTerms forKey:kCursameUserAcceptedTerms];
    [aCoder encodeObject:_bios forKey:kCursameUserBios];
    [aCoder encodeObject:_updatedAt forKey:kCursameUserUpdatedAt];
    [aCoder encodeObject:_notifications forKey:kCursameUserNotifications];
    [aCoder encodeObject:_networks forKey:kCursameUserNetworks];
    [aCoder encodeObject:_lastName forKey:kCursameUserLastName];
    [aCoder encodeObject:_facebookLink forKey:kCursameUserFacebookLink];
    [aCoder encodeObject:_domain forKey:kCursameUserDomain];
    [aCoder encodeDouble:_userIdentifier forKey:kCursameUserId];
    [aCoder encodeObject:_coverphoto forKey:kCursameUserCoverphoto];
    [aCoder encodeObject:_roles forKey:kCursameUserRoles];
    [aCoder encodeObject:_personalUrl forKey:kCursameUserPersonalUrl];
    [aCoder encodeObject:_email forKey:kCursameUserEmail];
    [aCoder encodeObject:_avatar forKey:kCursameUserAvatar];
    [aCoder encodeObject:_subdomain forKey:kCursameUserSubdomain];
    [aCoder encodeObject:_createdAt forKey:kCursameUserCreatedAt];
    [aCoder encodeObject:_tourInfo forKey:kCursameUserTourInfo];
    [aCoder encodeObject:_firstName forKey:kCursameUserFirstName];
    [aCoder encodeBool:_online forKey:kCursameUserOnline];
    [aCoder encodeObject:_keyAnalytics forKey:kCursameUserKeyAnalytics];
}


@end
