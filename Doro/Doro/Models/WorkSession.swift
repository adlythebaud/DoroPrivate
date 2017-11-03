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
   var longBreakTimer: BaseTimer
   var currentTimer: BaseTimer
   
   //MARK: Methods
   // Get the current timer
   func getCurrentTimer() -> BaseTimer {
      // just some dummy code to appease the IDE :)
      return currentTimer
   }
   
   // Set the current timer
   func setCurrentTimer(currentTimer: BaseTimer) {
      self.currentTimer = currentTimer
   }
   
   // Start the current timer
   func startCurrentTimer() {
      currentTimer.start()
   }
   
   // Stop the current timer
   func stopCurrentTimer() {
      currentTimer.stop()
   }
   
   // pause the current timer
   func pauseCurrentTimer() {
      currentTimer.pause()
   }
   
   init(workTimer: BaseTimer, breakTimer: BaseTimer, longBreakTimer: BaseTimer, currentTimer: BaseTimer) {
      self.workTimer = workTimer
      self.breakTimer = breakTimer
      self.longBreakTimer = breakTimer
      self.currentTimer = workTimer
   }
   
   
   
   
}
