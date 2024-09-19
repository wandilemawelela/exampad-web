
# Exampad

#### Introduction


Exampad is your ultimate quiz platform for learning and growth. Designed with a focus on gamification, Exampad allows learners to create and take quizzes tailored to their grade and subject. The platform includes features such as customizable quizzes, a gamified experience with points and leaderboards, and teacher accounts for quiz management.

# Installation
### 1. Install Dependencies
```
bundle install
yarn install
```

### 2. Setup the Database
```
rails db:create
rails db:migrate
rails db:seed
```

### 3. Run the Application
```
rails server
```

### 4. Visit the application
Open your web browser and go to http://localhost:3000


# Usage
* Teachers: Create and manage quizzes.
* Students: Take quizzes, earn points, and climb the leaderboards.
* Parents: View student progress and quiz results.

# Contributing
Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are greatly appreciated.

1. Fork the Project
2. Create your Feature Branch
3. Create feature Branch
```
git checkout -b feature/AmazingFeature
```
4. Commit your Changes
```
git commit -m 'Add some AmazingFeature'
```
5. Push to the Branch
```
git push origin feature/AmazingFeature
```
6. Open a Pull Request

# Licensing
Distributed under the MIT License. See LICENSE for more information.

# Corrective and Preventative Measures
#### Improvements

1. Enhanced Load Balancer Configuration Reviews: Implement a more rigorous review process for load balancer configurations to prevent similar issues in the future.
2. Improved Monitoring and Alerting: Expand monitoring to include load balancer traffic distribution metrics, allowing for earlier detection of misconfigurations.
3. Incident Response Training: Conduct training sessions for the engineering team to improve response times and accuracy in identifying root causes during incidents.

#### Tasks
1. Audit Load Balancer Configuration: Perform a full audit of the current load balancer configurations across all environments.
2. Implement Monitoring for Load Balancer Metrics: Set up monitoring and alerts for load balancer traffic distribution and CPU utilization across servers.
3. Run a Load Balancer Configuration Validation Script: Develop and deploy a script to validate load balancer configurations before deployment.
4. Conduct Post-Incident Training: Schedule training for all engineers on the incident and lessons learned, emphasizing the importance of thorough investigation and cross-team collaboration.

This postmortem outlines the key events, root causes, and corrective actions related to the service outage on August 12, 2024. The steps outlined in the corrective and preventative measures section will be implemented to reduce the likelihood of similar incidents occurring in the future.

