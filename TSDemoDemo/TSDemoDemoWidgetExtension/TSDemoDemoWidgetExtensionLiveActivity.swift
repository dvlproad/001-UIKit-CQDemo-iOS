//
//  TSDemoDemoWidgetExtensionLiveActivity.swift
//  TSDemoDemoWidgetExtension
//
//  Created by qian on 2025/2/17.
//  Copyright © 2025 dvlproad. All rights reserved.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct TSDemoDemoWidgetExtensionAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct TSDemoDemoWidgetExtensionLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TSDemoDemoWidgetExtensionAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension TSDemoDemoWidgetExtensionAttributes {
    fileprivate static var preview: TSDemoDemoWidgetExtensionAttributes {
        TSDemoDemoWidgetExtensionAttributes(name: "World")
    }
}

extension TSDemoDemoWidgetExtensionAttributes.ContentState {
    fileprivate static var smiley: TSDemoDemoWidgetExtensionAttributes.ContentState {
        TSDemoDemoWidgetExtensionAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: TSDemoDemoWidgetExtensionAttributes.ContentState {
         TSDemoDemoWidgetExtensionAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: TSDemoDemoWidgetExtensionAttributes.preview) {
   TSDemoDemoWidgetExtensionLiveActivity()
} contentStates: {
    TSDemoDemoWidgetExtensionAttributes.ContentState.smiley
    TSDemoDemoWidgetExtensionAttributes.ContentState.starEyes
}
