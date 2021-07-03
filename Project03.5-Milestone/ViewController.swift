//
//  ViewController.swift
//  Project03.5-Milestone
//
//  Created by Paul Willis on 01/07/2021.
//

import UIKit

class ViewController: UITableViewController {
    var flags = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Flag Viewer"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.contains("@") {
                let sanitisedItem = sanitiseString(string: item)
                flags.append(sanitisedItem)
            }
        }
        
        flags.sort()
        
    }
    
    func sanitiseString(string: String) -> String {
        return string.replacingOccurrences(of: "@2x.png", with: "").uppercased()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flag", for: indexPath)
        cell.textLabel?.text = flags[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = (flags[indexPath.row].lowercased() + "@2x.png")
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

