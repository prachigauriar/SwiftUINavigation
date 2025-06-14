# Navigator

A small app used to demonstrate how to implement navigation in a SwiftUI app using `NavigationPath`.

The app shows how to implement deep linking, and how to use simple data types in a navigation path to
implement navigation, including programmatic navigation.


## Architecture

The app uses a MVVM architecture, with an app model and scene models for each of the app’s scenes (of
which there is only one).

The app model is called `NavigatorAppModel`. Its only responsibility is to create scene models. It
has a corresponding `NavigatorApp`, which simply creates a scene using its scene model.

There is one scene model, called `ExperiencePickerSceneModel`. It stores the scene’s `NavigationPath`
and implements the `NavigationPathProviding` protocol to provide access to that path to other view
models that need it. It also has a function to navigate to a URL. The corresponding scene sets up the
scene’s navigation stack with the scene model’s navigation path, and sets its initial contents to
an experience picker view.

The app contains views for

  - **Experience Picker**: A list that allows you to choose between a Product Grid or Product List
    experience. The view has a button that randomly selects an experience. This button triggers view
    model logic that updates the scene’s navigation path.
  - **Product Grid**: A grid of product items. Selecting an item takes you to Product Detail screen.
  - **Product List**: A list of product items. Selecting an item takes you to Product Detail screen.
  - **Product Detail**: A screen showing a product item.

The model layer for this app is small, as it’s meant to demonstrate UI. There is a `Product` type that
represents a product, and a `ProductDataSource` that has a (hardcoded) array of products.


## Navigation Path Elements

Each view type has different expected navigation path elements.

  - `ExperiencePicker` uses `Experience` to represent its navigation path components.
  - `ProductGrid` and `ProductList` use `ProductID`s to represent their navigation path components.


## Deep Linking

The app includes support for deep linking, with the following URLs:

  - **navigator:///grid/_productID_**: Navigates to a Product Detail screen via the Product Grid
    experience. _productID_ is the ID of the product to be displayed. When navigation is complete,
    the navigation stack will be `ExperiencePickerView ⏵ ProductGridView ⏵ ProductDetail`.
  - **navigator:///list/_productID_**: Navigates to a Product Detail screen via the Product List
    experience. _productID_ is the ID of the product to be displayed. When navigation is complete,
    the navigation stack will be `ExperiencePickerView ⏵ ProductListView ⏵ ProductDetail`.
