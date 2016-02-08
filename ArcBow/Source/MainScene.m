#import "MainScene.h"

@implementation MainScene

- (void)play
{
    CCScene* gameplayScene = [CCBReader loadAsScene:@"Gameplay"];
    [[CCDirector sharedDirector] presentScene:gameplayScene];
}

@end
