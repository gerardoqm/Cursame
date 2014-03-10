//
//  CursameAvatar.h
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CursameModern, CursameCompress, CursameCourseIndex, CursameHead, CursameMini, CursameProfile;

@interface CursameAvatar : NSObject <NSCoding>

@property (nonatomic, strong) CursameModern *modern;
@property (nonatomic, strong) CursameCompress *compress;
@property (nonatomic, strong) CursameCourseIndex *courseIndex;
@property (nonatomic, strong) CursameHead *head;
@property (nonatomic, strong) CursameMini *mini;
@property (nonatomic, strong) CursameProfile *profile;
@property (nonatomic, strong) NSString *url;

+ (CursameAvatar *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
