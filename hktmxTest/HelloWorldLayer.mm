//
//  HelloWorldLayer.m
//  hktmxTest
//
//  Created by Ghislain Bernier on 11/7/14.
//  Copyright __MyCompanyName__ 2014. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

//Samsung galaxy S3
//renderer = Adreno (TM) 225
//vendor = Qualcomm

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        self.touchEnabled = YES;
        
///////// TEST 1  --- only the bottom of the map appears and it crashes when moving the map
        mTmxMap = [[[HKTMXTiledMap alloc] initWithTMXFile:@"bigwave1.tmx" withScaleLimit:0.42f] autorelease];
        mTmxMap.position = ccp(20, 20);
        [self addChild:mTmxMap];
        
        mPartEffects = [[CCParticleFire alloc] initWithTotalParticles:30];
        [self addChild:mPartEffects];
//////////////
        
/////// TEST 2 --- Everything works here!
//        mTmxMap = [[[HKTMXTiledMap alloc] initWithTMXFile:@"bigwave1.tmx" withScaleLimit:0.42f] autorelease];
//        mTmxMap.position = ccp(20, 20);
//        [self addChild:mTmxMap z:1];
//        
//       CCParticleFire* mPartEffect = [[CCParticleFire alloc] initWithTotalParticles:300];
//        mPartEffect.position = ccp(100, 110);
//        
//        [self addChild:mPartEffect z:0];
////////////
        

	}
	return self;
}

-(void) registerWithTouchDispatcher{
    [[CCDirector sharedDirector].touchDispatcher addTargetedDelegate:self priority:0 swallowsTouches:YES];
}


-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
    NSLog(@"mTmxMap pos = %.2f", mTmxMap.position.x);
    mTmxMap.position = ccp(mTmxMap.position.x + 0.5, mTmxMap.position.y);
    return YES;
}

- (void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];

    mTmxMap.position = location;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}


@end
