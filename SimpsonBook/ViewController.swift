//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Terry Jason on 2023/7/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let characterArray = [
        ["Homer Simpson", "Nuclear Safety", "Homer"],
        ["Marge Simpson", "Housewife", "Marge"],
        ["Bart Simpson", "Student", "Bart"],
        ["Lisa Simpson", "Student", "Lisa"],
        ["Maggie Simpson", "Baby", "Maggie"]
    ]
    
    var characterObject = [Simpson]()
    
    private var rightNowSimpson : Simpson!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    
        createCharater()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        var content = cell.defaultContentConfiguration()
        
        content.text = characterObject[indexPath.row].name
        
        cell.contentConfiguration = content
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rightNowSimpson = characterObject[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedSimpson = rightNowSimpson
        }
    }
    
    func createCharater() {
        for array in characterArray {
            let character = Simpson(name: array[0], job: array[1], image: UIImage(named: array[2])!)
            characterObject.append(character)
        }
    }
    
}

