//
//  ViewController.swift
//  Service Tester
//
//  Created by David Albert on 2/1/20.
//  Copyright © 2020 David Albert. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet var textView: NSTextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        (NSApp.delegate as! AppDelegate).textView = textView
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

