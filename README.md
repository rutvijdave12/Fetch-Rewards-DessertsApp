# Fetch - iOS Coding Challenge

Take home project from Fetch Reward for the role of iOS Apprenticeship. 

Link to the assessment: [iOS Coding Challenge](https://fetch-hiring.s3.amazonaws.com/iOS+coding+exercise.pdf)

In this project, I have created the User interface with programmatic UI only using SwiftUI entirely (except for SafariView where I have used UIKit). I have added some extra features such as the Watch on YouTube button as it seemed more complete. Apart from this, I have also created some basic unit testing and UI Testing. The deployment target for this project is iOS 17.2.

## Features

- Alerts on loss of Internet connection or unexpected errors to avoid crashes.
- LoadingView and image placeholders are added before the data from API is fetched to avoid showing the users empty UI.
- The Watch on YouTube button with SafariView.

## Architecture

I have used the MVVM design pattern to architect the project where all my views have no knowledge about the business logic making it as modular as possible.

## Assumptions

- I have skipped entries which are empty in the JSON request.

## Scope of Improvement

- Testing could have been more thorough and targeted.
- App logo and the NavigationTitle for the DetailedView could have been scaled.


PS: I want to express my gratitude for the opportunity to work on this assessment. Prior to this project, I didn't have any experience with Swift or SwiftUI. However, I embraced the challenge and dedicated myself to learning these technologies within a week to complete the project. I'm thankful for the chance to delve into iOS development and am excited about the possibilities it presents. Thank you for helping me kickstart my journey into iOS development.
