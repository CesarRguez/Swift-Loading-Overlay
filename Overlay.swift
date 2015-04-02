//
//  Overlay.swift
//
//  Created by Some mexican developer on 01/04/15.
//  Copyright (c) 2015 AnyObject?. All rights reserved.
//

import UIKit

public class Overlay{
    
    class var shared: Overlay {
        struct Static {
            static let instance: Overlay = Overlay()
        }
        return Static.instance
    }
    
    var overlayView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    
    public func showOverlay(view: UIView){
        //creating overlay
        overlayView.frame = CGRectMake(0, 0, CGRectGetWidth(view.bounds), CGRectGetHeight(view.bounds))
        overlayView.center = view.center
        overlayView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.7)
        overlayView.clipsToBounds = true
        
        //creating activityIndicator
        activityIndicator.frame = CGRectMake(0, 0, 37, 37)
        activityIndicator.activityIndicatorViewStyle = .WhiteLarge
        activityIndicator.center = CGPointMake(view.bounds.width / 2, view.bounds.height / 2)

        //adding subviews
        overlayView.addSubview(activityIndicator)
        view.addSubview(overlayView)
        
        overlayView.bringSubviewToFront(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    public func showOverlayWithCustomColor(view: UIView, color: UIColor){
        //creating overlay
        overlayView.frame = CGRectMake(0, 0, CGRectGetWidth(view.bounds), CGRectGetHeight(view.bounds))
        overlayView.center = view.center
        overlayView.backgroundColor = color
        overlayView.clipsToBounds = true

        //creating activityIndicator
        activityIndicator.frame = CGRectMake(0, 0, 37, 37)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = .WhiteLarge
        activityIndicator.center = CGPointMake(view.bounds.width / 2, view.bounds.height / 2)

        //adding subviews
        overlayView.addSubview(activityIndicator)
        view.addSubview(overlayView)
        
        overlayView.bringSubviewToFront(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    public func hideOverlay(){
        //remove views
        activityIndicator.stopAnimating()
        overlayView.removeFromSuperview()
    }
    
    
}
