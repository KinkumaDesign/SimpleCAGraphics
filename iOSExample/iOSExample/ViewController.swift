//
//  ViewController.swift
//  
//  Created by Tasuku Maeda
//

import UIKit
import SimpleCAGraphics

class ViewController: UIViewController {

    @IBOutlet weak var menuTableView: UITableView!
    
    enum Sections: Int {
        case basicExample = 0
        case practicalExample
        var title: String {
            switch self {
            case .basicExample:
                return "Basic Example"
            case .practicalExample:
                return "Practical Example"
            }
        }
        static var count: Int {
            return Sections.practicalExample.rawValue + 1
        }
    }
    
    enum BasicExampleMenu: Int {
        case basic = 0
        case layerController
        case textLayerController
        case rectLayerController
        case circleLayerController
        case graphicsLayerController
        
        var title: String {
            switch self {
            case .basic:
                return "Basic"
            case .layerController:
                return "LayerController"
            case .textLayerController:
                return "TextLayerController"
            case .rectLayerController:
                return "RectLayerController"
            case .circleLayerController:
                return "CircleLayerController"
            case .graphicsLayerController:
                return "GraphicsLayerController"
            }
        }
        
        
        /// Total count of menus
        static var count: Int {
            // must change if last menu has been changed
            return BasicExampleMenu.graphicsLayerController.rawValue + 1
        }
    }
    
    enum PracticalExampleMenu: Int {
        case barChart = 0
        var title: String {
            switch self {
            case .barChart:
                return "Bar Chart"
            }
        }
        static var count: Int {
            return PracticalExampleMenu.barChart.rawValue + 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "SimpleCAGraphics Example"
    }
    
    func createViewController(name: String) -> UIViewController? {
        let sb = UIStoryboard(name: name, bundle: nil)
        return sb.instantiateInitialViewController()
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return BasicExampleMenu.count
        case 1:
            return PracticalExampleMenu.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseId = "MenuCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseId)
        }
        if let cell = cell {
            switch indexPath.section {
            case 0:
                let menu = BasicExampleMenu(rawValue: indexPath.row)
                cell.textLabel?.text = menu?.title
            case 1:
                let menu = PracticalExampleMenu(rawValue: indexPath.row)
                cell.textLabel?.text = menu?.title
            default:
                break
            }
            cell.accessoryType = .disclosureIndicator
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Sections(rawValue: section)?.title
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var nextViewController: UIViewController?
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case BasicExampleMenu.basic.rawValue:
                nextViewController = createViewController(name: "BasicViewController")
            case BasicExampleMenu.layerController.rawValue:
                nextViewController = createViewController(name: "LayerControllerExample")
            case BasicExampleMenu.textLayerController.rawValue:
                nextViewController = createViewController(name: "TextLayerControllerExample")
            case BasicExampleMenu.rectLayerController.rawValue:
                nextViewController = createViewController(name: "RectLayerControllerExample")
            case BasicExampleMenu.circleLayerController.rawValue:
                nextViewController = createViewController(name: "CircleLayerControllerExample")
            case BasicExampleMenu.graphicsLayerController.rawValue:
                nextViewController = createViewController(name: "GraphicsLayerControllerExample")
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case PracticalExampleMenu.barChart.rawValue:
                print("practical")
            default:
                break
            }
        default:
            break
        }

        
        if let nextViewController = nextViewController {
            navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}
