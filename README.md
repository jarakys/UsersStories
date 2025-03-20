I used the Kingfisher library because it is fast and supports background decoding, unlike AsyncImage. This is an excellent, advanced technology that efficiently handles caching and image loading.

Regarding custom libraries, I integrated my own UIKit-to-SwiftUI bridge, which is available on my GitHub. This was necessary to achieve horizontal scrolling with cell reuse, as SwiftUI does not provide a native solution for efficient horizontal scrolling with reuse. LazyStack and similar solutions were avoided due to their high memory consumption, as they do not support item reuse. This means that in an infinite scroll scenario, memory usage would continue to grow uncontrollably.

The application follows a modular architecture.

There is a root component that manages the flow of Users and allows seamless integration. Everything is structured using protocols, enabling easy unit testing and mock service injection.

### UI Overview:
- The main screen displays a list of users.
- Users can be selected to view their stories.
- Each story can be opened and explored.
- Currently, all users share the same set of stories, so liked and viewed stories appear identical for everyone. This can be resolved with API adjustments.

### Features Implemented:
- Dynamic pagination for Users and Stories, with smooth loading indicators.
- Ideally, a shared `PaginationViewModel` could be used for handling pagination logic, but due to time constraints, it was not implemented. A significant amount of time was spent developing the API.
- The project could benefit from further modularization into an SPM package for better maintainability.

Additionally, I showcased my flexible approach to navigation in SwiftUI, which has already been tested in commercial projects and proven to be efficient and scalable.

PS: I forget to add error handling, we can do that easy, using .alert(isPresented: error:)..., on UsersView and StoriesView
