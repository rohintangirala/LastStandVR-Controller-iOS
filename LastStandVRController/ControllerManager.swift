//
//  ControllerManager.swift
//  LastStandVRController
//
//  Created by Rohin Tangirala on 3/25/17.
//  Copyright © 2017 Rohin Tangirala. All rights reserved.
//

import Foundation

class ControllerManager {
    let redisServer = Redis()
    let ip = "10.10.180.94"
    let port = 6379
    var ct = 0
    init() {
        connect()
        redisServer.Command(Command: "LPUSH appPlatform \"iOS\"")
        
        
    }
    
    private func connect() {
        redisServer.server(endPoint: ip, onPort: UInt16(port))
    }
    
    class var sharedInstance: ControllerManager {
        struct Static {
            static let instance = ControllerManager()
        }
        return Static.instance
    }
    
    func sendAngle() {
       
        redisServer.Command(Command: "LSET xRot 0 \(phoneX)")
        redisServer.Command(Command: "LSET yRot 0 \(phoneY)")
        redisServer.Command(Command: "LSET zRot 0 \(phoneZ)")
        
        
    }
    
    func sendFire() {
        redisServer.Command(Command: "LSET fire 0 1")
    }
    
}
