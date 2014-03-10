//
//  Users.h
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Coverphoto, Avatar;

@interface Users : NSObject <NSCoding>

@property (nonatomic, assign) double usersIdentifier;
@property (nonatomic, assign) id usersDescription;
@property (nonatomic, strong) Coverphoto *coverphoto;
@property (nonatomic, strong) NSString *bios;
@property (nonatomic, strong) NSString *keyAnalytics;
@property (nonatomic, strong) NSString *twitterLink;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *tourInfo;
@property (nonatomic, strong) NSString *domain;
@property (nonatomic, assign) BOOL acceptedTerms;
@property (nonatomic, assign) id facebookLink;
@property (nonatomic, strong) Avatar *avatar;
@property (nonatomic, strong) NSString *subdomain;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, assign) BOOL online;
@property (nonatomic, strong) NSString *personalUrl;

+ (Users *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
