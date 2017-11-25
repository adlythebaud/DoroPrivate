//
//  TimerConfigViewController.swift
//  Doro
//
//  Created by Adly Thebaud on 11/23/17.
//  Copyright © 2017 ThebaudHouse. All rights reserved.
//

import UIKit

class TimerConfigViewController: UIViewController {

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
      // Do any additional setup after loading the view, typically from a nib.
      
      // create timers, observers, sessions all at the same time.
      //      let workTimer = BaseTimer(timeRemaining: 3, timerName: .WorkTimer)
      //      let breakTimer = BaseTimer(timeRemaining: 2, timerName: .BreakTimer)
      workSession = WorkSession(workTimer: 3, breakTimer: 2, longBreakTimer: nil, numSessions: 2, description: nil)
      
      //      workSession = WorkSession(workTimer: 3, breakTimer: 2, longBreakTimer: nil, numSessions: 3)
      // listen for the timerChangedKey in NotificationCenter
      NotificationCenter.default.addObserver(self, selector: #selector(self.updateView), name: NSNotification.Name(rawValue: timerChangedKey), object: nil)
   }
   
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }

}
