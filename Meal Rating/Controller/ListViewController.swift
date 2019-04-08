//
//  ListViewController.swift
//  Meal Rating
//
//  Created by Denis Bystruev on 08/04/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    var meals = [Meal]()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadMeals()
        setupUI()
    }
    
    func saveMeals() {
        // TODO: save the meals
    }
    
    func loadMeals() {
        meals = Meal.loadSample()
    }
    
    func setupUI() {
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell")!
        
        configure(cell: cell, with: meal)
        
        return cell
    }
}

// MARK: - Custom Methods
extension ListViewController {
    func configure(cell: UITableViewCell, with meal: Meal) {
        cell.imageView?.image = meal.photo
        cell.textLabel?.text = meal.name
        cell.detailTextLabel?.text = meal.stars
    }
}
