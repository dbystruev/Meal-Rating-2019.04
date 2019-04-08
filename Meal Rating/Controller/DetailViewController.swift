//
//  DetailViewController.swift
//  Meal Rating
//
//  Created by Denis Bystruev on 08/04/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    var meal: Meal?
}

// MARK: - UIViewController Methods
extension DetailViewController {
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupUI()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        updateUI(with: size)
    }
}

// MARK: - Custom Methods
extension DetailViewController {
    func setupUI() {
        guard let meal = meal else { return }
        
        photoImageView.image = meal.photo
        nameLabel.text = meal.name
        timestampLabel.text = meal.date
        ratingLabel.text = meal.stars
        notesLabel.text = meal.notes
        
        updateUI(with: view.frame.size)
    }
    
    func updateUI(with size: CGSize) {
        topStackView.axis = size.width < size.height ? .vertical : .horizontal
    }
}
