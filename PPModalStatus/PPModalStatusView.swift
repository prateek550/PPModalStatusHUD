//
//  PPModalStatusView.swift
//  PPModalStatus
//
//  Created by Prateek Pande on 15/03/19.
//  Copyright © 2019 Prateek Pande. All rights reserved.
//

import UIKit

public class PPModalStatusView: UIView {
    
    //    MARK: Outlets
    @IBOutlet private weak var statusImageView: UIImageView!
    @IBOutlet private weak var statusHeadingLbl: UILabel!
    @IBOutlet private weak var statusDescriptionLbl: UILabel!
    
    //    MARK: Attributes
    private let hideAfter: TimeInterval = 2.0
    private let animationDuration: TimeInterval = 0.4
    private let nibIdentifier = "PPModalStatusView"
    private var contentView: UIView!
    
    //    MARK: Setup
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView(){

        let bundle = Bundle(for: type(of: self))    // Get the bundle which adds this framework
        let nib = UINib(nibName: nibIdentifier, bundle: bundle) // Instantiate the nib, which is available in current bundle
        contentView = (nib.instantiate(withOwner: self, options: nil).first as! UIView)
        addSubview(contentView)
        
        contentView.center = self.center
        contentView.autoresizingMask = []
        contentView.alpha = 0.0
        contentView.translatesAutoresizingMaskIntoConstraints = true
        
        statusHeadingLbl.text = ""
        statusDescriptionLbl.text = ""
    }
    
    public override func layoutSubviews() {
        contentView.layer.masksToBounds = true
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 10
    }
    
    //    MARK: Auto hide the status HUD
    public override func didMoveToSuperview() {
        
        contentView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: animationDuration,
                       animations: {
                        self.contentView.alpha = 1.0
                        self.contentView.transform = .identity
        }) { (_) in
            Timer.scheduledTimer(timeInterval: self.hideAfter,
                                 target: self,
                                 selector: #selector(self.removeSelf),
                                 userInfo: nil,
                                 repeats: false)
        }
    }
    
    @objc private func removeSelf(){
        
        UIView.animate(withDuration: animationDuration,
                       animations: {
                        self.contentView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                        self.contentView.alpha = 0.0
        }) { (_) in
            self.removeFromSuperview()
        }
    }
    
    //    MARK: Accessible methods
    
    /**
     Set status image, status header text and status description text.
     - Note: Status header & description text will be updated only if provided. nil will be skipped.
     - Parameters:
        - image: status image will be shown at the top center
        - headerText: header text will be placed below the image
        - descriptionText: (optional)description text will be placed below the header text.
     */
    public func set(image: UIImage?=nil, headerText: String?=nil, descriptionText: String?=nil){
        
        statusImageView.image = image
        if let headerText = headerText{
            statusHeadingLbl.text = headerText
        }
        if let descriptionText = descriptionText{
            statusDescriptionLbl.text = descriptionText
        }
    }
}
