/*
 //  $Id: IdleTimerManager.h 128 2013-02-05 09:51:56Z kay $
 //
 //  Created by Kay Bothfeld on 01.05.10.
 //  Copyright 2010 SCIO System-Consulting GmbH & Co. KG. All rights reserved.
 //  http://www.scio.de
 */


#import <Foundation/Foundation.h>

/*!
    @class       IdleTimerManager
    @abstract    Encapsulates calls to UIApplication's setIdleTimerDisabled and adds functionality to delay reenabling
                 the system idle timer.
    @discussion  If idle timer is disabled in iOS, the system still counts down the predefined time interval. This leads
                 to the situation that after enabling the idle timer again, the device immediately reduces brightness 
                 and will go to sleep after some 15 seconds. To avoid this behaviour and extend the interval, the method
                 enableTimerDelayed delays the original call by an internal amount of time stored in member variable 
                 delay.
                 The class is implemented as singleton.
*/

@interface IdleTimerManager : NSObject {
    NSTimeInterval delay;
}

+ (IdleTimerManager*) sharedInstance;

/*!
    @method     enableIdleTimerDelayed
    @abstract	Set the application idle timer after delay seconds.
 */
- (void) enableIdleTimerDelayed;


/*!
    @method     enableIdleTimer
    @abstract	Activates application idle timer immediately.
 */
- (void) enableIdleTimer;

/*!
    @method     disableIdleTimer
    @abstract	Stops application idle timer immediately.
 */
- (void) disableIdleTimer;

@end

