//
// Created by Stefan on 6/4/13.
// Copyright (c) 2013 Stefan van den Oord. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface Player : NSObject
@property(nonatomic, copy) NSString *name;

@property(nonatomic) int score;

- (id)initWithName:(NSString *)name;

@end