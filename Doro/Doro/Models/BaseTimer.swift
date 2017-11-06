//
//  CountdownTimer.swift
//  Doro
//
//  Created by Adly Thebaud on 10/25/17.
//  Copyright © 2017 ThebaudHouse. All rights reserved.
//

import Foundation
import UIKit
// Models don't need to know anything about views or controllers.
class BaseTimer {
   // how long are we working for
   
   // our actual timers.
   var timer: Timer?
   
   // how long is our timePeriod
   var timeRemaining: TimeInterval
   
   var initialTimeRemaining: TimeInterval
   
   // helper member variables.
   var doesRepeat: Bool
   var notificationSound: Int
   var isRunning: Bool
   var isSet: Bool
   var isPaused: Bool
   
   init(timeRemaining: TimeInterval, doesRepeat: Bool = false,
        notificationSound: Int = 0, isRunning: Bool = false, isPaused: Bool = false,
        isSet: Bool = true) {
      self.timeRemaining = timeRemaining
      self.initialTimeRemaining = timeRemaining
      self.doesRepeat = doesRepeat
      self.notificationSound = notificationSound
      self.isRunning = isRunning
      self.isSet = isSet
      self.isPaused = isPaused
      self.timer = nil
   }
   
   // start the timer.
   func start() {
      if isRunning == false {
         print(timeRemaining)
         
         // schedule the timer object.
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
         
         isRunning = true
         isPaused = false
      }
      
   }
   
   // stop the timer.
   func stop() {
      if isRunning || isPaused {
         // stop the timer
         timer?.invalidate()
         
         // set the timeRemaining back to what it initially was.
         timeRemaining = initialTimeRemaining
         isRunning = false
         
         print("stop called")
         // end the function
         return
      }
   }
   
   // pause the timer.
   func pause() {
      if isPaused {
         // already paused, nothing to do.
         return
      } else {
         // else statement reached if isPaused is false.
         // stop the timer
         timer?.invalidate()
         // set isPaused
         isRunning = false
         isPaused = true
      }
   }
   
   // decrement workDuration by 1.
   // needs to handle all cases for while the BaseTimer object is running
   @objc func updateTimer() {
      if timeRemaining <= 0.0 {
         
         // can't call notify after stop, because notify checks if timeRemaining is at 0.
         // stop resets timeRemaining to what it was initially set to.
         notify()
         stop()
      } else {
         timeRemaining -= 1
         // there needs to be function call to update the view somehow. Maybe this could take in a view object like in android, and update it? Research it at work!
         print(timeRemaining)
      }
   }
   
   // check if the currentTimer is finished
   func isCurrentTimerFinished() -> Bool {
      return (timeRemaining <= 0.0)
   }
   
   // notify the user that currentTimer has ran out.
   func notify() {
      if isCurrentTimerFinished() {
         print("Time's up! You should probably play an alert sound.")
      }
   }
   
   
   
}
