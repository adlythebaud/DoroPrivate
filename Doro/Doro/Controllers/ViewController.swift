//
//  ViewController.swift
//  Doro
//
//  Created by Adly Thebaud on 10/25/17.
//  Copyright © 2017 ThebaudHouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   var workSession: WorkSession?
   
   @IBOutlet weak var timeLabel: UILabel!
   
   @IBAction func startButtonTapped(_ sender: Any) {
      // no timer should be created in this function.
      workSession?.start()
   }
   
   @IBAction func stopButtonTapped(_ sender: Any) {
      workSession?.stop()
   }
   
   @IBAction func pauseButtonTapped(_ sender: Any) {
      workSession?.pause()
   }
   
   @objc func updateView() {
//      timeLabel.text = "\(workSession!.currentTimer.timeRemaining)"
      timeLabel.text = workSession?.getCurrentTimerDisplay()
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
     
      // create WorkSession object, set time for timers.
      workSession = WorkSession(workTimer: 60, breakTimer: 5, longBreakTimer: nil, numSessions: 2)
      
      
      // listen for the timerChangedKey in NotificationCenter
      // change the view with updateView() each time a second passes
      // must always add to each view controller...
      NotificationCenter.default.addObserver(self, selector: #selector(self.updateView), name: NSNotification.Name(rawValue: timerChangedKey), object: nil)
      
      // add observer for entering background
      NotificationCenter.default.addObserver(self, selector: #selector(self.getSavedTime), name: .UIApplicationDidEnterBackground, object: nil)
      
      // add observer for entering foreground
      NotificationCenter.default.addObserver(self, selector: #selector(self.updateForForeground), name: .UIApplicationWillEnterForeground, object: nil)
   }

   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(true)
      // if workSession is running, then set this..?
   }
   
   override func viewWillDisappear(_ animated: Bool) {
      super.viewWillAppear(true)
   }
   
   @objc func getSavedTime() {
      print("application did enter background.")
      // pause the currentTimer
      workSession?.pause()
      
      // save the time we entered background in shared preferences
      let shared = UserDefaults.standard
      shared.set(Date(), forKey: "savedTime")
   }
   
   @objc func updateForForeground() {
      print("application will enter foreground")
      if let savedDate = UserDefaults.standard.object(forKey: "savedTime") as? Date {
         workSession?.currentTimer.timeRemaining += savedDate.timeIntervalSinceNow
         workSession?.start()
         
      }
   }
   
   

}

