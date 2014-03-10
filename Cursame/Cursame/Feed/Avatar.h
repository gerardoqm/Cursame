//
//  Avatar.h
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Modern, Compress, CourseIndex, Head, Mini, Profile;

@interface Avatar : NSObject <NSCoding>

@property (nonatomic, strong) Modern *modern;
@property (nonatomic, strong) Compress *compress;
@property (nonatomic, strong) CourseIndex *courseIndex;
@property (nonatomic, strong) Head *head;
@property (nonatomic, strong) Mini *mini;
@property (nonatomic, strong) Profile *profile;
@property (nonatomic, strong) NSString *url;

+ (Avatar *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
