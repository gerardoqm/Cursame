//
//  CursameUser.h
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CursameCoverphoto, CursameAvatar;

@interface CursameUser : NSObject <NSCoding>

@property (nonatomic, assign) id userDescription;
@property (nonatomic, strong) NSString *twitterLink;
@property (nonatomic, assign) BOOL acceptedTerms;
@property (nonatomic, strong) NSString *bios;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSArray *notifications;
@property (nonatomic, strong) NSArray *networks;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, assign) id facebookLink;
@property (nonatomic, strong) NSString *domain;
@property (nonatomic, assign) double userIdentifier;
@property (nonatomic, strong) CursameCoverphoto *coverphoto;
@property (nonatomic, strong) NSArray *roles;
@property (nonatomic, strong) NSString *personalUrl;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) CursameAvatar *avatar;
@property (nonatomic, strong) NSString *subdomain;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *tourInfo;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, assign) BOOL online;
@property (nonatomic, strong) NSString *keyAnalytics;

+ (CursameUser *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
