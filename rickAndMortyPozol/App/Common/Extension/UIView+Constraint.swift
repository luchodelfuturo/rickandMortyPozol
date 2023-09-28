//
//  UIView+Constraint.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 27/09/2023.
//

import UIKit
extension UIView {
    
    func setConstraint(
        top: NSLayoutYAxisAnchor? = nil,
        right: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        left: NSLayoutXAxisAnchor? = nil,
        pTop: CGFloat = 0,
        pRight: CGFloat = 0,
        pBottom: CGFloat = 0,
        pLeft: CGFloat = 0
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: pTop).isActive = true
        }
        
        if let right = right {
            trailingAnchor.constraint(equalTo: right, constant: -pRight).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -pBottom).isActive = true
        }
        
        if let left = left {
            leadingAnchor.constraint(equalTo: left, constant: pLeft).isActive = true
        }
    }

    func fillSuperView(widthPadding: CGFloat = .zero) {
        guard let superview = self.superview else { return }
        
        setConstraint(top: superview.topAnchor,
                      right: superview.trailingAnchor,
                      bottom: superview.bottomAnchor,
                      left: superview.leadingAnchor,
                      pTop: widthPadding,
                      pRight: widthPadding,
                      pBottom: widthPadding,
                      pLeft: widthPadding
        )
    }
}
