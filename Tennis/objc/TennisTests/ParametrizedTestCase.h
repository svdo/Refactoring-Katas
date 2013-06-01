//
// Created by Stefan on 6/1/13.
// Copyright (c) 2013 Stefan van den Oord. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import <SenTestingKit/SenTestingKit.h>


@interface ParametrizedTestCase : SenTestCase
+ (void)addTestWithTestData:(NSArray *)testData toTestSuite:(SenTestSuite *)testSuite;
+ (NSArray *)testDataSet;
- (id)initWithInvocation:(NSInvocation *)anInvocation testData:(NSArray *)testData;
@end