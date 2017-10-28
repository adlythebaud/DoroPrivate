//
//  CountdownTimer.swift
//  Doro
//
//  Created by Adly Thebaud on 10/25/17.
//  Copyright © 2017 ThebaudHouse. All rights reserved.
//

import Foundation

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
      timer = Timer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
      isRunning = true
      isPaused = false
   }
   
   // stop the timer.
   func stop() {
      if isRunning {
         timer?.invalidate()
         timeRemaining = 0
         isRunning = false
         return
      }
   }
   
   // pause the timer.
   func pause() {
      if isPaused {
         return
      } else {
         timer?.invalidate()
         isPaused = true
      }
   }
   
   // decrement workDuration by 1.
   @objc func updateTimer() {
      timeRemaining -= 1
   }
   
   
   
   
}
