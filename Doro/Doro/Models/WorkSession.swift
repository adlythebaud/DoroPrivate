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
   
   //MARK: Methods
   
   // init()
   init(workTimer: BaseTimer, breakTimer: BaseTimer, longBreakTimer: BaseTimer?) {
      self.workTimer = workTimer
      self.breakTimer = breakTimer
      self.longBreakTimer = breakTimer
      self.currentTimer = workTimer
      NotificationCenter.default.addObserver(self, selector: #selector(self.printNotificationHeard), name: NSNotification.Name(rawValue: timeUpNotificationKey), object: nil)
   }
   
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
      // I need to start the next timer here!!!!
      // do a boolean condition to check.
   }
   
   // pause the current timer
   func pauseCurrentTimer() {
      currentTimer.pause()
   }
   
   // start the WorkSession
   func start() {
      // this function should also check what the current timer is, and switch it when the longtimer is up...
      currentTimer.start()
   }
   
   // stop the WorkSession
   func stop() {
      currentTimer.stop()
      // I need to start the next timer here!!!!
      // do a boolean condition to check.
      print("workSession.stop() called")
      
      
   }
   
   // pause the WorkSession
   func pause() {
      currentTimer.pause()
   }
   
   @objc func printNotificationHeard() {
      print("I got the notification!")
   }
   
   
   
   
   
   
   
   
   
   
   
   
}
