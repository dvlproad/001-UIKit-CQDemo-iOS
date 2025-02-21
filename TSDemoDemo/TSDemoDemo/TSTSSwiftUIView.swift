//
//  TSTSSwiftUIView.swift
//  TSDemoDemo
//
//  Created by ciyouzen on 2020/2/14.
//  Copyright © 2020 dvlproad. All rights reserved.
//

import SwiftUI
import UIKit
import CQDemoKit_Swift

@available(iOS 14.0, *)
@objc public class TSTSUIView: CQDemoSwiftUIBaseUIView {
    @objc public init() {
        super.init(swiftUIView: TestView1())
    }
}

@available(iOS 14.0, *)
@objc public class TSTSUIViewController: CQDemoSwiftUIBaseUIViewController {
    @objc public init() {
        super.init(swiftUIView: TestView1())
    }
}


// 模拟的目标视图1
@available(iOS 13.0, *)
struct TestView1: View {
    var body: some View {
        VStack {
            Text("This is TestView1")
                .font(.largeTitle)
                .padding()
        }
    }
}

// MARK: 预览 TestView1
@available(iOS 13.0, *)
struct TSTSSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TestView1()
    }
}
