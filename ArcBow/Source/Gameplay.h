//
//  Gameplay.h
//  ArcBow
//
//  Created by Patrick Arouette on 07/02/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "CCNode.h"

@interface Gameplay : CCNode <CCPhysicsCollisionDelegate>

{
    CCPhysicsNode* gamePhysicsNode;
    CCNode* catapultArm;
    CCNode* levelNode;
    CCNode* contentNode;
}

@end
