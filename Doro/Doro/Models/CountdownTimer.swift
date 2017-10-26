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
   
   
   
   
   init(workDuration: TimeInterval, breakDuration: TimeInterval, doesRepeat: Bool,
        notificationSound: Int, isRunning: Bool = false, isPaused: Bool = false,
        isSet: Bool = false, workTimer: Timer?, breakTimer: Timer?) {
      self.workDuration = workDuration
      self.breakDuration = breakDuration
      self.doesRepeat = doesRepeat
      self.notificationSound = notificationSound
      self.isRunning = isRunning
      self.isSet = isSet
      self.isPaused = isPaused
      
      self.workTimer = workTimer
      self.breakTimer = breakTimer
   }
   
   // start the timer. Called with a start button.
   func start() {
      
   }
   
   // pause the timer. Called with a pause button.
   func pause() {
      
   }
   
   // stop the timer. Called with a stop button.
   func stop() {
      
   }
   
   // start a work timer.
   func startWorkTimer() {
      self.workTimer = Timer(timeInterval: 1, target: self, selector: #selector(self.updateWorkTimer), userInfo: nil, repeats: true)
   }
   
   // start a break timer.
   func startBreakTimer() {
      self.breakTimer = Timer(timeInterval: 1, target: self, selector: #selector(self.updateBreakTimer), userInfo: nil, repeats: true)
   }
   
   // decrement workDuration by 1.
   @objc func updateWorkTimer() {
      workDuration -= 1
   }
   
   // decrement breakDuration by 1.
   @objc func updateBreakTimer() {
      breakDuration -= 1
   }

   
//   func updateView() {
//
//
//      // get the correct timeRemaining from focusTimeDatePicker
//      // timeRemaining = focusTimeDatePicker.countDownDuration
//      timeRemaining = 5
//
//      // convert TimeRemaining to hours:minutes:seconds for initial countdown
//      var hours = Int(timeRemaining) / 3600
//      var minutes = (Int(timeRemaining) % 3600) / 60
//      var seconds = (Int(timeRemaining) % 3600) % 60
//
//      // show the correct TimeRemaining
//      timeRemainingLabel.text = String(format: "%02d:%02d:%02d", hours!, minutes!, seconds!)
//      // print("Long break switch state: \(longBreakSwitch.isOn)")
//   }
   
   
}
