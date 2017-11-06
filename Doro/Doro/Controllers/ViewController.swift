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
      // newTimer?.start()
      workSession?.startCurrentTimer()
   }
   
   @IBAction func stopButtonTapped(_ sender: Any) {
      // newTimer?.stop()
      workSession?.stopCurrentTimer()
   }
   
   @IBAction func pauseButtonTapped(_ sender: Any) {
      // newTimer?.pause()
      workSession?.pauseCurrentTimer()
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      let newTimer = BaseTimer(timeRemaining: 5)
      let breakTimer = BaseTimer(timeRemaining: 3)
      workSession = WorkSession(workTimer: newTimer, breakTimer: breakTimer, longBreakTimer: nil)
      
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   // to repeat the timers, use a do-while loop.
   

}

