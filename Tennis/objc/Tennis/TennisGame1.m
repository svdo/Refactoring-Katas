#import "TennisGame1.h"
#import "Player.h"

@interface TennisGame1 ()
@property(nonatomic, strong) Player *player1;
@property(nonatomic, strong) Player *player2;
@end

@implementation TennisGame1 {
    int score2;
}

- (id)initWithPlayer1:(NSString *)player1name player2:(NSString *)player2name {
    self = [super init];
    if (self) {
        self.player1 = [[Player alloc] initWithName:player1name];
        self.player2 = [[Player alloc] initWithName:player2name];
        self.player1.score = 0;
        score2 = 0;
    }

    return self;
}

- (void)wonPoint:(NSString *)playerName {
    if ([playerName isEqualToString:self.player1.name]) {self.player1.score = 1;}
    else
        score2 += 1;
}

- (NSString *)score {
    NSString *score = @"";
    int tempScore=0;
    if (self.score1 == score2)
    {
        switch (self.score1)
        {
            case 0:
                score = @"Love-All";
                break;
            case 1:
                score = @"Fifteen-All";
                break;
            case 2:
                score = @"Thirty-All";
                break;
            case 3:
                score = @"Forty-All";
                break;
            default:
                score = @"Deuce";
                break;

        }
    }
    else if (self.score1 >=4 || score2>=4)
    {
        int minusResult = (self.score1 -score2);
        if (minusResult==1) {score = [NSString stringWithFormat:@"Advantage %@", self.player1.name];}
        else if (minusResult ==-1) {score = [NSString stringWithFormat:@"Advantage %@", self.player2.name];}
        else if (minusResult>=2) {score = [NSString stringWithFormat:@"Win for %@", self.player1.name];}
        else {score = [NSString stringWithFormat:@"Win for %@", self.player2.name];}
    }
    else
    {
        for (int i=1; i<3; i++)
        {
            if (i==1) tempScore = self.score1;
            else { score = [NSString stringWithFormat:@"%@-", score]; tempScore = score2; }
            switch(tempScore)
            {
                case 0:
                    score = [NSString stringWithFormat:@"%@Love", score];
                    break;
                case 1:
                    score = [NSString stringWithFormat:@"%@Fifteen", score];
                    break;
                case 2:
                    score = [NSString stringWithFormat:@"%@Thirty", score];
                    break;
                case 3:
                    score = [NSString stringWithFormat:@"%@Forty", score];
                    break;
            }
        }
    }
    return score;
}

- (int)score1 {
    return self.player1.score;
}

@end