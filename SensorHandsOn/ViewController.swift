//
//  ViewController.swift
//  SensorHandsOn
//
//  Created by Dimitrij Fajar Satria Dharma on 11/07/19.
//  Copyright © 2019 Dimitrij Fajar Satria Dharma. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    let motion = CMMotionManager()
    let altimeter = CMAltimeter()
    let pedometer = CMPedometer()
    let activityManager = CMMotionActivityManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        startMotion()
//        startAlti()
        startPedo()
        startAM()
    }
    
    func startAM(){
        if CMMotionActivityManager.isActivityAvailable(){
            activityManager.startActivityUpdates(to: OperationQueue.current!) { (dataM) in
                if let data = dataM{
                    print(data)
                }
            }
        }
    }
    
    func startPedo(){
        if CMPedometer.isPedometerEventTrackingAvailable(){
            pedometer.startUpdates(from: Date()) { (pedoData, Error) in
                if let data = pedoData{
                    print(data.numberOfSteps)
                }
            }
        }
    }
    
//    func startAlti(){
//        if CMAltimeter.isRelativeAltitudeAvailable(){
//            altimeter.startRelativeAltitudeUpdates(to: OperationQueue.current!) { (altiData, Error) in
//                if let data = altiData{
//                     print(data)
//                }
//            }
//        }
//    }
    
//    func startMotion(){
//        //detect gyro nya avail atau engga
//        if motion.isGyroAvailable{
//            motion.startGyroUpdates(to: OperationQueue.current!) { (GyroData, Error) in
//                if let data =  GyroData{
//                    if data.rotationRate.x >= 1 {
//                        print("up")
//                    }
//                }
//            }
//        }
//
//        if motion.isAccelerometerAvailable{
//            motion.startAccelerometerUpdates(to: OperationQueue.current!) { (accelData, Error) in
//                if let data = accelData{
//                    if data.acceleration.y >= 0.3 {
//                        print("tergoyang")
//                    }
//                }
//            }
//        }
//
//        if motion.isMagnetometerAvailable{
//            motion.startMagnetometerUpdates(to: OperationQueue.current!) { (magnetoData, Error) in
//                if let data = magnetoData{
//                    print(data)
//                }
//            }
//        }
//    }
    
}

