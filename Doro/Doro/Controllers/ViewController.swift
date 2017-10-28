//
//  ViewController.swift
//  Doro
//
//  Created by Adly Thebaud on 10/25/17.
//  Copyright © 2017 ThebaudHouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   var newTimer: BaseTimer?
   
   @IBOutlet weak var timeLabel: UILabel!
   
   @IBAction func startButtonTapped(_ sender: Any) {
      newTimer?.start()
   }
   
   @IBAction func stopButtonTapped(_ sender: Any) {
      newTimer?.stop()
   }
   
   @IBAction func pauseButtonTapped(_ sender: Any) {
      newTimer?.pause()
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      newTimer = BaseTimer(duration: 400, notificationSound: 0, timer: nil)
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   // to repeat the timers, use a do-while loop.
   

}

