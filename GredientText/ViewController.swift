//
//  ViewController.swift
//  GredientText
//
//  Created by venvehuob on 18/11/20.
//  Copyright © 2020 vermamukesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var gredientView: GredientLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        gredientView.text = "Sometimes feeling of love is better than falling in love."
    }
}

public class GredientLabel: UILabel {
    let textLayer = CATextLayer()
    let gredientLayer = CAGradientLayer()
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    public init() {
        super.init(frame: .zero)
        commonInit()
    }
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        gredientLayer.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        textLayer.frame = gredientLayer.bounds
    }
    private func commonInit() {
        //self.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        self.layoutIfNeeded()
        let textfont = UIFont.boldSystemFont(ofSize: 40.0)
        self.font = textfont
        self.textColor = .clear
        let baseColor = UIColor.red
        let middleStop = UIColor.yellow
        
        let gradientColors = [baseColor.cgColor, middleStop.cgColor]
        let locations: [NSNumber] = [0.0, 1.0]
        
        gredientLayer.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        gredientLayer.colors = gradientColors
        gredientLayer.locations = locations
        gredientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gredientLayer.endPoint = CGPoint.init(x: 1, y: 1)
        textLayer.isWrapped = true
        textLayer.foregroundColor = UIColor.black.cgColor
        textLayer.backgroundColor = UIColor.clear.cgColor
        textLayer.font = textfont as CFTypeRef?
        textLayer.fontSize = textfont.pointSize
        textLayer.frame = gredientLayer.bounds
        textLayer.truncationMode = .end
        textLayer.contentsScale = UIScreen.main.scale
        self.layer.addSublayer(gredientLayer)
        gredientLayer.mask = textLayer
    }
    public override var text: String? {
        didSet {
            textLayer.string = text
        }
    }
}

