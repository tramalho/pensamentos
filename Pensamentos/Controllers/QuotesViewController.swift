//
//  QuotesViewController.swift
//  Pensamentos
//
//  Created by Thiago Antonio Ramalho on 21/06/20.
//  Copyright © 2020 Tramalho. All rights reserved.
//

import UIKit

class QuotesViewController: UIViewController {

    @IBOutlet weak var backgroundPhoto: UIImageView!
    @IBOutlet weak var personPhoto: UIImageView!
    @IBOutlet weak var labelQuote: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var constraintQuotesTop: NSLayoutConstraint!
    
    private let quoteManager = QuotesManager()
    private var timer: Timer?
    
    override func viewWillAppear(_ animated: Bool) {
        prepareQuote()
        super.viewWillAppear(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    private func prepareQuote() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 8.0, repeats: true) { (Timer) in
            self.showQuotes()
        }
        showQuotes()
    }
    
    private func showQuotes() {
        let randomQuote = quoteManager.getRandomQuote()
        labelQuote.text = randomQuote.quoteFormatted
        labelAuthor.text = randomQuote.authorFormatted
        personPhoto.image = UIImage(named: randomQuote.image)
        backgroundPhoto.image = personPhoto.image
        
        settingAlpha(value: 0.0, background: 0.0, constraint: 50)
        
        UIView.animate(withDuration: 6.0) {
            self.settingAlpha(value: 1.0, background: 0.25, constraint: 10)
        }
    }
    
    private func settingAlpha(value: Double, background: Double, constraint: Double) {
        labelQuote.alpha = CGFloat(value)
        labelAuthor.alpha = CGFloat(value)
        personPhoto.alpha = CGFloat(value)
        backgroundPhoto.alpha = CGFloat(background)
        constraintQuotesTop.constant = CGFloat(constraint)
        view.layoutIfNeeded()
    }
}
