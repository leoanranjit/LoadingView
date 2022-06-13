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
    }
    override func viewWillAppear(_ animated: Bool) {
    }
    
    // MARK: - IBAction Functions
    @IBAction func btnStartLoading(_ sender: Any) {
        loaderView.startLoading()
    }
    @IBAction func btnStopLoading(_ sender: Any) {
        loaderView.stopLoading()
    }
    
    // MARK: - Additional Functions

}

