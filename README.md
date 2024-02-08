<p align="center">
<!--     <a href="https://github.com/yiisoft" target="_blank"> -->
        <img src="backend/web/images/iiumLogo.png" height="100px">
<!--     </a> -->
    <h1 align="center">IIUM Inbound/ OutBound System</h1>
    <br>
</p>

IIUM Inbound/ Outbound System is a user-friendly web application designed to facilitate students participating in International Exchange Programs.

Students can seamlessly apply to study at foreign University (Outbound) or foreign students apply to study at IIUM (Inbound), the system streamlines the application process. Allowing students to submit their application online, while providing International Affairs staff tools to manage and approve these applications.

By shifting from paperwork to online platforms, administrative burdens are significantly reduced, and offering more flexibility and convenience for both students and staff involved in the International Exchange Programs.


DIRECTORY STRUCTURE
-------------------

```
common
|-- backup/                      (contains backup files)
|-- config/                      (contains shared configurations)
|-- Helpers/                     (contains helper files used across multiple sections in the web app)
|-- mail/                        (contains view files for e-mails)
|-- models/                      (contains model classes used in both backend and frontend)
|-- tests/                       (contains tests for common classes)
|-- upload/                      (contains files uploaded by the user)

console
|-- config/                      (contains console configurations)
|-- controllers/                 (contains console controllers (commands))
|   |-- BackupController.php     (contains functions responsible for backing up data from database to a pre-specified directory in the server)
|   |-- ReminderController.php   (contains function responsible for reminding the user to upload files)
|-- migrations/                  (contains database migrations)
|-- models/                      (contains console-specific model classes)
|-- runtime/                     (contains files generated during runtime)

backend
|-- assets/                      (contains application assets such as JavaScript and CSS)
|-- config/                      (contains backend configurations)
|-- controllers/                 (contains Web controller classes)
|   |-- commonController/        (contains shared classes among controllers)
|   |-- CountryiesController.php (contains getters for countries/nationality and states)
|   |-- EmailTemplateController.php (contains email template update/view functions)
|   |-- WorkflowController.php   (contains approval process by either HOD, Kulliyyah, Dean, or AMAD)
|   |-- InboundController.php    (implements the CRUD actions, provides actions for searching, displaying logs, and performing custom actions like accept/reject/incomplete)
|   |-- KcdioController.php      (implements the CRUD actions)
|   |-- OutboundController.php   (implements the CRUD actions, provides actions for searching, displaying logs, and performing custom actions like accept/reject/incomplete)
|   |-- PocController.php        (implements the CRUD actions)
|   |-- SiteController.php       (Manages site-specific actions and configurations)
|   |-- StatusController.php     (implements the CRUD actions)
|   |-- UserController.php       (implements the CRUD actions)
|-- models/                      (contains backend-specific model classes)
|   |-- PasswordResetRequesForm.php
|   |-- ResetPasswordForm.php
|   |-- SignupForm.php
|   |-- UserAdmin.php
|-- runtime/                     (contains files generated during runtime)
|-- tests/                       (contains tests for backend application)
|-- views/                       (contains view files for the Web application)
|   |-- email/
|   |-- email-template/
|   |-- higherworkflow/          (user with token only)
|   |-- hodworkflow/             (user with token only)
|   |-- inbound/                 
|   |-- Kcdio/                   
|   |-- kulliyyahworkflow/       (user with token only)
|   |-- layout/
|   |-- outbound/
|   |-- Poc/
|   |-- reusable/                (dashboard commmon script between inbound and outbound dashboard)
|   |-- site/                    
|   |-- status/                  (admin only)
|   |-- user/                    (admin only)
|   |-- workflow/                (user with token only)
|-- web/                         (contains the entry script and Web resources)

frontend
|-- assets/                      (contains application assets such as JavaScript and CSS)
|-- config/                      (contains frontend configurations)
|-- controllers/                 (contains Web controller classes)
|   |-- InboundController.php
|   |-- outboundController.php
|   |-- siteController.php
|-- models/                      (contains frontend-specific model classes)
|-- runtime/                     (contains files generated during runtime)
|-- tests/                       (contains tests for frontend application)
|-- views/                       (contains view files for the Web application)
|   |-- inbound/                 (for inbound users only)
|   |-- outbound/                (for outobund users only)
|   |-- site/                    (Manages site-specific actions and configurations)
|-- web/                         (contains the entry script and Web resources)
|-- widgets/                     (contains frontend widgets)

vendor/                          (contains dependent 3rd-party packages)
environments/                    (contains environment-based overrides)
```
# Diagram
  <img src="https://github.com/YamenAlzeiter/IIUM/blob/master/IIUM%20docs/inbound%20diagram.jpg">
  <img src="https://github.com/YamenAlzeiter/IIUM/blob/master/IIUM%20docs/outbound%20diagram.jpg">

# Status Table
| Code | Inbound Application Status                                  | Code | Outbound Application Status                                |
|------|------------------------------------------------------------|------|------------------------------------------------------------|
| 5    | In progress, from Io, application submitted to Kulliyyah or other institutions. | 1    | In progress, from IO, application submitted to HOD.       |
| 6    | Application rejected by IO, return back to student.        | 2    | Application rejected by IO, return back to student.       |
| 7    | Incomplete application, return back to student.            | 3    | Incomplete application, return back to student.           |
| 15   | Application approved by Kulliyyah, return back to IO.      | 10   | In progress, application submitted by student to IO.      |
| 16   | Application rejected by Kulliyyah, return back to IO.      | 11   | Application approved by HOD, return to IO.                |
| 25   | In progress, pass by IO to AMAD/CPS.                      | 12   | Application rejected by HOD, return back to IO.           |
| 35   | Application Complete by AMAD/CPS Return back to IO.         | 21   | In progress, from IO, application submitted to Dean.      |
| 45   | Redirect to student, Upload proof of Payment/ Update Status. | 31   | Application approved by Dean, return to IO.               |
| 55   | Student upload documents, return to IO for verification.   | 32   | Application rejected by Dean, return to IO.               |
| 65   | Application is approved with complete upload documents, inform student. | 41   | Application return to student, upload documents.          |
|      |                                                            | 51   | Student upload documents, return to IO for verification. |
|      |                                                            | 61   | Application is approved with complete upload documents, inform student. |
|      |                                                            | 71   | Email send to applicant to upload images and videos.     |
|      |                                                            | 81   | Documents Uploaded before coming back to IIUM.          |

<p>you can visit <a href = "https://github.com/YamenAlzeiter/IIUM/tree/master/IIUM%20docs">this link </a> for more documentation</p>
