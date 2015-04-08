//
//  ViewController.swift
//  JustBeacon
//
//  Created by Mirai Akagawa on 4/7/15.
//  Copyright (c) 2015 parks-and-rec. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth

class ViewController: UIViewController, CBPeripheralManagerDelegate {
    
    
    @IBOutlet weak var uuidLabel: UILabel!
    
    let beaconIdentifier = "parks-and-rec.cmu.edu.JustBeacon"
//    let supportedProximityUUIDs = [NSUUID(UUIDString: "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0"), NSUUID(UUIDString: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5"), NSUUID(UUIDString: "74278BDA-B644-4520-8F0C-720EAF059935")]
//    let defaultPower = -59
    
    let major = 9
    let minor = 6
//    let uuid = NSUUID(UUIDString: "0CF052C2-97CA-407C-84F8-B62AAC4E9020")
    let uuid = NSUUID(UUIDString: "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0")
    var peripheralManager = CBPeripheralManager()
    var advertisedData = NSDictionary()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let clMajor:CLBeaconMajorValue = UInt16(self.major)
        let clMinor:CLBeaconMinorValue = UInt16(self.minor)
        var region = CLBeaconRegion(proximityUUID: self.uuid, major: clMajor, minor: clMinor, identifier: beaconIdentifier)
        self.advertisedData = region.peripheralDataWithMeasuredPower(-59)
        self.peripheralManager = CBPeripheralManager(delegate: self, queue: nil, options: nil)
        
        uuidLabel.text = "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0"

    }
    
    func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager!) {
        println("update state")
        switch peripheral.state {
        case CBPeripheralManagerState.PoweredOn:
            var advertisementObj = NSString(string: "Sup")
            self.peripheralManager.startAdvertising(advertisedData)
        default:
            println("in default bro")
        }

    }
    
}

