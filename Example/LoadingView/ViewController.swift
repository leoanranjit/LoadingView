//
//  ViewController.swift
//  LoadingView
//
//  Created by leoanranjit on 06/13/2022.
//  Copyright (c) 2022 leoanranjit. All rights reserved.
//

import UIKit
import LoadingView


class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var loaderView: LoadingView!
    
    // MARK: - Constants and variables
    
    // MARK: - ViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.title = "Loading View"
    }
    override func viewWillAppear(_ animated: Bool) {
    }
    
    // MARK: - IBAction Functions
    @IBAction func btnStartLoading(_ sender: Any) {
        loaderView.startLoading(type: .dots)
    }
    @IBAction func btnStartShimmer(_ sender: Any) {
        loaderView.startShimmering()
    }
    @IBAction func btnStartIndicator(_ sender: Any) {
        loaderView.startLoading(type: .indicator)
    }
    @IBAction func btnStopLoading(_ sender: Any) {
        loaderView.stopLoading()
        loaderView.stopShimmering()
        self.stopLoadingLeft()
        self.stopLoadingRight()
    }
    @IBAction func btnLeftLoader(_ sender: Any) {
        self.startLoadingLeft(color: .systemBlue)
    }
    
    @IBAction func btnRightLoader(_ sender: Any) {
        self.startLoadingRight(color: .systemOrange)
    }
    
    
    // MARK: - Additional Functions

}

