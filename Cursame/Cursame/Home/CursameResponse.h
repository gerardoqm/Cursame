//
//  CursameResponse.h
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CursameChannel, CursameUser;

@interface CursameResponse : NSObject <NSCoding>

@property (nonatomic, assign) BOOL success;
@property (nonatomic, strong) CursameChannel *channel;
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) CursameUser *user;

+ (CursameResponse *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
