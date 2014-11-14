//
//  HelloWorldLayer.h
//  hktmxTest
//
//  Created by Ghislain Bernier on 11/7/14.
//  Copyright __MyCompanyName__ 2014. All rights reserved.
//


#import <GameKit/GameKit.h>
#import "HKTMXTiledMap.h"

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    CCParticleFire * mPartEffects;
    
    HKTMXTiledMap * mTmxMap;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
