//
//  CountdownTimer.swift
//  Doro
//
//  Created by Adly Thebaud on 10/25/17.
//  Copyright © 2017 ThebaudHouse. All rights reserved.
//

import Foundation
import UIKit

class BaseTimer {
   
   // our actual timers.
   var timer: Timer?
   
   // how long is our timePeriod
   var timeRemaining: TimeInterval
   
   // how long did we initial set it to? This never changes when object is created.
   var initialTimeRemaining: TimeInterval
   
   // helper member variables.
   var doesRepeat: Bool
   var notificationSound: Int
   var isRunning: Bool
   var isSet: Bool
   var isPaused: Bool
   var timerName: CurrentTimerName
   
   init(timeRemaining: TimeInterval, timerName: CurrentTimerName, doesRepeat: Bool = false,
        notificationSound: Int = 0, isRunning: Bool = false, isPaused: Bool = false,
        isSet: Bool = true) {
      self.timeRemaining = timeRemaining
      self.initialTimeRemaining = timeRemaining
      self.timerName = timerName
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
         // schedule the timer object.
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
         
         isRunning = true
         isPaused = false
         // notify the observers that timer started to manifest it in the UI.
         NotificationCenter.default.post(name: Notification.Name(rawValue: timerChangedKey), object: self)
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
   // needs to handle all cases for while the BaseTimer object is running
   @objc func updateTimer() {
      if timeRemaining <= 0.0 {
         
         // send to notification center that the time is up
         NotificationCenter.default.post(name: Notification.Name(rawValue: timeUpNotificationKey), object: self)
         
         // stop the timer.
         stop()
         
      } else {
         print(timeRemaining)
         // update time
         timeRemaining -= 1         
         // notify observers that a tick of the clock has gone by.
         NotificationCenter.default.post(name: Notification.Name(rawValue: timerChangedKey), object: self)
      }
   }
   

   
}
