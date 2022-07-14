//
//  LoadingIndicators.swift
//  InteractiveButtons
//
//  Created by Leoan Ranjit on 5/13/22.
//

import Foundation
import UIKit

enum Color {
    case black,white
}
enum Direction : String {
    case inward = "inward"
    case outward = "outward"
}

public class LoadingView: UIView{
    
    @IBInspectable
    var expandSize: CGFloat{
        get{
            return size
        }
        set{
            self.size = newValue
        }
    }
    
    @IBInspectable
    var cornerRadius : CGFloat{
        get{
            return self.layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
    @IBInspectable
    var borderWidth : CGFloat{
        get{
            return self.layer.borderWidth
        }
        set{
            self.layer.borderWidth = newValue
        }
    }
    @IBInspectable
    var borderColor : UIColor{
        get{
            return UIColor(cgColor: self.layer.borderColor ?? UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0).cgColor)
        }
        set{
            self.layer.borderColor = newValue.cgColor
        }
    }
    @IBInspectable
    var shadowColor : UIColor{
        get{
            return UIColor(cgColor: self.layer.shadowColor ?? UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0).cgColor)
        }
        set{
            self.layer.shadowColor = newValue.cgColor
        }
    }
    @IBInspectable
    var shadowOpacity : Float{
        get{
            return self.layer.shadowOpacity
        }
        set{
            self.layer.shadowOpacity = newValue
        }
    }
    @IBInspectable
    var shadowRadius : CGFloat{
        get{
            return self.layer.shadowRadius
        }
        set{
            self.layer.shadowRadius = newValue
        }
    }
    @IBInspectable
    var shadowOffset : CGSize{
        get{
            return self.layer.shadowOffset
        }
        set{
            self.layer.shadowOffset = newValue
        }
    }
    
    open var dotSize: CGFloat  = 6.0
    @IBInspectable
    var _dotSize : CGFloat = 6.0{
        didSet{
            dotSize = _dotSize
        }
    }
    
    open var dotOneColor : UIColor = .black
    @IBInspectable
    var _dotOneColor : UIColor = .white{
        didSet{
            dotOneColor = _dotOneColor
        }
    }
    
    open var dotTwoColor : UIColor = .black
    @IBInspectable
    var _dotTwoColor : UIColor = .white{
        didSet{
            dotTwoColor = _dotTwoColor
        }
    }
    
    open var dotThreeColor : UIColor = .black
    @IBInspectable
    var _dotThreeColor : UIColor = .white{
        didSet{
            dotThreeColor = _dotThreeColor
        }
    }
    
    open var spacing : CGFloat = 3
    @IBInspectable
    var _spacing : CGFloat = 3{
        didSet{
            spacing = _spacing
        }
    }
    
    open var duration : CGFloat = 0.4
    @IBInspectable
    var _duration : CGFloat = 0.4{
        didSet{
            duration = _duration
        }
    }
    
    open var translation : CGFloat = 3
    @IBInspectable
    var _translation : CGFloat = 3{
        didSet{
            translation = _translation
        }
    }
    
    
    
    var btnTitle = ""
    var btnImage = UIImage()
    var isLoading = false
    var size = 0.97
    
