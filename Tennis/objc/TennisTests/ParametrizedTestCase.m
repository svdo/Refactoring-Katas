//
// Created by Stefan on 6/1/13.
// Copyright (c) 2013 Stefan van den Oord. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "TennisTests.h"
#import <SenTestingKit/SenTestingKit.h>
#import "ParametrizedTestCase.h"


@implementation ParametrizedTestCase

+ (id)defaultTestSuite {
    SenTestSuite *testSuite = [[SenTestSuite alloc] initWithName:NSStringFromClass(self)];

    NSArray *testDataSet = [self testDataSet];
    if (!testDataSet) return nil;

    for (NSArray *testData in testDataSet) {
        [ParametrizedTestCase addTestWithTestData:testData toTestSuite:testSuite];
    }

    return testSuite;
}

+ (void)addTestWithTestData:(NSArray *)testData toTestSuite:(SenTestSuite *)testSuite {
    NSString * testClassName = [testSuite name];
    Class testClass = NSClassFromString(testClassName);
    NSArray *testInvocations = [testClass testInvocations];
    for (NSInvocation *testInvocation in testInvocations) {
        SenTestCase *test = [[TennisTests alloc] initWithInvocation:testInvocation testData:testData];
        [testSuite addTest:test];
    }
}

+ (NSArray *)testDataSet {
    return nil;
}

- (id)initWithInvocation:(NSInvocation *)anInvocation testData:(NSArray *)testData {
    self.testData = testData;
    return [super initWithInvocation:anInvocation];
}

- (NSString *)name {
    NSString * testDataDescription = [self descriptionOfTestDataInTestName:self.testData];
    if (!testDataDescription) return [super name];

    NSString *parametersDescription = [NSString stringWithFormat:@"%@]", testDataDescription];
    return [[super name] stringByReplacingOccurrencesOfString:@"]" withString:parametersDescription];
}

- (NSString *)descriptionOfTestDataInTestName:(NSArray *)testData {
    return nil;
}

@end