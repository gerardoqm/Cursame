//
//  Likes.m
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Likes.h"


NSString *const kLikesVotableId = @"votable_id";
NSString *const kLikesVotableType = @"votable_type";
NSString *const kLikesId = @"id";
NSString *const kLikesCreatedAt = @"created_at";
NSString *const kLikesVoteFlag = @"vote_flag";
NSString *const kLikesVoteScope = @"vote_scope";
NSString *const kLikesVoterId = @"voter_id";
NSString *const kLikesUpdatedAt = @"updated_at";
NSString *const kLikesVoterType = @"voter_type";


@interface Likes ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Likes

@synthesize votableId = _votableId;
@synthesize votableType = _votableType;
@synthesize likesIdentifier = _likesIdentifier;
@synthesize createdAt = _createdAt;
@synthesize voteFlag = _voteFlag;
@synthesize voteScope = _voteScope;
@synthesize voterId = _voterId;
@synthesize updatedAt = _updatedAt;
@synthesize voterType = _voterType;


+ (Likes *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Likes *instance = [[Likes alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.votableId = [[self objectOrNilForKey:kLikesVotableId fromDictionary:dict] doubleValue];
            self.votableType = [self objectOrNilForKey:kLikesVotableType fromDictionary:dict];
            self.likesIdentifier = [[self objectOrNilForKey:kLikesId fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kLikesCreatedAt fromDictionary:dict];
            self.voteFlag = [[self objectOrNilForKey:kLikesVoteFlag fromDictionary:dict] boolValue];
            self.voteScope = [self objectOrNilForKey:kLikesVoteScope fromDictionary:dict];
            self.voterId = [[self objectOrNilForKey:kLikesVoterId fromDictionary:dict] doubleValue];
            self.updatedAt = [self objectOrNilForKey:kLikesUpdatedAt fromDictionary:dict];
            self.voterType = [self objectOrNilForKey:kLikesVoterType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.votableId] forKey:kLikesVotableId];
    [mutableDict setValue:self.votableType forKey:kLikesVotableType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likesIdentifier] forKey:kLikesId];
    [mutableDict setValue:self.createdAt forKey:kLikesCreatedAt];
    [mutableDict setValue:[NSNumber numberWithBool:self.voteFlag] forKey:kLikesVoteFlag];
    [mutableDict setValue:self.voteScope forKey:kLikesVoteScope];
    [mutableDict setValue:[NSNumber numberWithDouble:self.voterId] forKey:kLikesVoterId];
    [mutableDict setValue:self.updatedAt forKey:kLikesUpdatedAt];
    [mutableDict setValue:self.voterType forKey:kLikesVoterType];

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

    self.votableId = [aDecoder decodeDoubleForKey:kLikesVotableId];
    self.votableType = [aDecoder decodeObjectForKey:kLikesVotableType];
    self.likesIdentifier = [aDecoder decodeDoubleForKey:kLikesId];
    self.createdAt = [aDecoder decodeObjectForKey:kLikesCreatedAt];
    self.voteFlag = [aDecoder decodeBoolForKey:kLikesVoteFlag];
    self.voteScope = [aDecoder decodeObjectForKey:kLikesVoteScope];
    self.voterId = [aDecoder decodeDoubleForKey:kLikesVoterId];
    self.updatedAt = [aDecoder decodeObjectForKey:kLikesUpdatedAt];
    self.voterType = [aDecoder decodeObjectForKey:kLikesVoterType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_votableId forKey:kLikesVotableId];
    [aCoder encodeObject:_votableType forKey:kLikesVotableType];
    [aCoder encodeDouble:_likesIdentifier forKey:kLikesId];
    [aCoder encodeObject:_createdAt forKey:kLikesCreatedAt];
    [aCoder encodeBool:_voteFlag forKey:kLikesVoteFlag];
    [aCoder encodeObject:_voteScope forKey:kLikesVoteScope];
    [aCoder encodeDouble:_voterId forKey:kLikesVoterId];
    [aCoder encodeObject:_updatedAt forKey:kLikesUpdatedAt];
    [aCoder encodeObject:_voterType forKey:kLikesVoterType];
}


@end
