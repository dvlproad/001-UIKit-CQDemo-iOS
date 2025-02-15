//
//  TSTSSwiftUIView.swift
//  TSDemoDemo
//
//  Created by ciyouzen on 2020/2/14.
//  Copyright © 2020 dvlproad. All rights reserved.
//

import SwiftUI
import UIKit

@available(iOS 15.0, *)
@objc public class TSTSUIView: UIView {
    public init() {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 从 swiftuiView 生成 uiView ，并显示到视图中
    private var hostingController: UIViewController?
    private func setupViews() {
        let swiftuiView = TSTSSwiftUIView()
        let hostingController = UIHostingController(rootView: swiftuiView)
        self.hostingController = hostingController
        
        let uiView: UIView = hostingController.view ?? UIView()
        self.showUIView(uiView)
    }
    
    // 添加到 uiView ,并设置约束
    private func showUIView(_ uiView: UIView) {
        self.addSubview(uiView)
        uiView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            uiView.topAnchor.constraint(equalTo: self.topAnchor),
            uiView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            uiView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            uiView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

@available(iOS 15.0, *)
public class TSTSUIViewController: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 105/255.0, green: 193/255.0, blue: 243/255.0, alpha: 1)

        // 创建 SwiftUI 视图，并用 UIHostingController 来包装 SwiftUI 视图
        let swiftUIView = TSTSSwiftUIView()
        let hostingController = UIHostingController(rootView: swiftUIView)

        // 添加到当前视图控制器的视图中，并设置 Auto Layout 约束
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            hostingController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])

        // 完成添加子视图控制器
        hostingController.didMove(toParent: self)
    }
}



@available(iOS 15.0, *)
struct TSTSSwiftUIView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            Button("Click me") {
                print("Button clicked")
            }
            .tint(.red) // 设置按钮的颜色为蓝色
            
            Image("field_close_gray")
                .renderingMode(.template) // 设置为模板模式
                .foregroundColor(.yellow) // 设置图标的颜色为黄色
            
            Image(systemName: "star.fill")
                .renderingMode(.template) // 设置为模板模式
                .tint(.red) // 设置图标的颜色为黄色
            
            Image(systemName: "star.fill")
                .foregroundStyle(.yellow)
            
            Image(systemName: "star.fill")
                .foregroundColor(.red) // 设置图标的颜色为黄色
            
            TSTSSwiftUIView.diffSymbols_typesView()
        }
    }
    
    // 不同 symbol 图标的各种不同渲染方法
    static func diffSymbols_typesView() -> some View {
        HStack(alignment: .center, spacing: 0) {
            typesBatteryView(
                imageName: "battery.100percent.bolt",
                isSystemName: true
            )
            typesBatteryView(
                imageName: "icon_control_katong_4",
                isSystemName: false
            )
            typesBatteryView(
                imageName: "02_color_svg",
                isSystemName: false
            )
        }
    }
    
    
    static func typesBatteryView(imageName: String, isSystemName: Bool = false) -> some View {
        VStack(alignment: .center, spacing: 0) {
            Text("单色模式 Monochrome")
            baseImageName(imageName, isSystemName)
                .foregroundStyle(.yellow)
            
            Text("分层模式 Hierarchical")
            baseImageName(imageName, isSystemName)
                .foregroundStyle(.yellow)
                .symbolRenderingMode(.hierarchical)
            
            Text("调色盘模式 Palette")
            baseImageName(imageName, isSystemName)
                .foregroundStyle(.red, .orange, .yellow)
                .symbolRenderingMode(.palette)
            
            Text("多色模式 Muticolor")
            baseImageName(imageName, isSystemName)
                .symbolRenderingMode(.multicolor)
        }
    }
    
    static func baseImageName(_ imageName: String, _ isSystemName: Bool = false) -> some View {
        if isSystemName {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 100, height: 100)
        } else {
            Image(imageName)
                .resizable()
                .frame(width: 100, height: 100)
        }
    }
}


// MARK: 预览 BaseControlWidgetAnimationViewInApp
@available(iOS 15.0, *)
struct BaseControlWidgetAnimationViewInApp_Previews: PreviewProvider {
    static var previews: some View {
        TSTSSwiftUIView()
    }
}
