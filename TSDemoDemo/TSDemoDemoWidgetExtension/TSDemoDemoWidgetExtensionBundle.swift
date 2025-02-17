//
//  TSDemoDemoWidgetExtensionBundle.swift
//  TSDemoDemoWidgetExtension
//
//  Created by qian on 2025/2/17.
//  Copyright © 2025 dvlproad. All rights reserved.
//

import WidgetKit
import SwiftUI

@main
struct TSDemoDemoWidgetExtensionBundle: WidgetBundle {
    var body: some Widget {
        TSDemoDemoWidgetExtension()
        TSDemoDemoWidgetExtensionControl()
        TSDemoDemoWidgetExtensionLiveActivity()
    }
}
