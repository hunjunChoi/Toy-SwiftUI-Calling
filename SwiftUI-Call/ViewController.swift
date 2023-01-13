//
//  ViewController.swift
//  SwiftUI-Call
//
//  Created by Connor Jones on 1/12/23.
//

import Foundation

import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startDemo()
    }
    
    func startDemo() {
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            let callManager = CallKitManager()
            let id = UUID()
            callManager.reportIncomingCall(id: id, handle: "Connor Jones")
        })
    }
}
