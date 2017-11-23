//
//  DefaultTimers.swift
//  Doro
//
//  Created by Adly Thebaud on 11/23/17.
//  Copyright © 2017 ThebaudHouse. All rights reserved.
//

import Foundation



var default_one = WorkSession(workTimer: 2100, breakTimer: 300, longBreakTimer: nil, numSessions: 2)
var default_two = WorkSession(workTimer: 1500, breakTimer: 300, longBreakTimer: nil, numSessions: 3)
var default_three = WorkSession(workTimer: 3000, breakTimer: 600, longBreakTimer: nil, numSessions: 3)

var defaultTimers: [WorkSession] = [default_one, default_two, default_three]




