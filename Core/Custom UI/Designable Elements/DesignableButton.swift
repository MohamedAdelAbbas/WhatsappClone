//
//  DesignableButton.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import UIKit

@IBDesignable class DesignableButton: UIButton
{
    @IBInspectable var enableImageRightAligned: Bool = false
    @IBInspectable var enableGradientBackground: Bool = false
    
    @IBInspectable var gradientColor1: UIColor = UIColor.black
    @IBInspectable var gradientColor2: UIColor = UIColor.white
    
    @IBInspectable
    var topCorner: Bool = false
    {
        didSet
        {
            if topCorner && bottomCorner
            {
                layer.maskedCorners = [.layerMinXMinYCorner,
                                       .layerMaxXMinYCorner,
                                       .layerMaxXMaxYCorner,
                                       .layerMinXMaxYCorner]
            }
            else if topCorner
            {
                layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            }
        }
    }
    
    @IBInspectable
    var bottomCorner: Bool = false
    {
        didSet
        {
            if topCorner && bottomCorner
            {
                layer.maskedCorners = [.layerMinXMinYCorner,
                                       .layerMaxXMinYCorner,
                                       .layerMaxXMaxYCorner,
                                       .layerMinXMaxYCorner]
            }
            else if bottomCorner
            {
                layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            }
        }
    }
    
    @IBInspectable
    var rightCorner: Bool = false
    {
        didSet
        {
            if rightCorner && leftCorner
            {
                layer.maskedCorners = [.layerMinXMinYCorner,
                                       .layerMaxXMinYCorner,
                                       .layerMaxXMaxYCorner,
                                       .layerMinXMaxYCorner]
            }
            else if rightCorner
            {
                layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            }
        }
    }
    
    @IBInspectable
    var leftCorner: Bool = false
    {
        didSet
        {
            if rightCorner && leftCorner
            {
                layer.maskedCorners = [.layerMinXMinYCorner,
                                       .layerMaxXMinYCorner,
                                       .layerMaxXMaxYCorner,
                                       .layerMinXMaxYCorner]
            }
            else if leftCorner
            {
                layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
            }
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    @IBInspectable
    var circleCorner: Bool
    {
        get {
            return min(bounds.size.height, bounds.size.width) / 2 == cornerRadius
        }
        set {
            cornerRadius = newValue ? min(bounds.size.height, bounds.size.width) / 2 : cornerRadius
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    @IBInspectable var titleLeftPadding: CGFloat = 0.0 {
        didSet {
            titleEdgeInsets.left = titleLeftPadding
        }
    }
    
    @IBInspectable var titleRightPadding: CGFloat = 0.0 {
        didSet {
            titleEdgeInsets.right = titleRightPadding
        }
    }
    
    @IBInspectable var titleTopPadding: CGFloat = 0.0 {
        didSet {
            titleEdgeInsets.top = titleTopPadding
        }
    }
    
    @IBInspectable var titleBottomPadding: CGFloat = 0.0 {
        didSet {
            titleEdgeInsets.bottom = titleBottomPadding
        }
    }
    
    @IBInspectable var imageLeftPadding: CGFloat = 0.0 {
        didSet {
            imageEdgeInsets.left = imageLeftPadding
        }
    }
    
    @IBInspectable var imageRightPadding: CGFloat = 0.0 {
        didSet {
            imageEdgeInsets.right = imageRightPadding
        }
    }
    
    @IBInspectable var imageTopPadding: CGFloat = 0.0 {
        didSet {
            imageEdgeInsets.top = imageTopPadding
        }
    }
    
    @IBInspectable var imageBottomPadding: CGFloat = 0.0 {
        didSet {
            imageEdgeInsets.bottom = imageBottomPadding
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor = UIColor.darkGray
    {
        didSet
        {
            setNeedsLayout()
        }
    }
    
    @IBInspectable
    var shadowOffsetWidth: CGFloat = 0.0
    {
        didSet
        {
            setNeedsLayout()
        }
    }
    
    @IBInspectable
    var shadowOffsetHeight: CGFloat = 0.0
    {
        didSet
        {
            setNeedsLayout()
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float = 0.0
    {
        didSet
        {
            setNeedsLayout()
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat = 0.0
    {
        didSet
        {
            setNeedsLayout()
        }
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        if enableImageRightAligned
        {
            if let imageView_temp = imageView
            {
                imageEdgeInsets.left = self.bounds.width - imageView_temp.bounds.width - imageRightPadding
            }
        }
        
        if enableGradientBackground
        {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.bounds
            gradientLayer.colors = [gradientColor1.cgColor, gradientColor2.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
        
        if shadowOpacity > 0
        {
            drawShadow()
        }
    }
    
    @IBInspectable
    var LocalizedTitle: String
    {
        set
        {
            self.setTitle(newValue.localized, for: .normal)
        }
        get
        {
            return self.titleLabel?.text ?? ""
        }
    }
    
    // MARK: Methods
    
    private func drawShadow()
    {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
}
