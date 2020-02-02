//
//  AppDelegate.swift
//  Service Tester
//
//  Created by David Albert on 2/1/20.
//  Copyright © 2020 David Albert. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var textView: NSTextView!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSApp.servicesProvider = self
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        NSApp.windows.first?.makeKeyAndOrderFront(self)

        return false
    }

    @objc func slurpText(_ pboard: NSPasteboard, userData: String?, error: AutoreleasingUnsafeMutablePointer<NSString?>) {

        guard let items = pboard.pasteboardItems else {
            textView.string = "pasteboardItems: nil"
            return
        }

        var s = "pasteboardItems: \(items)\n\n"
        s += "types: \(items.map { $0.types })\n\n"

        let availableTypes = items.map { $0.availableType(from: [NSPasteboard.PasteboardType(rawValue: "public.text")]) }

        s += "availableTypes: \(availableTypes)\n\n"

        let strings = items.enumerated().map { (arg) -> String? in
            let (i, item) = arg

            if let type = availableTypes[i], let str = item.string(forType: type)  {
                return str
            } else {
                return nil
            }
        }

        s += "strings: \(strings)"

        textView.string = s
    }
}

