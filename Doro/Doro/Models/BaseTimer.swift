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
   
   // helper member variables.
   var doesRepeat: Bool
   var notificationSound: Int
   var isRunning: Bool
   var isSet: Bool
   var isPaused: Bool
   
   init(duration timeRemaining: TimeInterval, doesRepeat: Bool = false,
        notificationSound: Int, isRunning: Bool = false, isPaused: Bool = false,
        isSet: Bool = true, timer: Timer?) {
      self.timeRemaining = timeRemaining
      self.doesRepeat = doesRepeat
      self.notificationSound = notificationSound
      self.isRunning = isRunning
      self.isSet = isSet
      self.isPaused = isPaused
      self.timer = timer
   }
   
   // start the timer.
   func start() {
      print(timeRemaining)
      timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
      isRunning = true
      isPaused = false
      print("start was called")
   }
   
   // stop the timer.
   func stop() {
      if isRunning {
         timer?.invalidate()
         timeRemaining = 0
         isRunning = false
         print("stop was called")
         return
      } else {
         print("stop was called but the timer was already stopped")
      }
      
   }
   
   // pause the timer.
   func pause() {
      if isPaused {
         print("pause was called but the timer is already paused")
         return
      } else {
         timer?.invalidate()
         isPaused = true
      }
      print("pause was called")
   }
   
   // decrement workDuration by 1.
   @objc func updateTimer() {
      timeRemaining -= 1
      // there needs to be function call to update the view somehow. Maybe this could take in a view object like in android, and update it? Research it at work!
      print(timeRemaining)
   }
   
   
   
   
}
