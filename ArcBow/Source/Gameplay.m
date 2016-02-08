//
//  Gameplay.m
//  ArcBow
//
//  Created by Patrick Arouette on 07/02/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "Gameplay.h"

@implementation Gameplay

// called when CCB file has completed loading
-(void)didLoadFromCCB
{
    self.userInteractionEnabled = true;
    CCNode *level = [CCBReader load:@"Levels/Level1"];
    [levelNode addChild:level];
}

// called on every touch in this scene
//override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!)

-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    [self launchPenguin];
}

-(void)launchPenguin
{
//
    CCNode* penguin = [CCBReader load:@"Penguin"];
    // position the penguin at the bowl of the catapult
    penguin.position = ccpAdd(catapultArm.position, ccp(16, 50));
    
    // add the penguin to the physicsNode of this scene (because it has physics enabled)
    [gamePhysicsNode addChild:penguin];
    
    // manually create & apply a force to launch the penguin
    CGPoint launchDirection = ccp(1, 0);
    CGPoint force = ccpMult(launchDirection, 8000);
    [penguin.physicsBody applyForce:force];
    
    // ensure followed object is in visible area when starting
    self.position = ccp(0, 0);
    CCActionFollow *follow = [CCActionFollow actionWithTarget:penguin worldBoundary:self.boundingBox];
    [contentNode runAction:follow];
    
}

- (void)restart
{
    // reload this level
    [[CCDirector sharedDirector] replaceScene: [CCBReader loadAsScene:@"Gameplay"]];
}


@end
