
import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {

	var viewControllers: [UIViewController]!

	let pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)

	override func viewDidLoad() {
		viewControllers = [
			storyboard!.instantiateViewControllerWithIdentifier("Pink"),
			storyboard!.instantiateViewControllerWithIdentifier("Blue"),
			storyboard!.instantiateViewControllerWithIdentifier("Green"),
		]
	}

	@IBAction func loadPageController(sender: UIButton){

		pageViewController.dataSource = self

		//set first View Controller
		pageViewController.setViewControllers([viewControllers[0]], direction: .Forward, animated: true, completion: nil)

		// Add page view Controller as a child of the main View controller
		self.addChildViewController(pageViewController)

		// make pageview same size as current view
		pageViewController.view.frame = self.view.frame
		self.view.backgroundColor = .blackColor() //set background to black so the page indicators show.

		// Add view, and complete child view controller transition
		self.view.addSubview(pageViewController.view)
		pageViewController.didMoveToParentViewController(self)
	}

	func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
		guard let index = viewControllers.indexOf(viewController) else {
			return viewController //if the currently displayed on is not in the viewcontrollers list we have issues
		}
		guard (viewControllers.startIndex..<viewControllers.endIndex).contains(index + 1) else { //will the next one be in the array
			return nil
		}
		return viewControllers[index + 1]
	}
	func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
		guard let index = viewControllers.indexOf(viewController) else {
			return viewController //if the currently displayed on is not in the viewcontrollers list we have issues
		}
		guard (viewControllers.startIndex..<viewControllers.endIndex).contains(index - 1) else { //will the previous one be in the array
			return nil
		}
		return viewControllers[index - 1]
	}

	func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
		return viewControllers.count //how many buttons
	}

	func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
		return 0 //which button does the first VC correspond with
	}

}

class Pink: UIViewController{

}

class Blue: UIViewController{

}

class Green: UIViewController{

}