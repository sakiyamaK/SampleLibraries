//
//  ViewController.swift
//  SampleLibiraries
//
//  Created by sakiyamaK on 2020/09/06.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var licenseButton: UIButton! {
        didSet {
            licenseButton.addTarget(self, action: #selector(tapLicenseButton), for: .touchUpInside)
        }
    }

    @objc func tapLicenseButton() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
