import SwiftUI

@available(iOS 13.0, *)
public extension Image {
    // 方法一：不需要循环
    public init(_ name: String, bundleModel: CQDMBundleModel) {
        let bundle = Bundle.cqdemo_frameworkBundle(bundleModel: bundleModel)
        self.init(name, bundle: bundle)
    }
    
    // 方法二：需要循环
    public init(_ name: String, bundleName: String) {
        let bundle = Bundle.cqdemo_frameworkBundle(bundleName: bundleName)
        self.init(name, bundle: bundle)
    }
}
