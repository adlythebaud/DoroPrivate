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
      workSession = WorkSession(workTimer: 200, breakTimer: 5, longBreakTimer: nil, numSessions: 2)
      
      
      // listen for the timerChangedKey in NotificationCenter
      // must always add to each view controller...
      NotificationCenter.default.addObserver(self, selector: #selector(self.updateView), name: NSNotification.Name(rawValue: timerChangedKey), object: nil)
   }

   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(true)
      // if workSession is running, then set this
   }
   
   override func viewWillDisappear(_ animated: Bool) {
      super.viewWillAppear(true)
   }
   
   

}

