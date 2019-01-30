//
//  MZSlider.swift
//  iOSBasicsObjC
//
//  Created by kyoung hee park on 26/12/2018.
//  Copyright © 2018 MayPark. All rights reserved.
//

import Foundation
//
//  MZSlider.swift
//  MZSlider
//
//  Created by Metodij Zdravkin on 1/17/17.
//  Copyright © 2017 Metodij Zdravkin. All rights reserved.
//
import UIKit

@IBDesignable
class MZSlider: UISlider {
    
    @IBInspectable var trackHeight: CGFloat = 12 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var minFillColor : UIColor = UIColor.init(red: 247/255.0, green: 65/255.0, blue: 100/255.0, alpha: 1.0) {
        didSet {
            setNeedsDisplay()
        }
    }
//    @IBInspectable var minStrokeColor : UIColor = UIColor.clear {
//        didSet {
//            setNeedsDisplay()
//        }
//    }
    
    @IBInspectable var maxFillColor : UIColor = UIColor.init(red: 233.0/255.0, green:  233.0/255.0, blue:  233.0/255.0, alpha: 1.0) {
        didSet {
            setNeedsDisplay()
        }
    }
    
//    @IBInspectable var maxStrokeColor : UIColor = UIColor.clear {
//        didSet {
//            setNeedsDisplay()
//        }
//    }
    
//    @IBInspectable var thumbNormalFillColor : UIColor = UIColor.white {
//        didSet {
//            setNeedsDisplay()
//        }
//    }
//
//    @IBInspectable var thumbNormalStrokeColor : UIColor = UIColor.red {
//        didSet {
//            setNeedsDisplay()
//        }
//    }
//
//    @IBInspectable var thumbHighlightFillColor : UIColor = UIColor.white {
//        didSet {
//            setNeedsDisplay()
//        }
//    }
//
//    @IBInspectable var thumbHighlightStrokeColor : UIColor = UIColor.red {
//        didSet {
//            setNeedsDisplay()
//        }
//    }
//
//    @IBInspectable var thumbRadius : CGFloat = 10 {
//        didSet {
//            setNeedsDisplay()
//        }
//    }
//
//    @IBInspectable var sliderCornerRadius : CGFloat = 5 {
//        didSet {
//            setNeedsDisplay()
//        }
//    }
    
    private enum SliderTrack {
        case Minimum
        case Maximum
    }
    
    // MARK: - Draw Methods
    
    private struct Ratios {
        static let startPosition: CGFloat = 10
        static let bezierHeight: CGFloat = 6
        static let circle: CGFloat = 6
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.setMinimumTrackImage(imageForRect(rect: rect, side: .Minimum), for: .normal)
        self.setMaximumTrackImage(imageForRect(rect: rect, side: .Maximum), for: .normal)
        
        self.setThumbImage(UIImage.init(), for: .normal)
        
//        self.setThumbImage(customThumbImage(strokeColor: UIColor.clear, fillColor: UIColor.clear), for: .normal)
//        self.setThumbImage(customThumbImage(strokeColor: UIColor.clear, fillColor: UIColor.clear), for: .highlighted)
    }
    
    private func imageForRect(rect: CGRect, side: SliderTrack) -> UIImage? {
        // We create an innerRect in which we draw the lines
        let innerRect = rect.insetBy(dx: 0, dy: 0)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0);
        
//        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: innerRect.width, height: trackHeight), byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 0, height: 0))
        
        let path = UIBezierPath(rect: rect)
        
        switch side {
        case .Minimum:
            minFillColor.setStroke()
            minFillColor.setFill()
            path.fill()
            path.stroke()
            
        case .Maximum:
            maxFillColor.setStroke()
            maxFillColor.setFill()
            path.stroke()
            path.fill()
        }
        
        let selectedSide = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero)
        
        UIGraphicsEndImageContext()
        
        return selectedSide
    }
    
//    private func customThumbImage(strokeColor: UIColor, fillColor: UIColor) -> UIImage? {
//        UIGraphicsBeginImageContextWithOptions(CGSize(width: 40, height: 40), false, 0)
//
//        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 20,y: 20), radius: 0, startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
//
//        strokeColor.setStroke()
//        fillColor.setFill()
//
//        circlePath.stroke()
//        circlePath.fill()
//        let thumbImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero)
//
//        UIGraphicsEndImageContext()
//
//        return thumbImage
//    }
}
