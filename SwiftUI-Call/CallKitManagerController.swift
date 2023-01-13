//
//  CallController.swift
//  SwiftUI-Call
//
//  Created by Connor Jones on 1/12/23.
//

import CallKit
import Foundation


final class CallKitManager: NSObject, CXProviderDelegate {
    
    let provider = CXProvider(configuration: CXProviderConfiguration())
    let callController = CXCallController()
    
    override init () {
        super.init()
        provider.setDelegate(self, queue: nil)
        
    }
    
    public func reportIncomingCall(id: UUID, handle: String) {
        print("incoming Call")
        let update = CXCallUpdate()
        update.remoteHandle = CXHandle(type: .generic, value: handle)
        provider.reportNewIncomingCall(
            with: id,
            update: update,
            completion: { error in
                if let error = error {
                    print(String(describing: error))
                }
                else {
                    print("Call Reported")
                }
            }
        )
    }
    
    public func startCall(id: UUID, handle: String) {
        print("starting Call")
        let handle = CXHandle(type: .generic, value: handle)
        let action = CXStartCallAction(call: id, handle: handle)
        let transaction = CXTransaction(action: action)
        callController.request(transaction) { error in
            if let error = error {
                print(String(describing: error))
            }
            else {
                print("Call Reported")
            }
        }
    }
    
    func providerDidReset(_ provider: CXProvider) {
        
    }
}
