//
//  GradiendtView.swift
//  DemoApp
//
//  Created by Ateeq on 7/10/21.
//

import Foundation
import UIKit


@IBDesignable
class GradientView: UIView {
    @IBInspectable var firstColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    @IBInspectable var secondColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func updateView() {
        
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor, secondColor].map{$0.cgColor}
    }
    
    
}
