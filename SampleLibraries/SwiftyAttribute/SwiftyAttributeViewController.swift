//
//  SwiftyAttributeViewController.swift
//  SampleLibiraries
//
//  Created by sakiyamaK on 2020/10/19.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit
import SwiftyAttributes

final class SwiftyAttributeViewController: UIViewController {

    @IBOutlet weak var noLibraryLabel: UILabel! {
        didSet {
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 6
            style.alignment = .center

            let textAttributes1: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 24.0),
                .paragraphStyle: style,
                .foregroundColor: UIColor.green,
                .strokeColor: UIColor.red,
                .strokeWidth: -3.0
            ]

            let textAttributes2: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 20.0),
                .paragraphStyle: style,
                .foregroundColor: UIColor.purple,
                .strokeColor: UIColor.green,
                .strokeWidth: -2.0
            ]

            let attText1 = NSMutableAttributedString(string: "これは装飾", attributes: textAttributes1)
            let attText2 = NSMutableAttributedString(string: "テキストです", attributes: textAttributes2)
            attText1.append(attText2)

            noLibraryLabel.attributedText = attText1
        }
    }

    @IBOutlet weak var swiftyAttributesLabel: UILabel! {
        didSet {
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 6
            style.alignment = .center

            swiftyAttributesLabel.attributedText =
                "これは装飾"
                .withFont(.systemFont(ofSize: 24))
                .withParagraphStyle(style)
                .withTextColor(.green)
                .withStrokeColor(.red)
                .withStrokeWidth(-3.0)
                +
                "テキストです"
                .withFont(.systemFont(ofSize: 20))
                .withParagraphStyle(style)
                .withTextColor(.purple)
                .withStrokeColor(.green)
                .withStrokeWidth(-2.0)
        }
    }
}
