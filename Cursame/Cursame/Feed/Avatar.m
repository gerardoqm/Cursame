//
//  Avatar.m
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Avatar.h"
#import "Modern.h"
#import "Compress.h"
#import "CourseIndex.h"
#import "Head.h"
#import "Mini.h"
#import "Profile.h"


NSString *const kAvatarModern = @"modern";
NSString *const kAvatarCompress = @"compress";
NSString *const kAvatarCourseIndex = @"course_index";
NSString *const kAvatarHead = @"head";
NSString *const kAvatarMini = @"mini";
NSString *const kAvatarProfile = @"profile";
NSString *const kAvatarUrl = @"url";


@interface Avatar ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Avatar

@synthesize modern = _modern;
@synthesize compress = _compress;
@synthesize courseIndex = _courseIndex;
@synthesize head = _head;
@synthesize mini = _mini;
@synthesize profile = _profile;
@synthesize url = _url;


+ (Avatar *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Avatar *instance = [[Avatar alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.modern = [Modern modelObjectWithDictionary:[dict objectForKey:kAvatarModern]];
            self.compress = [Compress modelObjectWithDictionary:[dict objectForKey:kAvatarCompress]];
            self.courseIndex = [CourseIndex modelObjectWithDictionary:[dict objectForKey:kAvatarCourseIndex]];
            self.head = [Head modelObjectWithDictionary:[dict objectForKey:kAvatarHead]];
            self.mini = [Mini modelObjectWithDictionary:[dict objectForKey:kAvatarMini]];
            self.profile = [Profile modelObjectWithDictionary:[dict objectForKey:kAvatarProfile]];
            self.url = [self objectOrNilForKey:kAvatarUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.modern dictionaryRepresentation] forKey:kAvatarModern];
    [mutableDict setValue:[self.compress dictionaryRepresentation] forKey:kAvatarCompress];
    [mutableDict setValue:[self.courseIndex dictionaryRepresentation] forKey:kAvatarCourseIndex];
    [mutableDict setValue:[self.head dictionaryRepresentation] forKey:kAvatarHead];
    [mutableDict setValue:[self.mini dictionaryRepresentation] forKey:kAvatarMini];
    [mutableDict setValue:[self.profile dictionaryRepresentation] forKey:kAvatarProfile];
    [mutableDict setValue:self.url forKey:kAvatarUrl];

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

    self.modern = [aDecoder decodeObjectForKey:kAvatarModern];
    self.compress = [aDecoder decodeObjectForKey:kAvatarCompress];
    self.courseIndex = [aDecoder decodeObjectForKey:kAvatarCourseIndex];
    self.head = [aDecoder decodeObjectForKey:kAvatarHead];
    self.mini = [aDecoder decodeObjectForKey:kAvatarMini];
    self.profile = [aDecoder decodeObjectForKey:kAvatarProfile];
    self.url = [aDecoder decodeObjectForKey:kAvatarUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_modern forKey:kAvatarModern];
    [aCoder encodeObject:_compress forKey:kAvatarCompress];
    [aCoder encodeObject:_courseIndex forKey:kAvatarCourseIndex];
    [aCoder encodeObject:_head forKey:kAvatarHead];
    [aCoder encodeObject:_mini forKey:kAvatarMini];
    [aCoder encodeObject:_profile forKey:kAvatarProfile];
    [aCoder encodeObject:_url forKey:kAvatarUrl];
}


@end
