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
   var initialNumSessions: Int
   
   var numSwitches: Int
   
   //MARK: Methods
   // init()
   init(workTimer: BaseTimer, breakTimer: BaseTimer, longBreakTimer: BaseTimer?, numSessions: Int) {
      self.workTimer = workTimer
      self.breakTimer = breakTimer
      self.longBreakTimer = longBreakTimer
      self.currentTimer = workTimer
      self.numSessions = numSessions
      self.initialNumSessions = numSessions
      self.numSwitches = 0
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
   
   
   // switch the current Timer. Called from the notification center.
   @objc func switchTimer() {
      // switch should happen twice before a session has been completed.
      
      // change the timerName and the currentTimer of the workSession class.
      if numSessions >= 1 {

         if currentTimer.timerName == .WorkTimer {
            self.currentTimer = breakTimer
            currentTimer.timerName = .BreakTimer
         } else if currentTimer.timerName == .BreakTimer {
            self.currentTimer = workTimer
            currentTimer.timerName = .WorkTimer
         }
         
         
         if numSwitches == 1 {
            print("remove a session")
            numSessions -= 1
            numSwitches = 0
         }
         numSwitches += 1
         
         
         // start the new currentTimer..
         currentTimer.start()
         
      } else if numSessions == 0 {
         self.numSessions = self.initialNumSessions
         // probably should remove the observer....?
      }
      print("numSessions: \(numSessions)")
      print("numSwitches: \(numSwitches)")
      
   }
   
   
   
   
   
   
   
   
   
   
   
   
}