    let container = UIView(frame: CGRect.zero)
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()
    let stackView = UIStackView()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    // MARK: - ViewController Functions
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true
        DispatchQueue.main.async {
            self.container.layer.cornerRadius = self.container.bounds.height / 2
            self.container.layer.shadowColor = UIColor.black.cgColor
            self.container.layer.shadowOffset = CGSize(width: 0, height: 0)
            self.container.layer.shadowRadius = 8
            self.container.layer.shadowOpacity = 0.1
            self.container.backgroundColor = .white
            self.container.alpha = 1
            
            self.view1.layer.cornerRadius = self.view1.layer.frame.width/2
            self.view1.clipsToBounds = true
            self.view2.layer.cornerRadius = self.view2.layer.frame.width / 2
            self.view2.clipsToBounds = true
            self.view3.layer.cornerRadius = self.view3.layer.frame.width / 2
            self.view3.clipsToBounds = true
        }
    }
    
    public func startLoading() {
        if !isLoading{
            isLoading = true
            //View 1
            view1.backgroundColor = dotOneColor
            view1.heightAnchor.constraint(equalToConstant: dotSize).isActive = true
            view1.widthAnchor.constraint(equalToConstant: dotSize).isActive = true
            view1.alpha = 0
            
            //View 2
            view2.backgroundColor = dotTwoColor
            view2.heightAnchor.constraint(equalToConstant: dotSize).isActive = true
            view2.widthAnchor.constraint(equalToConstant: dotSize).isActive = true
            view2.alpha = 0
            
            //View 3
            view3.backgroundColor = dotThreeColor
            view3.heightAnchor.constraint(equalToConstant: dotSize).isActive = true
            view3.widthAnchor.constraint(equalToConstant: dotSize).isActive = true
            view3.alpha = 0
            
            //Stack View
            stackView.axis = .horizontal
            stackView.distribution = .equalSpacing
            stackView.alignment = .center
            stackView.spacing = spacing
            stackView.addArrangedSubview(view1)
            stackView.addArrangedSubview(view2)
            stackView.addArrangedSubview(view3)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            container.addSubview(stackView)
            
            //Layout for Stack View
            stackView.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
            stackView.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
            
            //Animating Views
            UIView.animate(withDuration: 0.05) {
                self.view1.alpha = 1
            }
            UIView.animate(withDuration: duration, delay: 0, options: [.repeat, .autoreverse] , animations: {
                self.view1.transform = CGAffineTransform(translationX: 0, y: -self.translation/2)
                self.view1.transform = CGAffineTransform(translationX: 0, y: self.translation/2)
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + duration/2) {
                UIView.animate(withDuration: 0.1) {
                    self.view2.alpha = 1
                }
                UIView.animate(withDuration: self.duration, delay: 0, options: [.repeat, .autoreverse] , animations: {
                    self.view2.transform = CGAffineTransform(translationX: 0, y: -self.translation/2)
                    self.view2.transform = CGAffineTransform(translationX: 0, y: self.translation/2)
                })
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                UIView.animate(withDuration: 0.1) {
                    self.view3.alpha = 1
                }
                UIView.animate(withDuration: self.duration, delay: 0, options: [.repeat, .autoreverse] , animations: {
                    self.view3.transform = CGAffineTransform(translationX: 0, y: -self.translation/2)
                    self.view3.transform = CGAffineTransform(translationX: 0, y: self.translation/2)
                })
                
            }
            
            self.addSubview(container)
            container.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                container.heightAnchor.constraint(equalToConstant: 40),
                container.widthAnchor.constraint(equalToConstant: 80),
                container.topAnchor.constraint(equalTo: self.topAnchor, constant: -container.bounds.height),
                container.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            ])
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: CGFloat(0.80), initialSpringVelocity: CGFloat(10), options: UIView.AnimationOptions.allowUserInteraction, animations: {
                self.container.transform = CGAffineTransform(translationX: 0, y: self.container.bounds.height + 8)
            }, completion: { Void in()  }
            )
            //View 1
            view1.backgroundColor = dotOneColor
            view1.heightAnchor.constraint(equalToConstant: dotSize).isActive = true
            view1.widthAnchor.constraint(equalToConstant: dotSize).isActive = true
            view1.alpha = 0
            
            //View 2
            view2.backgroundColor = dotTwoColor
            view2.heightAnchor.constraint(equalToConstant: dotSize).isActive = true
            view2.widthAnchor.constraint(equalToConstant: dotSize).isActive = true
            view2.alpha = 0
            
            //View 3
            view3.backgroundColor = dotThreeColor
            view3.heightAnchor.constraint(equalToConstant: dotSize).isActive = true
            view3.widthAnchor.constraint(equalToConstant: dotSize).isActive = true
            view3.alpha = 0
            
            //Stack View
            stackView.axis = .horizontal
            stackView.distribution = .equalSpacing
            stackView.alignment = .center
            stackView.spacing = spacing
            stackView.addArrangedSubview(view1)
            stackView.addArrangedSubview(view2)
            stackView.addArrangedSubview(view3)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            container.addSubview(stackView)
            
            //Layout for Stack View
            stackView.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
            stackView.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
            
            //Animating Views
            UIView.animate(withDuration: 0.05) {
                self.view1.alpha = 1
            }
            UIView.animate(withDuration: duration, delay: 0, options: [.repeat, .autoreverse] , animations: {
                self.view1.transform = CGAffineTransform(translationX: 0, y: -self.translation/2)
                self.view1.transform = CGAffineTransform(translationX: 0, y: self.translation/2)
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + duration/2) {
                UIView.animate(withDuration: 0.1) {
                    self.view2.alpha = 1
                }
                UIView.animate(withDuration: self.duration, delay: 0, options: [.repeat, .autoreverse] , animations: {
                    self.view2.transform = CGAffineTransform(translationX: 0, y: -self.translation/2)
                    self.view2.transform = CGAffineTransform(translationX: 0, y: self.translation/2)
                })
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                UIView.animate(withDuration: 0.1) {
                    self.view3.alpha = 1
                }
                UIView.animate(withDuration: self.duration, delay: 0, options: [.repeat, .autoreverse] , animations: {
                    self.view3.transform = CGAffineTransform(translationX: 0, y: -self.translation/2)
                    self.view3.transform = CGAffineTransform(translationX: 0, y: self.translation/2)
                })
                
            }
            
            self.addSubview(container)
            container.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                container.heightAnchor.constraint(equalToConstant: 40),
                container.widthAnchor.constraint(equalToConstant: 80),
                container.topAnchor.constraint(equalTo: self.topAnchor, constant: -container.bounds.height),
                container.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            ])
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: CGFloat(0.80), initialSpringVelocity: CGFloat(10), options: UIView.AnimationOptions.allowUserInteraction, animations: {
                self.container.transform = CGAffineTransform(translationX: 0, y: self.container.bounds.height + 8)
            }, completion: { Void in()  }
            )
            
        }
        
    }
    
    public func stopLoading(){
        isLoading = false
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: CGFloat(0.80), initialSpringVelocity: CGFloat(10), options: UIView.AnimationOptions.allowUserInteraction, animations: {
            self.container.transform = .identity
            self.container.alpha = 0
        }) { completed in
            self.container.removeFromSuperview()
        }
    }
}

