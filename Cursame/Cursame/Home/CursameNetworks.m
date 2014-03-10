//
//  CursameNetworks.m
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "CursameNetworks.h"
#import "CursameImageFront.h"
#import "CursameLogo.h"


NSString *const kCursameNetworksId = @"id";
NSString *const kCursameNetworksPopulation = @"population";
NSString *const kCursameNetworksAuthenticateTeacher = @"authenticate_teacher";
NSString *const kCursameNetworksCreatedAt = @"created_at";
NSString *const kCursameNetworksPersonalizeDomain = @"personalize_domain";
NSString *const kCursameNetworksImageFront = @"image_front";
NSString *const kCursameNetworksLogoType = @"logo_type";
NSString *const kCursameNetworksSubdomain = @"subdomain";
NSString *const kCursameNetworksTitles = @"titles";
NSString *const kCursameNetworksLogo = @"logo";
NSString *const kCursameNetworksRegisterForm = @"register_form";
NSString *const kCursameNetworksUpdatedAt = @"updated_at";
NSString *const kCursameNetworksWelcomMessage = @"welcom_message";
NSString *const kCursameNetworksFree = @"free";
NSString *const kCursameNetworksName = @"name";
NSString *const kCursameNetworksPublicRegister = @"public_register";


@interface CursameNetworks ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CursameNetworks

@synthesize networksIdentifier = _networksIdentifier;
@synthesize population = _population;
@synthesize authenticateTeacher = _authenticateTeacher;
@synthesize createdAt = _createdAt;
@synthesize personalizeDomain = _personalizeDomain;
@synthesize imageFront = _imageFront;
@synthesize logoType = _logoType;
@synthesize subdomain = _subdomain;
@synthesize titles = _titles;
//@synthesize logo = _logo;
@synthesize registerForm = _registerForm;
@synthesize updatedAt = _updatedAt;
@synthesize welcomMessage = _welcomMessage;
@synthesize free = _free;
@synthesize name = _name;
@synthesize publicRegister = _publicRegister;


