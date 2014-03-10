//
//  Network.m
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Network.h"
#import "ImageFront.h"
#import "Logo.h"


NSString *const kNetworkId = @"id";
NSString *const kNetworkPopulation = @"population";
NSString *const kNetworkAuthenticateTeacher = @"authenticate_teacher";
NSString *const kNetworkCreatedAt = @"created_at";
NSString *const kNetworkPersonalizeDomain = @"personalize_domain";
NSString *const kNetworkImageFront = @"image_front";
NSString *const kNetworkLogoType = @"logo_type";
NSString *const kNetworkSubdomain = @"subdomain";
NSString *const kNetworkTitles = @"titles";
NSString *const kNetworkLogo = @"logo";
NSString *const kNetworkRegisterForm = @"register_form";
NSString *const kNetworkUpdatedAt = @"updated_at";
NSString *const kNetworkWelcomMessage = @"welcom_message";
NSString *const kNetworkFree = @"free";
NSString *const kNetworkName = @"name";
NSString *const kNetworkPublicRegister = @"public_register";


@interface Network ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Network

@synthesize networkIdentifier = _networkIdentifier;
@synthesize population = _population;
@synthesize authenticateTeacher = _authenticateTeacher;
@synthesize createdAt = _createdAt;
@synthesize personalizeDomain = _personalizeDomain;
@synthesize imageFront = _imageFront;
@synthesize logoType = _logoType;
@synthesize subdomain = _subdomain;
@synthesize titles = _titles;
@synthesize logo = _logo;
@synthesize registerForm = _registerForm;
@synthesize updatedAt = _updatedAt;
@synthesize welcomMessage = _welcomMessage;
@synthesize free = _free;
@synthesize name = _name;
@synthesize publicRegister = _publicRegister;


+ (Network *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Network *instance = [[Network alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.networkIdentifier = [[self objectOrNilForKey:kNetworkId fromDictionary:dict] doubleValue];
            self.population = [[self objectOrNilForKey:kNetworkPopulation fromDictionary:dict] doubleValue];
            self.authenticateTeacher = [self objectOrNilForKey:kNetworkAuthenticateTeacher fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kNetworkCreatedAt fromDictionary:dict];
            self.personalizeDomain = [self objectOrNilForKey:kNetworkPersonalizeDomain fromDictionary:dict];
            self.imageFront = [ImageFront modelObjectWithDictionary:[dict objectForKey:kNetworkImageFront]];
            self.logoType = [self objectOrNilForKey:kNetworkLogoType fromDictionary:dict];
            self.subdomain = [self objectOrNilForKey:kNetworkSubdomain fromDictionary:dict];
            self.titles = [self objectOrNilForKey:kNetworkTitles fromDictionary:dict];
            self.logo = [Logo modelObjectWithDictionary:[dict objectForKey:kNetworkLogo]];
            self.registerForm = [self objectOrNilForKey:kNetworkRegisterForm fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kNetworkUpdatedAt fromDictionary:dict];
            self.welcomMessage = [self objectOrNilForKey:kNetworkWelcomMessage fromDictionary:dict];
            self.free = [[self objectOrNilForKey:kNetworkFree fromDictionary:dict] boolValue];
            self.name = [self objectOrNilForKey:kNetworkName fromDictionary:dict];
            self.publicRegister = [[self objectOrNilForKey:kNetworkPublicRegister fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.networkIdentifier] forKey:kNetworkId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.population] forKey:kNetworkPopulation];
    [mutableDict setValue:self.authenticateTeacher forKey:kNetworkAuthenticateTeacher];
    [mutableDict setValue:self.createdAt forKey:kNetworkCreatedAt];
    [mutableDict setValue:self.personalizeDomain forKey:kNetworkPersonalizeDomain];
    [mutableDict setValue:[self.imageFront dictionaryRepresentation] forKey:kNetworkImageFront];
    [mutableDict setValue:self.logoType forKey:kNetworkLogoType];
    [mutableDict setValue:self.subdomain forKey:kNetworkSubdomain];
    [mutableDict setValue:self.titles forKey:kNetworkTitles];
    [mutableDict setValue:[self.logo dictionaryRepresentation] forKey:kNetworkLogo];
    [mutableDict setValue:self.registerForm forKey:kNetworkRegisterForm];
    [mutableDict setValue:self.updatedAt forKey:kNetworkUpdatedAt];
    [mutableDict setValue:self.welcomMessage forKey:kNetworkWelcomMessage];
    [mutableDict setValue:[NSNumber numberWithBool:self.free] forKey:kNetworkFree];
    [mutableDict setValue:self.name forKey:kNetworkName];
    [mutableDict setValue:[NSNumber numberWithBool:self.publicRegister] forKey:kNetworkPublicRegister];

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

    self.networkIdentifier = [aDecoder decodeDoubleForKey:kNetworkId];
    self.population = [aDecoder decodeDoubleForKey:kNetworkPopulation];
    self.authenticateTeacher = [aDecoder decodeObjectForKey:kNetworkAuthenticateTeacher];
    self.createdAt = [aDecoder decodeObjectForKey:kNetworkCreatedAt];
    self.personalizeDomain = [aDecoder decodeObjectForKey:kNetworkPersonalizeDomain];
    self.imageFront = [aDecoder decodeObjectForKey:kNetworkImageFront];
    self.logoType = [aDecoder decodeObjectForKey:kNetworkLogoType];
    self.subdomain = [aDecoder decodeObjectForKey:kNetworkSubdomain];
    self.titles = [aDecoder decodeObjectForKey:kNetworkTitles];
    self.logo = [aDecoder decodeObjectForKey:kNetworkLogo];
    self.registerForm = [aDecoder decodeObjectForKey:kNetworkRegisterForm];
    self.updatedAt = [aDecoder decodeObjectForKey:kNetworkUpdatedAt];
    self.welcomMessage = [aDecoder decodeObjectForKey:kNetworkWelcomMessage];
    self.free = [aDecoder decodeBoolForKey:kNetworkFree];
    self.name = [aDecoder decodeObjectForKey:kNetworkName];
    self.publicRegister = [aDecoder decodeBoolForKey:kNetworkPublicRegister];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_networkIdentifier forKey:kNetworkId];
    [aCoder encodeDouble:_population forKey:kNetworkPopulation];
    [aCoder encodeObject:_authenticateTeacher forKey:kNetworkAuthenticateTeacher];
    [aCoder encodeObject:_createdAt forKey:kNetworkCreatedAt];
    [aCoder encodeObject:_personalizeDomain forKey:kNetworkPersonalizeDomain];
    [aCoder encodeObject:_imageFront forKey:kNetworkImageFront];
    [aCoder encodeObject:_logoType forKey:kNetworkLogoType];
    [aCoder encodeObject:_subdomain forKey:kNetworkSubdomain];
    [aCoder encodeObject:_titles forKey:kNetworkTitles];
    [aCoder encodeObject:_logo forKey:kNetworkLogo];
    [aCoder encodeObject:_registerForm forKey:kNetworkRegisterForm];
    [aCoder encodeObject:_updatedAt forKey:kNetworkUpdatedAt];
    [aCoder encodeObject:_welcomMessage forKey:kNetworkWelcomMessage];
    [aCoder encodeBool:_free forKey:kNetworkFree];
    [aCoder encodeObject:_name forKey:kNetworkName];
    [aCoder encodeBool:_publicRegister forKey:kNetworkPublicRegister];
}


@end
