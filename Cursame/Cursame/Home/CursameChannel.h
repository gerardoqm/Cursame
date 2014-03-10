//
//  CursameChannel.h
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CursameChannel : NSObject <NSCoding>

@property (nonatomic, strong) NSString *signature;
@property (nonatomic, strong) NSString *channel;
@property (nonatomic, assign) double timestamp;
@property (nonatomic, strong) NSString *server;

+ (CursameChannel *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
