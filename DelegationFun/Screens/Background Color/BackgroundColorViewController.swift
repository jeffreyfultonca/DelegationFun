import UIKit

// MARK: - BackgroundColorViewController

class BackgroundColorViewController: UIViewController {
    
    // MARK: - Actions
    
    @IBAction func showMeColorPickerTapped(_ sender: Any) {
        // We'll get an instance of ColorPickerViewController from the ColorPicker.storyboard. Note I'm force unwrapping via `as!` which is dangerous and probably not a good idea to do in production... but I'm lazy for this demo!
        let colorPickerViewController = UIStoryboard(name: "ColorPicker", bundle: .main)
            .instantiateInitialViewController() as! ColorPickerViewController
       
        // This is exactly the same as UITableView, or UICollectionView, or 100 other Cocoa types. See ColorPickerViewController.swift for details on what's happing inside the class. The only requirement for this to work here is `self` needs to conform to the ColorPickerViewControllerDelegate protocol, which it does via the `extension` below.
        colorPickerViewController.delegate = self
        
        // Present the ColorPickerViewController onscreen.
        self.present(colorPickerViewController, animated: true)
    }
}

// MARK: - ColorPickerViewControllerDelegate

// Conform to the ColorPickerViewControllerDelegate so instances of this type can serve as the delegate for ColorPickerViewController instances, like we do above.
extension BackgroundColorViewController: ColorPickerViewControllerDelegate {
    
    // This function will be called by ColorPickerViewController instances when a user selects a color. Of course that's only true when this instance has been set as the ColorPickerViewController's delegate as we have above.
    func didPickColor(color: UIColor?) {
        self.view.backgroundColor = color
        self.dismiss(animated: true)
    }
}
