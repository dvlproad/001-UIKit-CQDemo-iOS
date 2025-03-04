//
//  TSSFSwiftUIView.swift
//  TSDemoDemo
//
//  Created by ciyouzen on 2020/2/14.
//  Copyright © 2020 dvlproad. All rights reserved.
//

import SwiftUI
import UIKit
import CQDemoKit_Swift

@available(iOS 14.0, *)
@objc public class TSSFExceDiffTypeUIView: CQDemoSwiftUIBaseUIView {
    @objc public init() {
        super.init(swiftUIView: TSSFExceDiffTypeView())
    }
}

@available(iOS 14.0, *)
@objc public class TSSFExceDiffTypeUIViewController: CQDemoSwiftUIBaseUIViewController {
    @objc public init() {
        super.init(swiftUIView: TSSFExceDiffTypeView())
    }
}



@available(iOS 14.0, *)
public struct TSSFExceDiffTypeView: View {
    public var body: some View {
        let isRunning = true
        
        // 必须显式指定 `TSDiffActionView<TSDiffAction1>` 或 `TSDiffActionView<TSDiffAction2>`，因为泛型不支持条件运算
        if isRunning {
            TSDiffActionView(action: TSDiffAction1())
        } else {
            TSDiffActionView(action: TSDiffAction2())
        }
        
        TSDiffActionView(
            action: isRunning ? TSDiffAction1() : TSDiffAction1()
        )
    }
}

public protocol TSDiffActionProtocol {
    /// A boolean property that tells the system to consider the app intent even if its app is not in the foreground.
    static var openAppWhenRun: Bool { get }
}

struct TSDiffAction1: TSDiffActionProtocol {
    static var openAppWhenRun: Bool = false
}
struct TSDiffAction2: TSDiffActionProtocol {
    static var openAppWhenRun: Bool = true
}


@available(iOS 13.0, *)
@MainActor @preconcurrency public struct TSDiffActionView<Action> : View where Action : TSDiffActionProtocol {
//struct TSDiffActionView<Action: TSDiffActionProtocol>: View {
    var action: Action
    
    public var body: some View {
        VStack {
            Text("This is TSDiffActionView")
                .font(.largeTitle)
                .padding()
        }
    }
}


// MARK: 预览 TSSFExceDiffTypeView
@available(iOS 14.0, *)
struct TSSFExceDiffTypeView_Previews: PreviewProvider {
    static var previews: some View {
        TSSFExceDiffTypeView()
    }
}
