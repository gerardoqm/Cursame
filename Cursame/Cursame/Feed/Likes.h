//
//  Likes.h
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Likes : NSObject <NSCoding>

@property (nonatomic, assign) double votableId;
@property (nonatomic, strong) NSString *votableType;
@property (nonatomic, assign) double likesIdentifier;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) BOOL voteFlag;
@property (nonatomic, assign) id voteScope;
@property (nonatomic, assign) double voterId;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *voterType;

+ (Likes *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
