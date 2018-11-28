//
//  MacDownPlugIn.swift
//  MacDownPlugIn
//
//  Created by Chris Zielinski on 11/26/18.
//  Copyright © 2018 Big Z Labs. All rights reserved.
//

import AppKit

// Subclassing a `NSObject` inherently exposes the class to the objective-c runtime, but it's better to be explicit.
@objc(MacDownPlugInController)
public class MacDownPlugInController: NSObject {

    /// The display name of the plug-in.
    ///
    /// MacDown will use the value returned by this method as the menu item’s title for your plug-in.
    @objc
    public var name: String {
        return "Cool 🔥"
    }

    /// This method will be invoked when your plug-in is run.
    ///
    /// This method may be invoked in the UI thread. Therefore, it is strongly recommended you push long operations into background threads, and/or run them asynchronously.
    ///
    /// - Parameter sender: The UI item that triggers the invocation—usually the `NSMenuItem` object the user clicked on, but could also be nil if the plug-in is triggered programmatically.
    /// - Returns: Whether the plug-in invocation succeeded.
    @objc(run:)
    public func run(sender: Any) -> Bool {
        guard let currentDocument = NSDocumentController.shared.currentDocument
            else { return false }

        let mpDocument = MPDocumentWrapper(mpDocument: currentDocument)
        mpDocument.updateEditorMarkdown(to: "Hello. 👋\n" + mpDocument.markdown)
        return true
    }

}
