# إنشاء المجلدات الأساسية
mkdir -Force "lib"
mkdir -Force "lib\core"
mkdir -Force "lib\models"
mkdir -Force "lib\mock"
mkdir -Force "lib\features"
mkdir -Force "lib\features\auth"
mkdir -Force "lib\features\customer"
mkdir -Force "lib\features\helper"

# إنشاء الملفات الأساسية
New-Item -ItemType File "lib\main.dart" -Force | Out-Null

New-Item -ItemType File "lib\core\app_theme.dart" -Force | Out-Null
New-Item -ItemType File "lib\core\app_routes.dart" -Force | Out-Null

New-Item -ItemType File "lib\models\khidma_user.dart" -Force | Out-Null
New-Item -ItemType File "lib\models\service.dart" -Force | Out-Null
New-Item -ItemType File "lib\models\order.dart" -Force | Out-Null

New-Item -ItemType File "lib\mock\mock_data.dart" -Force | Out-Null

# شاشات الـ Auth
New-Item -ItemType File "lib\features\auth\onboarding_screen.dart" -Force | Out-Null
New-Item -ItemType File "lib\features\auth\role_selection_screen.dart" -Force | Out-Null
New-Item -ItemType File "lib\features\auth\customer_login_screen.dart" -Force | Out-Null
New-Item -ItemType File "lib\features\auth\helper_login_screen.dart" -Force | Out-Null

# شاشات العميل
New-Item -ItemType File "lib\features\customer\customer_home_screen.dart" -Force | Out-Null
New-Item -ItemType File "lib\features\customer\service_details_screen.dart" -Force | Out-Null
New-Item -ItemType File "lib\features\customer\searching_helper_screen.dart" -Force | Out-Null
New-Item -ItemType File "lib\features\customer\matched_helper_screen.dart" -Force | Out-Null
New-Item -ItemType File "lib\features\customer\mission_in_progress_screen.dart" -Force | Out-Null
New-Item -ItemType File "lib\features\customer\rating_payment_screen.dart" -Force | Out-Null
New-Item -ItemType File "lib\features\customer\payment_screen.dart" -Force | Out-Null
New-Item -ItemType File "lib\features\customer\customer_profile_screen.dart" -Force | Out-Null
New-Item -ItemType File "lib\features\customer\settings_screen.dart" -Force | Out-Null

# شاشات المساعد
New-Item -ItemType File "lib\features\helper\helper_home_screen.dart" -Force | Out-Null
New-Item -ItemType File "lib\features\helper\job_details_screen.dart" -Force | Out-Null
New-Item -ItemType File "lib\features\helper\helper_mission_tracking_screen.dart" -Force | Out-Null
New-Item -ItemType File "lib\features\helper\earnings_history_screen.dart" -Force | Out-Null

Write-Host "Khidma structure created successfully."
