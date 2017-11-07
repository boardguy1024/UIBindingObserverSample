//
//  ViewController.swift
//  UIBindingObserver
//
//  Created by PIVOT on 2017/11/07.
//  Copyright © 2017年 PIVOT. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       bindUI()
    }
    
    private func bindUI() {
        textField.rx.text.asObservable()
            .map(toColor(from:))
            .bind(to: label.rx.back)
        
        
        
    }

    //문자수에서 컬러를 계산하는 메소드
    private func toColor(from text: String?) -> UIColor {
        let isEven = ((text ?? "").count % 2 == 0)
        let color = isEven ? UIColor.blue : UIColor.yellow
        return color
    }

}



