extension UIViewController{
    
    public func startLoadingLeft(color: UIColor) {
        if #available(iOS 13.0, *) {
            let indicator = UIActivityIndicatorView(activityIndicatorStyle: .medium)
            indicator.color = color
            indicator.startAnimating()
            let barButton = UIBarButtonItem(customView: indicator)
            self.navigationItem.setLeftBarButton(barButton, animated: true)
        } else {
            let indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
            indicator.color = color
            indicator.startAnimating()
            let barButton = UIBarButtonItem(customView: indicator)
            self.navigationItem.setLeftBarButton(barButton, animated: true)
        }
    }
    
    public func startLoadingRight(color: UIColor) {
        if #available(iOS 13.0, *) {
            let indicator = UIActivityIndicatorView(activityIndicatorStyle: .medium)
            indicator.color = color
            indicator.startAnimating()
            let barButton = UIBarButtonItem(customView: indicator)
            self.navigationItem.setRightBarButton(barButton, animated: true)
        } else {
            let indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
            indicator.color = color
            indicator.startAnimating()
            let barButton = UIBarButtonItem(customView: indicator)
            self.navigationItem.setRightBarButton(barButton, animated: true)
        }
    }
    
    public func stopLoadingRight(){
        self.navigationItem.setRightBarButton(UIBarButtonItem(), animated: true)
    }
    
    public func stopLoadingLeft(){
        self.navigationItem.setLeftBarButton(UIBarButtonItem(), animated: true)
    }
    
}
