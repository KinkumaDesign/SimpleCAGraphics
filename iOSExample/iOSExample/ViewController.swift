//
//  ViewController.swift
//  
//  Created by Tasuku Maeda
//

import UIKit
import SimpleCAGraphics

class ViewController: UIViewController {

    @IBOutlet weak var menuTableView: UITableView!
    
    enum Menu: Int {
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
            return Menu.graphicsLayerController.rawValue + 1
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseId = "MenuCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseId)
        }
        if let cell = cell {
            let menu = Menu(rawValue: indexPath.row)
            cell.textLabel?.text = menu?.title
            cell.accessoryType = .disclosureIndicator
        }
        return cell!
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var nextViewController: UIViewController?
        
        switch indexPath.row {
        case Menu.basic.rawValue:
            nextViewController = createViewController(name: "BasicViewController")
        case Menu.layerController.rawValue:
            nextViewController = createViewController(name: "LayerControllerExample")
        case Menu.textLayerController.rawValue:
            nextViewController = createViewController(name: "TextLayerControllerExample")
        case Menu.rectLayerController.rawValue:
            nextViewController = createViewController(name: "RectLayerControllerExample")
        case Menu.circleLayerController.rawValue:
            nextViewController = createViewController(name: "CircleLayerControllerExample")
        default:
            break
        }
        
        if let nextViewController = nextViewController {
            navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}
