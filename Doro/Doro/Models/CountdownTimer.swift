//
//  CountdownTimer.swift
//  Doro
//
//  Created by Adly Thebaud on 10/25/17.
//  Copyright © 2017 ThebaudHouse. All rights reserved.
//

import Foundation

class CountdownTimer {
   // how long are we working for
   
   // our actual timers.
   var workTimer: Timer?
   var breakTimer: Timer?
   
   // how long is our work period
   var workDuration: TimeInterval
   
   // how long is our break in between work periods
   var breakDuration: TimeInterval
   
   // helper member variables.
   var doesRepeat: Bool
   var notificationSound: Int
   var isRunning: Bool
   var isSet: Bool
   var isPaused: Bool
   
   // how much time is left on current timer?
   var timeRemaining: TimeInterval?
   
   
   init(workDuration: TimeInterval, breakDuration: TimeInterval, doesRepeat: Bool,
        notificationSound: Int, isRunning: Bool = false, isPaused: Bool = false,
        isSet: Bool = false, timeRemaining: TimeInterval?, workTimer: Timer?, breakTimer: Timer?) {
      self.workDuration = workDuration
      self.breakDuration = breakDuration
      self.doesRepeat = doesRepeat
      self.notificationSound = notificationSound
      self.isRunning = isRunning
      self.isSet = isSet
      self.isPaused = isPaused
      self.timeRemaining = timeRemaining
      self.workTimer = workTimer
      self.breakTimer = breakTimer
   }
   
   // start the timer.
   func start() {
      // start the timer
      
      /*
       timeInterval -> number of seconds in between firings of the timer.
       target       -> The object to which to send the message specified by selector when timer fires
       selector     -> message to send to target when timer fires.
       userInfo     -> userInfo of timer. Can be nil
       repeats      -> if true, timer will repeatedly reschedule itself until invalidated. If false,
                       timer fires once.
       */
      
      
   }
   
   // pause the timer.
   func pause() {
      
   }
   
   // stop the timer.
   func stop() {
      
   }
   
   // start a work timer.
   func startWorkTimer() {
      self.workTimer = Timer(timeInterval: 1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
   }
   
   // start a break timer.
   func startBreakTimer() {
      self.breakTimer = Timer(timeInterval: 1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
   }
   
   @objc func updateTime() {
      
   }
   
//   @objc func updateTime() {
//      // subtract one second
//      timeRemaining -= 1
//
//      // convert timeRemaing to hours:minutes:seconds
//      hours = Int(timeRemaining) / 3600
//      minutes = (Int(timeRemaining) % 3600) / 60
//      seconds = (Int(timeRemaining) % 3600) % 60
//
//      // change timeRemainingLabel.text to reflect time change
//      timeRemainingLabel.text = String(format: "%02d:%02d:%02d", hours!, minutes!, seconds!)
//
//      if timeRemaining < 1 {
//         // timer?.fire()
//         timer?.invalidate()
//
//         // play alert sound
//         let systemSoundID: SystemSoundID = 1016
//         // AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
//         AudioServicesPlayAlertSound(systemSoundID)
//         isTimerRunning = false
//
//         // update the view
//         updateView()
//      }
//   }
   
//   func updateView() {
//
//
//      // get the correct timeRemaining from focusTimeDatePicker
//      // timeRemaining = focusTimeDatePicker.countDownDuration
//      timeRemaining = 5
//
//      // convert TimeRemaining to hours:minutes:seconds for initial countdown
//      hours = Int(timeRemaining) / 3600
//      minutes = (Int(timeRemaining) % 3600) / 60
//      seconds = (Int(timeRemaining) % 3600) % 60
//
//      // show the correct TimeRemaining
//      timeRemainingLabel.text = String(format: "%02d:%02d:%02d", hours!, minutes!, seconds!)
//      // print("Long break switch state: \(longBreakSwitch.isOn)")
//   }
   
   
}
