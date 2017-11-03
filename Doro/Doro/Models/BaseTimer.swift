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
        notificationSound: Int, isRunning: Bool = false, isPaused: Bool = false,
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
         print("start was called")
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
   @objc func updateTimer() {
      if timeRemaining <= 0.0 {
         stop()
      } else {
         timeRemaining -= 1
         // there needs to be function call to update the view somehow. Maybe this could take in a view object like in android, and update it? Research it at work!
         print(timeRemaining)
      }
   }
   
   
   
   
}
