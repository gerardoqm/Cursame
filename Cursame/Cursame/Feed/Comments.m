//
//  Comments.m
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Comments.h"
#import "Likes.h"


NSString *const kCommentsId = @"id";
NSString *const kCommentsCreatedAt = @"created_at";
NSString *const kCommentsNetwokId = @"netwok_id";
NSString *const kCommentsLikes = @"likes";
NSString *const kCommentsUserId = @"user_id";
NSString *const kCommentsComment = @"comment";
NSString *const kCommentsNetworkId = @"network_id";
NSString *const kCommentsTitle = @"title";
NSString *const kCommentsCommentableType = @"commentable_type";
NSString *const kCommentsCommentableId = @"commentable_id";
NSString *const kCommentsUpdatedAt = @"updated_at";
NSString *const kCommentsCommentHtml = @"comment_html";
NSString *const kCommentsRole = @"role";


@interface Comments ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Comments

@synthesize commentsIdentifier = _commentsIdentifier;
@synthesize createdAt = _createdAt;
@synthesize netwokId = _netwokId;
@synthesize likes = _likes;
@synthesize userId = _userId;
@synthesize comment = _comment;
@synthesize networkId = _networkId;
@synthesize title = _title;
@synthesize commentableType = _commentableType;
@synthesize commentableId = _commentableId;
@synthesize updatedAt = _updatedAt;
@synthesize commentHtml = _commentHtml;
@synthesize role = _role;


+ (Comments *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Comments *instance = [[Comments alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.commentsIdentifier = [[self objectOrNilForKey:kCommentsId fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kCommentsCreatedAt fromDictionary:dict];
            self.netwokId = [self objectOrNilForKey:kCommentsNetwokId fromDictionary:dict];
    NSObject *receivedLikes = [dict objectForKey:kCommentsLikes];
    NSMutableArray *parsedLikes = [NSMutableArray array];
    if ([receivedLikes isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLikes) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLikes addObject:[Likes modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLikes isKindOfClass:[NSDictionary class]]) {
       [parsedLikes addObject:[Likes modelObjectWithDictionary:(NSDictionary *)receivedLikes]];
    }

    self.likes = [NSArray arrayWithArray:parsedLikes];
            self.userId = [[self objectOrNilForKey:kCommentsUserId fromDictionary:dict] doubleValue];
            self.comment = [self objectOrNilForKey:kCommentsComment fromDictionary:dict];
            self.networkId = [[self objectOrNilForKey:kCommentsNetworkId fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kCommentsTitle fromDictionary:dict];
            self.commentableType = [self objectOrNilForKey:kCommentsCommentableType fromDictionary:dict];
            self.commentableId = [[self objectOrNilForKey:kCommentsCommentableId fromDictionary:dict] doubleValue];
            self.updatedAt = [self objectOrNilForKey:kCommentsUpdatedAt fromDictionary:dict];
            self.commentHtml = [self objectOrNilForKey:kCommentsCommentHtml fromDictionary:dict];
            self.role = [self objectOrNilForKey:kCommentsRole fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsIdentifier] forKey:kCommentsId];
    [mutableDict setValue:self.createdAt forKey:kCommentsCreatedAt];
    [mutableDict setValue:self.netwokId forKey:kCommentsNetwokId];
NSMutableArray *tempArrayForLikes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.likes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLikes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLikes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLikes] forKey:@"kCommentsLikes"];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kCommentsUserId];
    [mutableDict setValue:self.comment forKey:kCommentsComment];
    [mutableDict setValue:[NSNumber numberWithDouble:self.networkId] forKey:kCommentsNetworkId];
    [mutableDict setValue:self.title forKey:kCommentsTitle];
    [mutableDict setValue:self.commentableType forKey:kCommentsCommentableType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentableId] forKey:kCommentsCommentableId];
    [mutableDict setValue:self.updatedAt forKey:kCommentsUpdatedAt];
    [mutableDict setValue:self.commentHtml forKey:kCommentsCommentHtml];
    [mutableDict setValue:self.role forKey:kCommentsRole];

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

    self.commentsIdentifier = [aDecoder decodeDoubleForKey:kCommentsId];
    self.createdAt = [aDecoder decodeObjectForKey:kCommentsCreatedAt];
    self.netwokId = [aDecoder decodeObjectForKey:kCommentsNetwokId];
    self.likes = [aDecoder decodeObjectForKey:kCommentsLikes];
    self.userId = [aDecoder decodeDoubleForKey:kCommentsUserId];
    self.comment = [aDecoder decodeObjectForKey:kCommentsComment];
    self.networkId = [aDecoder decodeDoubleForKey:kCommentsNetworkId];
    self.title = [aDecoder decodeObjectForKey:kCommentsTitle];
    self.commentableType = [aDecoder decodeObjectForKey:kCommentsCommentableType];
    self.commentableId = [aDecoder decodeDoubleForKey:kCommentsCommentableId];
    self.updatedAt = [aDecoder decodeObjectForKey:kCommentsUpdatedAt];
    self.commentHtml = [aDecoder decodeObjectForKey:kCommentsCommentHtml];
    self.role = [aDecoder decodeObjectForKey:kCommentsRole];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_commentsIdentifier forKey:kCommentsId];
    [aCoder encodeObject:_createdAt forKey:kCommentsCreatedAt];
    [aCoder encodeObject:_netwokId forKey:kCommentsNetwokId];
    [aCoder encodeObject:_likes forKey:kCommentsLikes];
    [aCoder encodeDouble:_userId forKey:kCommentsUserId];
    [aCoder encodeObject:_comment forKey:kCommentsComment];
    [aCoder encodeDouble:_networkId forKey:kCommentsNetworkId];
    [aCoder encodeObject:_title forKey:kCommentsTitle];
    [aCoder encodeObject:_commentableType forKey:kCommentsCommentableType];
    [aCoder encodeDouble:_commentableId forKey:kCommentsCommentableId];
    [aCoder encodeObject:_updatedAt forKey:kCommentsUpdatedAt];
    [aCoder encodeObject:_commentHtml forKey:kCommentsCommentHtml];
    [aCoder encodeObject:_role forKey:kCommentsRole];
}


@end
