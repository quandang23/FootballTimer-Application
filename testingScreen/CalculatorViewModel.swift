//
//  BLEService.swift
//  BLECalculatorApp
//
//  Created by Rob Kerr on 8/7/21.
//

import Foundation
import CoreBluetooth

enum state:UInt8 {
    case start, pause, reset
}

class CalculatorViewModel : NSObject, ObservableObject, Identifiable {
    var id = UUID()
    
    // MARK: - Interface
    @Published var output = "Disconnected"  // current text to display in the output field
    @Published var connected = false  // true when BLE connection is active
    @Published var stopping = false
    @Published var stopWatchManager = StopWatchManager()
    
    // MARK: - Calculations
    //private var operands:[UInt8] = [0x00, 0x00, 0x00]  // operand1, operand2, operation
    private var startTimer:[UInt8] = [0x01]
    private var resetTimer:[UInt8] = [0x02]
    private var pauseTimer:[UInt8] = [0x03]
    private var operatorSymbol = ""
    
    func send(_ operation: state) {
        guard let peripheral = connectedPeripheral,
              let inputChar = inputChar else {
            output = "Connection error"
            return
        }
            
        switch operation {
            case .start:
                peripheral.writeValue(Data(startTimer), for: inputChar, type: .withoutResponse)
                //stopWatchManager.start()
                print("startTimer")
            case .pause:
                peripheral.writeValue(Data(pauseTimer), for: inputChar, type: .withoutResponse)
                stopWatchManager.pause()
                print("pauseTimer")
            case .reset:
                peripheral.writeValue(Data(resetTimer), for: inputChar, type: .withoutResponse)
                stopping = false
                //stopWatchManager.stop()
                print("resetTimer")
        }
    }
    
    // MARK: - BLE
    private var centralQueue: DispatchQueue?

    private let serviceUUID = CBUUID(string: "EBC0FCC1-2FC3-44B7-94A8-A08D0A0A5079")
    
    private let inputCharUUID = CBUUID(string: "C1AB2C55-7914-4140-B85B-879C5E252FE5")
    private var inputChar: CBCharacteristic?
    private let outputCharUUID = CBUUID(string: "643954A4-A6CC-455C-825C-499190CE7DB0")
    private var outputChar: CBCharacteristic?
    
    // service and peripheral objects
    private var centralManager: CBCentralManager?
    private var connectedPeripheral: CBPeripheral?

    func connectCalculator() {
        output = "Connecting..."
        centralQueue = DispatchQueue(label: "test.discovery")
        centralManager = CBCentralManager(delegate: self, queue: centralQueue)
    }
    
    func disconnectCalculator() {
        guard let manager = centralManager,
              let peripheral = connectedPeripheral else { return }
        
        manager.cancelPeripheralConnection(peripheral)
    }
}

extension CalculatorViewModel: CBCentralManagerDelegate {
    
    // This method monitors the Bluetooth radios state
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("Central Manager state changed: \(central.state)")
        if central.state == .poweredOn {
            central.scanForPeripherals(withServices: [serviceUUID], options: nil)
        }
    }

    // Called for each peripheral found that advertises the serviceUUID
    // This test program assumes only one peripheral will be powered up
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("Discovered \(peripheral.name ?? "UNKNOWN")")
        central.stopScan()
        
        connectedPeripheral = peripheral
        central.connect(peripheral, options: nil)
    }

    // After BLE connection to peripheral, enumerate its services
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("Connected to \(peripheral.name ?? "UNKNOWN")")
        peripheral.delegate = self
        peripheral.discoverServices(nil)
    }
    
    // After BLE connection, cleanup
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("Disconnected from \(peripheral.name ?? "UNKNOWN")")
        
        centralManager = nil
        
        DispatchQueue.main.async {
            self.connected = false
            self.output = "Disconnected"
        }
    }
}

extension CalculatorViewModel : CBPeripheralDelegate {
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        print("Discovered services for \(peripheral.name ?? "UNKNOWN")")
        
        guard let services = peripheral.services else {
            return
        }
        
        for service in services {
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        print("Discovered characteristics for \(peripheral.name ?? "UNKNOWN")")
        
        guard let characteristics = service.characteristics else {
            return
        }
        
        for ch in characteristics {
            switch ch.uuid {
                case inputCharUUID:
                    inputChar = ch
                case outputCharUUID:
                    outputChar = ch
                    // subscribe to notification events for the output characteristic
                    peripheral.setNotifyValue(true, for: ch)
                default:
                    break
            }
        }
        DispatchQueue.main.async {
            self.connected = true
            self.output = "Connected."
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        print("Notification state changed to \(characteristic.isNotifying)")
    }
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        DispatchQueue.main.sync {
            stopping = true
        }
        print(stopping)
        stopWatchManager.pause()
    }
}

