//
//  AppIntent.swift
//  TSDemoDemoWidgetExtension
//
//  Created by qian on 2025/2/17.
//  Copyright © 2025 dvlproad. All rights reserved.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource { "Configuration" }
    static var description: IntentDescription { "This is an example widget." }

    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}
