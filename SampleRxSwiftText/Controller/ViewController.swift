//
//  ViewController.swift
//  SampleRxSwiftText
//
//  Created by 祥平 on 2021/12/11.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.messageLabel.text = "Tap Login"
            })
            .disposed(by: disposeBag)

    }


}

