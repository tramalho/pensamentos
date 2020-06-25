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
    private let config = Settings.shared
    
    override func viewWillAppear(_ animated: Bool) {
        formatView()
        super.viewWillAppear(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    private func formatView() {
        let isDayColor = config.colorScheme == 0
        let backgroundNightColor = UIColor(red: 156.0/255, green: 68.0/255, blue: 15.0/255, alpha: 1.0)
        let authorColor = UIColor(red: 192.0/255, green: 96.0/255, blue: 49.0/255, alpha: 1.0)
        
        view.backgroundColor  = isDayColor ? .white : backgroundNightColor
        labelQuote.textColor  = isDayColor ? .black : .white
        labelAuthor.textColor = isDayColor ? authorColor : .yellow
        
        prepareQuote()
    }
    
    private func prepareQuote() {
        timer?.invalidate()
        if config.autoRefresh {
            timer = Timer.scheduledTimer(withTimeInterval: config.timeInverval, repeats: true) { (Timer) in
                self.showQuotes()
            }
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
