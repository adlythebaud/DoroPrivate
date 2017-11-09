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
      
      // listen for the timerChangedKey in NotificationCenter
      NotificationCenter.default.addObserver(self, selector: #selector(self.updateView), name: NSNotification.Name(rawValue: timerChangedKey), object: nil)
   }
   
   @IBAction func stopButtonTapped(_ sender: Any) {
      
      workSession?.stop()
   }
   
   @IBAction func pauseButtonTapped(_ sender: Any) {
      
      workSession?.pause()
   }
   
   @objc func updateView() {
      timeLabel.text = "\(workSession!.currentTimer.timeRemaining)"
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      let workTimer = BaseTimer(timeRemaining: 3, timerName: .WorkTimer)
      let breakTimer = BaseTimer(timeRemaining: 2, timerName: .BreakTimer)
      workSession = WorkSession(workTimer: workTimer, breakTimer: breakTimer, longBreakTimer: nil, numSessions: 3)
      
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   // to repeat the timers, use a do-while loop.
   

}

