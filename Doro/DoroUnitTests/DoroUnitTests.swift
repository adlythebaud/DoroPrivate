//
//  DoroUnitTests.swift
//  DoroUnitTests
//
//  Created by Adly Thebaud on 4/29/18.
//  Copyright © 2018 ThebaudHouse. All rights reserved.
//

import XCTest
@testable import Doro

class DoroUnitTests: XCTestCase {
   var workSession: WorkSession!
   
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
      workSession = WorkSession(workTimer: 50, breakTimer: 30, numSessions: 2)
      
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
      workSession = nil
      
    }
    
   func testSubtraction() {
      workSession += TimeInterval(75)
      XCTAssert(workSession.currentTimer.timerName == .WorkTimer, "On Wrong Timer")
      XCTAssert(workSession.numSessions == 1, "There is not 1 session left")
      XCTAssertEqual(workSession.currentTimer.timeRemaining, 30, "Wrong answer")
   
   }
    
    
}
