//
//  WorkSession.swift
//  Doro
//
//  Created by Adly Thebaud on 11/3/17.
//  Copyright © 2017 ThebaudHouse. All rights reserved.
//

import Foundation

class WorkSession {
   
   //MARK: Member Variables
   // using optionals so that I don't need to initialize them.
   var workTimer: BaseTimer
   var breakTimer: BaseTimer
   var longBreakTimer: BaseTimer?
   var currentTimer: BaseTimer
   
   // the WorkSession should be alive for only this long.
   var numSessions: Int
   var currentSessionCount: Int
   var currentSessionTimerSwitchCount: Int
   
   
   //MARK: Methods
   // init()
   init(workTimer: TimeInterval, breakTimer: TimeInterval, numSessions: Int) {
      self.workTimer = BaseTimer(timeRemaining: workTimer, timerName: .WorkTimer)
      self.breakTimer = BaseTimer(timeRemaining: breakTimer, timerName: .BreakTimer)
      self.currentTimer = self.workTimer
      self.numSessions = numSessions
      self.currentSessionCount = 0
      self.currentSessionTimerSwitchCount = 0
      NotificationCenter.default.addObserver(self, selector: #selector(self.switchTimer), name: NSNotification.Name(rawValue: timeUpNotificationKey), object: nil)
   }
   
   // init()
   init(workTimer: TimeInterval, breakTimer: TimeInterval, longBreakTimer: BaseTimer?, numSessions: Int) {
      self.workTimer = BaseTimer(timeRemaining: workTimer, timerName: .WorkTimer)
      self.breakTimer = BaseTimer(timeRemaining: breakTimer, timerName: .BreakTimer)
      self.longBreakTimer = longBreakTimer
      self.currentTimer = self.workTimer
      self.numSessions = numSessions
      self.currentSessionCount = 0
      self.currentSessionTimerSwitchCount = 0
      NotificationCenter.default.addObserver(self, selector: #selector(self.switchTimer), name: NSNotification.Name(rawValue: timeUpNotificationKey), object: nil)
   }
   
   // start the WorkSession. Called from UI
   func start() {
      currentTimer.start()
   }
   
   // stop the WorkSession. Called from UI.
   func stop() {
      currentTimer.stop()
   }
   
   // pause the WorkSession. Called from UI.
   func pause() {
      currentTimer.pause()
   }
   
   // display current timer in hr:min:sec format
   func getCurrentTimerDisplay() -> String {
      
      // convert TimeRemaining to hours:minutes:seconds for initial countdown
      let hours = Int(currentTimer.timeRemaining) / 3600
      let minutes = (Int(currentTimer.timeRemaining) % 3600) / 60
      let seconds = (Int(currentTimer.timeRemaining) % 3600) % 60
      
      // show the correct TimeRemaining
      return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
   }
   
   // display break timer in hr:min:sec format
   func getBreakTimerDisplay() -> String {
      // convert TimeRemaining to hours:minutes:seconds for initial countdown
      let hours = Int(breakTimer.timeRemaining) / 3600
      let minutes = (Int(breakTimer.timeRemaining) % 3600) / 60
      let seconds = (Int(breakTimer.timeRemaining) % 3600) % 60
      
      // show the correct TimeRemaining
      return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
   }
   
   
   // switch the current Timer. Called from the notification center.
   @objc func switchTimer() {
      currentSessionTimerSwitchCount += 1 // a session just happened.
      if currentSessionTimerSwitchCount == 2 {
         currentSessionCount += 1
         currentSessionTimerSwitchCount = 0
      }
      
      // what's the condition here?
      if currentSessionCount == numSessions {
         NotificationCenter.default.removeObserver(self)
      }
      else {
         if currentTimer.timerName == .WorkTimer {
            self.currentTimer = breakTimer
            currentTimer.timerName = .BreakTimer
         } else if currentTimer.timerName == .BreakTimer {
            self.currentTimer = workTimer
            currentTimer.timerName = .WorkTimer
         }
         currentTimer.start()
      }
      
   }
   
   
} // END CLASS DEFINITION
