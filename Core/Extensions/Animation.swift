//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

/*
import Motion

extension UIView
{
    // MARK:- Fade -
    @objc func fadeIn(duration: Double = 0.8, delay: Double = 0.2, completion: (() -> Void)? = nil)
    {
        self.alpha = 0.0
        self.animate([.fadeIn,
                     .duration(duration), .delay(delay)])
        {
            completion?()
        }
    }
    
    @objc func fadeOut(duration: Double = 0.8, delay: Double = 0.2, completion: (() -> Void)? = nil)
    {
        self.alpha = 1.0
        self.animate([.fadeOut,
                     .duration(duration), .delay(delay)])
        {
            completion?()
        }
    }
    
    // MARK:- Spring -
    
    @objc func spring(delay: Double = 0.1, stiffness: CGFloat = 0, damping: CGFloat = 10.0, duration: Double = 1.0)
    {
        let x = self.superview?.bounds.width
        self.transform = CGAffineTransform.identity.translatedBy(x:  -(x ?? 300), y: 0)
        
        self.animate(.translate(),
                     .spring(stiffness: stiffness, damping: damping),
                     .duration(duration), .delay(delay))
    }
    
    @objc func springWithFade(delay: Double = 0.1, stiffness: CGFloat = 0, damping: CGFloat = 10.0, duration: Double = 1.0)
    {
        let x = self.superview?.bounds.width
        self.alpha = 0.0
        self.transform = CGAffineTransform.identity.translatedBy(x:  -(x ?? 300), y: 0)
        
        self.animate(.translate(),
                      .spring(stiffness: stiffness, damping: damping),
                      .fadeIn,
                      .duration(duration), .delay(delay))
    }
    
    @objc func springWithFadeSubViews(delay: Double = 0.1, step: Double = 0.2, damping: CGFloat = 10.0, duration: Double = 1.0)
    {
        var delay = delay
        for subView in self.subviews
        {
            subView.springWithFade(delay: delay, stiffness: 0.0, damping: damping, duration: duration)
            delay += step
        }
    }
    
    // MARK:- Scale -
    
    @objc func scale(base: CGFloat = 0.0, duration: Double = 1.0, delay: Double = 0.1, completion: (() -> Void)? = nil)
    {
        self.transform = CGAffineTransform(scaleX: base, y: base)
        
        self.animate([.scale(),
                     .duration(duration), .delay(delay)])
        {
            completion?()
        }
    }
    
    @objc func scaleWithFade(base: CGFloat = 0.0, duration: Double = 1.0, delay: Double = 0.1, completion: (() -> Void)? = nil)
    {
        self.alpha = 0.0
        self.transform = CGAffineTransform(scaleX: base, y: base)
        
        self.animate([.scale(),
                     .fadeIn,
                     .duration(duration), .delay(delay)])
        {
            completion?()
        }
    }
}

// MARK:- UITableViewCell

extension UITableViewCell
{
    override func springWithFade(delay: Double = 0.0, stiffness: CGFloat = 0, damping: CGFloat = 15.0, duration: Double = 2.0)
    {
        self.contentView.springWithFade(delay: delay, stiffness: stiffness, damping: damping, duration: duration)
    }
}
*/
