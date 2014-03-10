//
//  CursameNetworks.h
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CursameImageFront;//, CursameLogo;

@interface CursameNetworks : NSObject <NSCoding>

@property (nonatomic, assign) double networksIdentifier;
@property (nonatomic, assign) double population;
@property (nonatomic, assign) id authenticateTeacher;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) id personalizeDomain;
@property (nonatomic, strong) CursameImageFront *imageFront;
@property (nonatomic, assign) id logoType;
@property (nonatomic, strong) NSString *subdomain;
@property (nonatomic, strong) NSString *titles;
//@property (nonatomic, strong) CursameLogo *logo;
@property (nonatomic, assign) id registerForm;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, assign) id welcomMessage;
@property (nonatomic, assign) BOOL free;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) BOOL publicRegister;

+ (CursameNetworks *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
