//
//  CJUIKitBaseHomeView.swift
//  CQDemoKit-Swift
//
//  Created by ciyouzen on 2020/2/14.
//  Copyright © 2020 dvlproad. All rights reserved.
//

import SwiftUI
import CQDemoKit

// MARK: - SwiftUI 专用模型（与 ObjC 的 CQDMSectionDataModel / CQDMModuleModel 同名但独立），解决：在 swiftui 里 values 如果是 ObjC 的 NSMutableArray，不能直接用于 ForEach ，需要多一层转换的问题。

@available(iOS 13.0, *)
public struct CQDMSwiftSectionDataModel {
    public var theme: String
    public var values: [CQDMSwiftModuleModel]
    
    public init(theme: String, values: [CQDMSwiftModuleModel]) {
        self.theme = theme
        self.values = values
    }
}

@available(iOS 13.0, *)
public struct CQDMSwiftModuleModel: Identifiable {
    public var id = UUID()
    public var title: String
    public var content: String? = nil
    public var contentLines: Int? = nil
    public var actionBlock: (() -> Void)?
    public var viewGetterHandle: (() -> AnyView)?
    
    public init(
         title: String,
         content: String? = nil,
         contentLines: Int? = nil,
         actionBlock: (() -> Void)? = nil,
         viewGetterHandle: (() -> AnyView)? = nil
    ) {
        self.title = title
        self.content = content
        self.contentLines = contentLines
        self.actionBlock = actionBlock
        self.viewGetterHandle = viewGetterHandle
    }
}

// MARK: - CJUIKitBaseHomeView

@available(iOS 14.0, *)
public struct CJUIKitBaseHomeView: View {
    private var title: String
    private var sectionDataModels: [CQDMSwiftSectionDataModel] = []
    
    public init(title: String, sectionDataModels: [CQDMSwiftSectionDataModel]) {
        self.title = title
        self.sectionDataModels = sectionDataModels
    }

    public var body: some View {
        NavigationView {
            List {
                ForEach(sectionDataModels, id: \.theme) { sectionDataModel in
                    Section(header: Text(sectionDataModel.theme)) {
                        ForEach(sectionDataModel.values) { moduleModel in
                            if let action = moduleModel.actionBlock {
                                VStack(alignment: .leading, spacing: 0) {
                                    Text(moduleModel.title)
                                    if let contentText = moduleModel.content {
                                        let contentLines = moduleModel.contentLines ?? 0
                                        Text(contentText)
                                            .lineLimit(contentLines > 1 ? contentLines : 1)
                                            .foregroundColor(.gray)
                                            .font(.system(size: 10))
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .contentShape(Rectangle())  // 扩大点击区域
                                .onTapGesture {
                                    action()
                                }
                            } else {
                                NavigationLink(
                                    destination: self.destinationView(for: moduleModel)
                                ) {
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text(moduleModel.title)
                                        if let contentText = moduleModel.content {
                                            let contentLines = moduleModel.contentLines ?? 0
                                            Text(contentText)
                                                .lineLimit(contentLines > 1 ? contentLines : 1)
                                                .foregroundColor(.gray)
                                                .font(.system(size: 10))
                                        }
                                    }
                                }
                            }
                            
                        }
                    }
                }
            }
            .navigationTitle(title)
        }
    }
    
    private func destinationView(for moduleModel: CQDMSwiftModuleModel) -> some View {
        if let view = moduleModel.viewGetterHandle?() {
            return view
        }
        return AnyView(Text("No View Found"))
    }
}
