//
//  Publications.h
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Publication, Network;

@interface Publications : NSObject <NSCoding>

@property (nonatomic, strong) Publication *publication;
@property (nonatomic, assign) double publicationId;
@property (nonatomic, assign) double networkId;
@property (nonatomic, assign) double publicationsIdentifier;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *publicationType;
@property (nonatomic, assign) BOOL publicProperty;
@property (nonatomic, strong) NSArray *courses;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSArray *users;
@property (nonatomic, strong) Network *network;

+ (Publications *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