+ (CursameNetworks *)modelObjectWithDictionary:(NSDictionary *)dict
{
    CursameNetworks *instance = [[CursameNetworks alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.networksIdentifier = [[self objectOrNilForKey:kCursameNetworksId fromDictionary:dict] doubleValue];
            self.population = [[self objectOrNilForKey:kCursameNetworksPopulation fromDictionary:dict] doubleValue];
            self.authenticateTeacher = [self objectOrNilForKey:kCursameNetworksAuthenticateTeacher fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kCursameNetworksCreatedAt fromDictionary:dict];
            self.personalizeDomain = [self objectOrNilForKey:kCursameNetworksPersonalizeDomain fromDictionary:dict];
            self.imageFront = [CursameImageFront modelObjectWithDictionary:[dict objectForKey:kCursameNetworksImageFront]];
            self.logoType = [self objectOrNilForKey:kCursameNetworksLogoType fromDictionary:dict];
            self.subdomain = [self objectOrNilForKey:kCursameNetworksSubdomain fromDictionary:dict];
            self.titles = [self objectOrNilForKey:kCursameNetworksTitles fromDictionary:dict];
            //self.logo = [CursameLogo modelObjectWithDictionary:[dict objectForKey:kCursameNetworksLogo]];
            self.registerForm = [self objectOrNilForKey:kCursameNetworksRegisterForm fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kCursameNetworksUpdatedAt fromDictionary:dict];
            self.welcomMessage = [self objectOrNilForKey:kCursameNetworksWelcomMessage fromDictionary:dict];
            self.free = [[self objectOrNilForKey:kCursameNetworksFree fromDictionary:dict] boolValue];
            self.name = [self objectOrNilForKey:kCursameNetworksName fromDictionary:dict];
            self.publicRegister = [[self objectOrNilForKey:kCursameNetworksPublicRegister fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.networksIdentifier] forKey:kCursameNetworksId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.population] forKey:kCursameNetworksPopulation];
    [mutableDict setValue:self.authenticateTeacher forKey:kCursameNetworksAuthenticateTeacher];
    [mutableDict setValue:self.createdAt forKey:kCursameNetworksCreatedAt];
    [mutableDict setValue:self.personalizeDomain forKey:kCursameNetworksPersonalizeDomain];
    [mutableDict setValue:[self.imageFront dictionaryRepresentation] forKey:kCursameNetworksImageFront];
    [mutableDict setValue:self.logoType forKey:kCursameNetworksLogoType];
    [mutableDict setValue:self.subdomain forKey:kCursameNetworksSubdomain];
    [mutableDict setValue:self.titles forKey:kCursameNetworksTitles];
    //[mutableDict setValue:[self.logo dictionaryRepresentation] forKey:kCursameNetworksLogo];
    [mutableDict setValue:self.registerForm forKey:kCursameNetworksRegisterForm];
    [mutableDict setValue:self.updatedAt forKey:kCursameNetworksUpdatedAt];
    [mutableDict setValue:self.welcomMessage forKey:kCursameNetworksWelcomMessage];
    [mutableDict setValue:[NSNumber numberWithBool:self.free] forKey:kCursameNetworksFree];
    [mutableDict setValue:self.name forKey:kCursameNetworksName];
    [mutableDict setValue:[NSNumber numberWithBool:self.publicRegister] forKey:kCursameNetworksPublicRegister];

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

    self.networksIdentifier = [aDecoder decodeDoubleForKey:kCursameNetworksId];
    self.population = [aDecoder decodeDoubleForKey:kCursameNetworksPopulation];
    self.authenticateTeacher = [aDecoder decodeObjectForKey:kCursameNetworksAuthenticateTeacher];
    self.createdAt = [aDecoder decodeObjectForKey:kCursameNetworksCreatedAt];
    self.personalizeDomain = [aDecoder decodeObjectForKey:kCursameNetworksPersonalizeDomain];
    self.imageFront = [aDecoder decodeObjectForKey:kCursameNetworksImageFront];
    self.logoType = [aDecoder decodeObjectForKey:kCursameNetworksLogoType];
    self.subdomain = [aDecoder decodeObjectForKey:kCursameNetworksSubdomain];
    self.titles = [aDecoder decodeObjectForKey:kCursameNetworksTitles];
    //self.logo = [aDecoder decodeObjectForKey:kCursameNetworksLogo];
    self.registerForm = [aDecoder decodeObjectForKey:kCursameNetworksRegisterForm];
    self.updatedAt = [aDecoder decodeObjectForKey:kCursameNetworksUpdatedAt];
    self.welcomMessage = [aDecoder decodeObjectForKey:kCursameNetworksWelcomMessage];
    self.free = [aDecoder decodeBoolForKey:kCursameNetworksFree];
    self.name = [aDecoder decodeObjectForKey:kCursameNetworksName];
    self.publicRegister = [aDecoder decodeBoolForKey:kCursameNetworksPublicRegister];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_networksIdentifier forKey:kCursameNetworksId];
    [aCoder encodeDouble:_population forKey:kCursameNetworksPopulation];
    [aCoder encodeObject:_authenticateTeacher forKey:kCursameNetworksAuthenticateTeacher];
    [aCoder encodeObject:_createdAt forKey:kCursameNetworksCreatedAt];
    [aCoder encodeObject:_personalizeDomain forKey:kCursameNetworksPersonalizeDomain];
    [aCoder encodeObject:_imageFront forKey:kCursameNetworksImageFront];
    [aCoder encodeObject:_logoType forKey:kCursameNetworksLogoType];
    [aCoder encodeObject:_subdomain forKey:kCursameNetworksSubdomain];
    [aCoder encodeObject:_titles forKey:kCursameNetworksTitles];
    //[aCoder encodeObject:_logo forKey:kCursameNetworksLogo];
    [aCoder encodeObject:_registerForm forKey:kCursameNetworksRegisterForm];
    [aCoder encodeObject:_updatedAt forKey:kCursameNetworksUpdatedAt];
    [aCoder encodeObject:_welcomMessage forKey:kCursameNetworksWelcomMessage];
    [aCoder encodeBool:_free forKey:kCursameNetworksFree];
    [aCoder encodeObject:_name forKey:kCursameNetworksName];
    [aCoder encodeBool:_publicRegister forKey:kCursameNetworksPublicRegister];
}


@end
