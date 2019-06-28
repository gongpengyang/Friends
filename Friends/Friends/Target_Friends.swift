//
//  Target_Friends.swift
//  Friends
//
//  Created by gongpengyang on 2019/6/28.
//  Copyright © 2019 kaiyuan. All rights reserved.
//

import UIKit

class Target_Friends: NSObject {
    
    
    @objc func Action_Extension_ViewController(_ params:NSDictionary) -> UIViewController {
        if let callback = params["callback"] as? (String) -> Void {
            callback("success")
        }
        
        let aViewController = ViewController()
        return aViewController
    }
    
    @objc func Action_Category_ViewController(_ params:NSDictionary) -> UIViewController {
        
        if let block = params["callback"] {
            
            typealias CallbackType = @convention(block) (NSString) -> Void
            let blockPtr = UnsafeRawPointer(Unmanaged<AnyObject>.passUnretained(block as AnyObject).toOpaque())
            let callback = unsafeBitCast(blockPtr, to: CallbackType.self)
            
            callback("success")
        }
        
        let aViewController = ViewController()
        return aViewController
    }

}
