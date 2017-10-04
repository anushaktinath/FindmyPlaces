//
//  LoadingView.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/20/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//
import UIKit

class LoadingView: UIView {
  
  private var container: UIView = UIView()
  private var loadingView: UIView = UIView()
  private var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
  var loadingViewSize: CGFloat = 80
  var centre: CGFloat = 0
  var activityIndicatorSize: CGFloat = 40
  var containerAlphaValue: Double = 0.3
  var loadingViewAlphaValue: Double = 0.7
  var conatinerRGB: UInt32 = 0xffffff
  var loadingViewRGB: UInt32 = 0x444444

  
  func showActivityIndicator(uiView: UIView) {
    container.frame = uiView.frame
    container.center = uiView.center
    container.backgroundColor = UIColor.colorFromHex(rgbValue: conatinerRGB, alpha: containerAlphaValue)
    loadingView.frame = CGRect(x:centre, y:centre, width:loadingViewSize, height:loadingViewSize)
    loadingView.center = uiView.center
    loadingView.backgroundColor = UIColor.colorFromHex(rgbValue: loadingViewRGB, alpha: loadingViewAlphaValue)
    loadingView.clipsToBounds = true
    loadingView.layer.cornerRadius = 10
    
    activityIndicator.frame = CGRect(x:centre, y:centre, width:activityIndicatorSize, height:activityIndicatorSize);
    activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
    activityIndicator.center = CGPoint(x:loadingView.frame.size.width / 2, y:loadingView.frame.size.height / 2);
    
    loadingView.addSubview(activityIndicator)
    container.addSubview(loadingView)
    uiView.addSubview(container)
    activityIndicator.startAnimating()
  }
  
  func hideActivityIndicator(uiView: UIView) {
    activityIndicator.stopAnimating()
    container.removeFromSuperview()
  }
  
}
