//
//  InjectHelper.swift
//  TSDemoDemo
//
//  Created by qian on 2025/3/14.
//  Copyright © 2025 dvlproad. All rights reserved.
//

import InjectHotReload

@objc class InjectHelper: NSObject {
    @objc static func setupInjection() {
        #if DEBUG
        InjectHotReload.activate()
        print("InjectHotReload activated")
        #endif
    }
}
