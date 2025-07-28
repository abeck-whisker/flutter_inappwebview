
// File: HarkWebViewDelegate.swift
import Foundation
import WebKit

@available(iOS 15.0, *)
class HarkWebViewDelegate: NSObject, WKUIDelegate {
    static let shared = HarkWebViewDelegate()

    func webView(_ webView: WKWebView,
                 requestMediaCapturePermissionFor origin: WKSecurityOrigin,
                 initiatedByFrame frame: WKFrameInfo,
                 type: WKMediaCaptureType,
                 decisionHandler: @escaping (WKPermissionDecision) -> Void) {

        let allowed = origin.host == "litter-robot.com" ||
                      origin.host?.hasSuffix("app.sendhark.com") == true

        decisionHandler(allowed ? .grant : .deny)
    }
}

