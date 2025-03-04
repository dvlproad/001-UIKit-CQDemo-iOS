//
//  TSSFSwiftUIHomeView.swift
//  TSDemoDemo
//
//  Created by ciyouzen on 2020/2/14.
//  Copyright © 2020 dvlproad. All rights reserved.
//

import SwiftUI
import UIKit
import CQDemoKit_Swift

@available(iOS 14.0, *)
@objc public class TSSUHomeUIView: CQDemoSwiftUIBaseUIView {
    @objc public init() {
        super.init(swiftUIView: TSSUHomeView())
    }
}

@available(iOS 14.0, *)
@objc public class TSSUHomeUIViewController: CQDemoSwiftUIBaseUIViewController {
    @objc public init() {
        super.init(swiftUIView: TSSUHomeView())
    }
}



@available(iOS 14.0, *)
public struct TSSUHomeView: View {
    public var body: some View {
        CJUIKitBaseHomeView(
            title: "SwiftUI",
            sectionDataModels: [
                CQDMSectionDataModel(
                    theme: "Section 1",
                    values: [
                        CQDMModuleModel(title: "Module 1", classEntry: {
                            AnyView(TestView1())
                        }),
                        CQDMModuleModel(title: "Module 1", content: "Content 1", contentLines: 1, classEntry: { AnyView(TestView1())
                        }),
                        CQDMModuleModel(title: "Module 2", classEntry: {
                            AnyView(TestView2())
                        }),
                        CQDMModuleModel(title: "Module 2", actionBlock: {
                            debugPrint("点击")
                        })
                    ]
                ),
                CQDMSectionDataModel(
                    theme: "语法问题",
                    values: [
                        CQDMModuleModel(title: "类型擦除（Type Erasure）", classEntry: {
                            AnyView(TSSFExceDiffTypeView())
                        }),
                    ]
                )
            ]
        )
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

// 模拟的目标视图2
@available(iOS 13.0, *)
struct TestView2: View {
    var body: some View {
        VStack {
            Text("This is TestView2")
                .font(.largeTitle)
                .padding()
        }
    }
}

// MARK: 预览 TSSUHomeView
@available(iOS 14.0, *)
struct TSTSSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TSSUHomeView()
    }
}
