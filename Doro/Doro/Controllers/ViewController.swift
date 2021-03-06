//
//  ViewController.swift
//  Doro
//
//  Created by Adly Thebaud on 10/25/17.
//  Copyright © 2017 ThebaudHouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   /// MARK: WorkSesion member variables
   var workSession: WorkSession?
   var workTimer: Int?
   var breakTimer: Int?
   var numSessions: Int?
   
   /// MARK: Outlets
   @IBOutlet weak var timeLabel: UILabel!
   @IBOutlet weak var breakTimeLabel: UILabel!
   
   @IBOutlet weak var numSessionsLabel: UILabel!
   @IBOutlet weak var stepper: UIStepper!
   @IBOutlet weak var workTimerPicker: UIDatePicker!
   @IBOutlet weak var breakTimerPicker: UIDatePicker!
   @IBOutlet weak var timePickerStackView: UIStackView!
   @IBOutlet weak var cycleControlStackView: UIStackView!
   @IBOutlet weak var timeLabelStackView: UIStackView!
   @IBOutlet weak var startButton: RoundButton!
   @IBOutlet weak var stopButton: RoundButton!
   @IBOutlet weak var pauseButton: RoundButton!
   
   
   /// MARK: Actions
   
   /**
    *
    */
   @IBAction func startButtonTapped(_ sender: Any) {
      // no timer should be created in this function.
      // following line of code should happen only once. Shouldn't happen if this method is called
      // after pauseButtonTapped() is called.
      
      if workSession == nil {
         // This line is for when you want the user to set the timer
         //         workSession = WorkSession(workTimer: workTimerPicker.countDownDuration, breakTimer: breakTimerPicker.countDownDuration, longBreakTimer: nil, numSessions: Int(stepper.value))
         
         // this line is for testing the timer using seconds instead of minutes.
         workSession = WorkSession(workTimer: 5, breakTimer: 1, longBreakTimer: nil, numSessions: Int(stepper.value))
      }
      
      showTimerUI()
      workSession?.start()
   }
   
   /**
    *
    */
   @IBAction func stopButtonTapped(_ sender: Any) {
      showOptionsUI()
      workSession?.stop()
      workSession = nil
   }
   
   /**
    *
    */
   @IBAction func pauseButtonTapped(_ sender: Any) {
      print("pause button tapped")
      startButton.isEnabled = true
      startButton.isOpaque = false
      stopButton.isEnabled = true
      stopButton.isOpaque = false
      pauseButton.isEnabled = false
      pauseButton.isOpaque = true
      workSession?.pause()
      
   }
   
   /**
    * STEPPER TAPPED
    * called 
    */
   @IBAction func stepperTapped(_ sender: Any) {
      let cycleText = stepper.value > 1 ? "Cycles" : "Cycle"
      numSessionsLabel.text = "\(Int(stepper.value)) \(cycleText)"
   }
   
   /**
    * UPDATE VIEW
    * called once per second
    */
   @objc func updateView() {
      timeLabel.text = workSession?.getCurrentTimerDisplay()
      breakTimeLabel.text = workSession?.getBreakTimerDisplay()
   }
   
   /**
    * VIEW DID LOAD
    */
   override func viewDidLoad() {
      super.viewDidLoad()
      
      stepper.minimumValue = 1
      showOptionsUI()
      
      // listen for the timerChangedKey in NotificationCenter
      // change the view with updateView() each time a second passes
      // must always add to each view controller...
      NotificationCenter.default.addObserver(self, selector: #selector(self.updateView), name: NSNotification.Name(rawValue: timerChangedKey), object: nil)
      
      // add observer for entering background
      NotificationCenter.default.addObserver(self, selector: #selector(self.getSavedTime), name: .UIApplicationDidEnterBackground, object: nil)

      // add observer for entering foreground
      NotificationCenter.default.addObserver(self, selector: #selector(self.updateForForeground), name: .UIApplicationWillEnterForeground, object: nil)
   }

   /**
    *
    */
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(true)
      // if workSession is running, then set this..?
   }
   
   /**
    *
    */
   override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(true)
   }
   
   /**
    * GET SAVED TIME
    * called from NotificationCenter when app enters background
    */
   @objc func getSavedTime() {
      print("application did enter background.")
      // pause the currentTimer
      workSession?.pause()
      
      // save the time we entered background in shared preferences
      let shared = UserDefaults.standard
      shared.set(Date(), forKey: "savedTime")
   }
   
   /**
    * UPDATE FOR FOREGROUND
    * called from NotificationCenter when app comes back to foreground
    */
   @objc func updateForForeground() {
      print("application will enter foreground")
      if let savedDate = UserDefaults.standard.object(forKey: "savedTime") as? Date {
         // add the time elapsed to the workSession
         // TODO: make the adding factor into the total amount of time.
         workSession?.currentTimer.timeRemaining += savedDate.timeIntervalSinceNow
         workSession?.start()
      } else {
         print("nothing saved in UserDefaults")
      }
   }
   
   /**
    * Test function to call a method from app delegate
    */
   func printSomething(_ name: String) {
      print("hello \(name)!")
   }
   
   /**
    * SHOW OPTIONS UI
    * shows the normal timepickers and buttons.
    */
   func showOptionsUI() {
      timeLabelStackView.isHidden = true
      timePickerStackView.isHidden = false
      cycleControlStackView.isHidden = false
      startButton.isEnabled = true
      startButton.isOpaque = false
      stopButton.isEnabled = false
      stopButton.isOpaque = true
      pauseButton.isEnabled = false
      pauseButton.isOpaque = true
   }
   
   /**
    * SHOW TIMER UI
    * shows the countdown timers.
    */
   func showTimerUI() {
      timePickerStackView.isHidden = true
      cycleControlStackView.isHidden = true
      timeLabelStackView.isHidden = false
      startButton.isEnabled = false
      startButton.isOpaque = true
      stopButton.isEnabled = true
      stopButton.isOpaque = false
      pauseButton.isEnabled = true
      pauseButton.isOpaque = false
   }
   
   

}

