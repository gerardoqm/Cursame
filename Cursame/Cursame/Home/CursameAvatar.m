//
//  CursameAvatar.m
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "CursameAvatar.h"
#import "CursameModern.h"
#import "CursameCompress.h"
#import "CursameCourseIndex.h"
#import "CursameHead.h"
#import "CursameMini.h"
#import "CursameProfile.h"


NSString *const kCursameAvatarModern = @"modern";
NSString *const kCursameAvatarCompress = @"compress";
NSString *const kCursameAvatarCourseIndex = @"course_index";
NSString *const kCursameAvatarHead = @"head";
NSString *const kCursameAvatarMini = @"mini";
NSString *const kCursameAvatarProfile = @"profile";
NSString *const kCursameAvatarUrl = @"url";


@interface CursameAvatar ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CursameAvatar

@synthesize modern = _modern;
@synthesize compress = _compress;
@synthesize courseIndex = _courseIndex;
@synthesize head = _head;
@synthesize mini = _mini;
@synthesize profile = _profile;
@synthesize url = _url;


+ (CursameAvatar *)modelObjectWithDictionary:(NSDictionary *)dict
{
    CursameAvatar *instance = [[CursameAvatar alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.modern = [CursameModern modelObjectWithDictionary:[dict objectForKey:kCursameAvatarModern]];
            self.compress = [CursameCompress modelObjectWithDictionary:[dict objectForKey:kCursameAvatarCompress]];
            self.courseIndex = [CursameCourseIndex modelObjectWithDictionary:[dict objectForKey:kCursameAvatarCourseIndex]];
            self.head = [CursameHead modelObjectWithDictionary:[dict objectForKey:kCursameAvatarHead]];
            self.mini = [CursameMini modelObjectWithDictionary:[dict objectForKey:kCursameAvatarMini]];
            self.profile = [CursameProfile modelObjectWithDictionary:[dict objectForKey:kCursameAvatarProfile]];
            self.url = [self objectOrNilForKey:kCursameAvatarUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.modern dictionaryRepresentation] forKey:kCursameAvatarModern];
    [mutableDict setValue:[self.compress dictionaryRepresentation] forKey:kCursameAvatarCompress];
    [mutableDict setValue:[self.courseIndex dictionaryRepresentation] forKey:kCursameAvatarCourseIndex];
    [mutableDict setValue:[self.head dictionaryRepresentation] forKey:kCursameAvatarHead];
    [mutableDict setValue:[self.mini dictionaryRepresentation] forKey:kCursameAvatarMini];
    [mutableDict setValue:[self.profile dictionaryRepresentation] forKey:kCursameAvatarProfile];
    [mutableDict setValue:self.url forKey:kCursameAvatarUrl];

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

    self.modern = [aDecoder decodeObjectForKey:kCursameAvatarModern];
    self.compress = [aDecoder decodeObjectForKey:kCursameAvatarCompress];
    self.courseIndex = [aDecoder decodeObjectForKey:kCursameAvatarCourseIndex];
    self.head = [aDecoder decodeObjectForKey:kCursameAvatarHead];
    self.mini = [aDecoder decodeObjectForKey:kCursameAvatarMini];
    self.profile = [aDecoder decodeObjectForKey:kCursameAvatarProfile];
    self.url = [aDecoder decodeObjectForKey:kCursameAvatarUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_modern forKey:kCursameAvatarModern];
    [aCoder encodeObject:_compress forKey:kCursameAvatarCompress];
    [aCoder encodeObject:_courseIndex forKey:kCursameAvatarCourseIndex];
    [aCoder encodeObject:_head forKey:kCursameAvatarHead];
    [aCoder encodeObject:_mini forKey:kCursameAvatarMini];
    [aCoder encodeObject:_profile forKey:kCursameAvatarProfile];
    [aCoder encodeObject:_url forKey:kCursameAvatarUrl];
}


@end
