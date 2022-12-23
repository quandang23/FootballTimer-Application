//
//  StopWatchManager.swift
//  BLECalculator
//
//  Created by quan dang on 6/26/22.
//

import SwiftUI

enum stopWatchMode {
    case running
    case stopped
    case paused
}

class StopWatchManager: ObservableObject {
    private var count = 0;
    private var y = 0;
    @Published var secondsCount = "00";
    @Published var millisCount = "000";
    @Published var mode: stopWatchMode = .stopped
    var timer:Timer = Timer()
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        print("Start")
    }
    @objc func timerCounter() -> Void
    {
        count = count + 1
//        if y == 150{ //43
//            count = count + 5
//            y = 0
//        }
//        else {
//            y = y + 1
//        }
        let time = milliSecToSecondMilli(milli: count)
        //let timeString = makeTimeString(seconds: time.0, millis: time.1)
        //if ((count%66) == 1){  //printing slower
            secondsCount = makeSecondsString(seconds: time.0)
            millisCount = makeMilliString(millis: time.1)
        //}
//        if x == 0{
//            starting = Date()
//            print(starting)
//            x = x + 1;
//        }
        print(count)
    }
    func milliSecToSecondMilli(milli: Int) -> (Int, Int)
    {
        return ((milli / 1000), (milli % 1000))
    }
    func makeMilliString(millis: Int) -> String
    {
        var timeString = ""
        timeString += String(format: "%03d", millis)
        return timeString
    }
    func makeSecondsString(seconds: Int) -> String
    {
        var timeString = ""
        timeString += String(format: "%02d", seconds)
        return timeString
    }
    func pause() {
//        if count % 66 != 1 {
//            count = (count - (count / 66) * 66) + count
//        }
        timer.invalidate()
        let time = milliSecToSecondMilli(milli: count)
        //let timeString = makeTimeString(seconds: time.0, millis: time.1)
        secondsCount = makeSecondsString(seconds: time.0)
        millisCount = makeMilliString(millis: time.1)
        //timer.invalidate()
        mode = .paused
        print("pause")
    }

    func reset() {
        timer.invalidate()
        mode = .stopped
        count = 0
        secondsCount = makeSecondsString(seconds: 0)
        millisCount = makeMilliString(millis: 0)
        print("stopppp")
    }
}

