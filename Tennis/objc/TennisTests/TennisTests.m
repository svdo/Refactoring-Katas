#import <SenTestingKit/SenTestingKit.h>
#import "TennisTests.h"
#import "TennisGame1.h"
#import "TennisGame2.h"
#import "TennisGame3.h"

@interface TennisTests()
@property(nonatomic, readonly) int player1Score;
@property(nonatomic, readonly) int player2Score;
@property(nonatomic, readonly) NSString *expectedScore;
@end

@implementation TennisTests

+ (NSArray*)testDataSet {
    return @[
            @[ @0, @0, @"Love-All"],
            @[ @1, @1, @"Fifteen-All"],
            @[ @2, @2, @"Thirty-All"],
            @[ @3, @3, @"Forty-All"],
            @[ @4, @4, @"Deuce"],

            @[ @1, @0, @"Fifteen-Love"],
            @[ @0, @1, @"Love-Fifteen"],
            @[ @2, @0, @"Thirty-Love"],
            @[ @0, @2, @"Love-Thirty"],
            @[ @3, @0, @"Forty-Love"],
            @[ @0, @3, @"Love-Forty"],
            @[ @4, @0, @"Win for player1"],
            @[ @0, @4, @"Win for player2"],

            @[ @2, @1, @"Thirty-Fifteen"],
            @[ @1, @2, @"Fifteen-Thirty"],
            @[ @3, @1, @"Forty-Fifteen"],
            @[ @1, @3, @"Fifteen-Forty"],
            @[ @4, @1, @"Win for player1"],
            @[ @1, @4, @"Win for player2"],

            @[ @3, @2, @"Forty-Thirty"],
            @[ @2, @3, @"Thirty-Forty"],
            @[ @4, @2, @"Win for player1"],
            @[ @2, @4, @"Win for player2"],

            @[ @4, @3, @"Advantage player1"],
            @[ @3, @4, @"Advantage player2"],
            @[ @5, @4, @"Advantage player1"],
            @[ @4, @5, @"Advantage player2"],
            @[ @15, @14, @"Advantage player1"],
            @[ @14, @15, @"Advantage player2"],

            @[ @6, @4, @"Win for player1"],
            @[ @4, @6, @"Win for player2"],
            @[ @16, @14, @"Win for player1"],
            @[ @14, @16, @"Win for player2"]
    ];
}

- (int)player1Score { return [self.testData[0] intValue]; }
- (int)player2Score { return [self.testData[1] intValue]; }
- (NSString *)expectedScore { return self.testData[2]; }

- (NSString *)descriptionOfTestDataInTestName:(NSArray *)testData {
    return [NSString stringWithFormat:@" (%d,%d,%@)", self.player1Score, self.player2Score, self.expectedScore];
}

- (void)checkAllScoresForGame:(TennisGame *)game {
    int highestScore = MAX(self.player1Score, self.player2Score);
    for (int i = 0; i < highestScore; i++) {
        if (i < self.player1Score)
            [game wonPoint:@"player1"];
        if (i < self.player2Score)
            [game wonPoint:@"player2"];
    }
    STAssertEqualObjects([game score], self.expectedScore, @"");
}

- (void)testAllScoresTennisGame1 {
    TennisGame1 * game = [[TennisGame1 alloc] initWithPlayer1:@"player1" player2:@"player2"];
    [self checkAllScoresForGame:game];
}

- (void)testAllScoresTennisGame2 {
    TennisGame2 * game = [[TennisGame2 alloc] initWithPlayer1:@"player1" player2:@"player2"];
    [self checkAllScoresForGame:game];
}

- (void)testAllScoresTennisGame3 {
    TennisGame3 * game = [[TennisGame3 alloc] initWithPlayer1:@"player1" player2:@"player2"];
    [self checkAllScoresForGame:game];
}

@end
