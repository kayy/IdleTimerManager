/*
 //  $Id: IdleTimerManager.m 128 2013-02-05 09:51:56Z kay $
 //
 //  Created by Kay Bothfeld on 01.12.2012.
 //  Copyright 2012 SCIO System-Consulting GmbH & Co. KG. All rights reserved.
 //  http://www.scio.de
 */

#import "IdleTimerManager.h"
#import <UIKit/UIKit.h>


@implementation IdleTimerManager

const float IDLE_TIMER_DELAY_DEFAULT = 60;

#pragma mark -
#pragma mark Singleton Management
    // Singleton management methods. If you use singletons more than once it should be replaced by a more sophisticated
    // approach like CWLSynthesizeSingleton s. http://www.cocoawithlove.com/2008/11/singletons-appdelegates-and-top-level.html

    static IdleTimerManager *sharedIdleTimerManager = ((void *)0);
    + (IdleTimerManager *)sharedInstance {
        @synchronized(self) {
            if (sharedIdleTimerManager == ((void *)0)) {
                sharedIdleTimerManager = [[self alloc] init];
            }
        }
        return sharedIdleTimerManager;
    }
    + (id)allocWithZone:(NSZone *)zone {
        @synchronized(self) {
            if (sharedIdleTimerManager == ((void *)0)) {
                sharedIdleTimerManager = [super allocWithZone:zone];
                return sharedIdleTimerManager;
            }
        }
        return ((void *)0);
    }
    - (id)copyWithZone:(NSZone *)zone { return self; }
    - (id)retain { return self; }
    - (NSUInteger)retainCount { return (2147483647L * 2UL + 1UL); }
    - (oneway void)release { }
    - (id)autorelease { return self; };

#pragma mark -
#pragma mark Interface Implementation

- (void) enableIdleTimerDelayed {
    [self performSelector:@selector (enableIdleTimer) withObject:nil afterDelay:delay];
}

- (void) enableIdleTimer {
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [[UIApplication sharedApplication] setIdleTimerDisabled:NO];
}

- (void) disableIdleTimer {
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
}

- (id) init {
	if ((self = [super init])) {
        delay = IDLE_TIMER_DELAY_DEFAULT;
		return self;
	} else {
		NSLog (@"Error: Unable to initialize!");
		[self release];
		return nil;
	}
}

- (void)dealloc {
    [super dealloc];
}
@end


