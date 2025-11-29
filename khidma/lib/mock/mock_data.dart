import '../models/service.dart';
import '../models/khidma_user.dart';
import '../models/order.dart';

final mockServices = <Service_model>[
  Service_model(
    id: '1',
    title: 'خدمات المشاوير والمرافقة',
    description: 'خدمات النقل والمرافقة الشخصية لمشاويرك وأطفالك.',
    categoryIcon: 'assets/icons/car.png',
    price: 150,
    duration: '3 ساعات',
  ),
  Service_model(
    id: '2',
    title: 'خدمات منزلية خفيفة',
    description: 'المساعدة في الأعمال المنزلية البسيطة.',
    categoryIcon: 'assets/icons/home.png',
    price: 120,
    duration: '2 ساعة',
  ),
  Service_model(
    id: '3',
    title: 'خدمات الشركات والمكاتب',
    description: 'حلول متكاملة للشركات الصغيرة والمتوسطة.',
    categoryIcon: 'assets/icons/office.png',
    price: 250,
    duration: '3 ساعات',
  ),
];

final helperUser = KhidmaUser(
  id: 'h1',
  name: 'أحمد الفالح',
  role: 'helper',
  city: 'القاهرة',
  rating: 4.8,
  avatarUrl: '',
);

final mockClientOrders = <Order>[
  Order(
    id: 'o1',
    title: 'خدمات مشاوير داخل المدينة',
    location: 'مدينة نصر، القاهرة',
    dateTime: DateTime.now().subtract(const Duration(days: 1)),
    price: 120,
    status: 'completed',
  ),
  Order(
    id: 'o2',
    title: 'خدمات أطفال بعد المدرسة',
    location: 'مدينة نصر، القاهرة',
    dateTime: DateTime.now().subtract(const Duration(days: 3)),
    price: 150,
    status: 'completed',
  ),
];

final mockHelperJobs = <Order>[
  Order(
    id: 'j1',
    title: 'مرافقة أطفال للمدرسة',
    location: 'التجمع الخامس، القاهرة',
    dateTime: DateTime.now().add(const Duration(hours: 2)),
    price: 130,
    status: 'pending',
  ),
  Order(
    id: 'j2',
    title: 'مساعدة منزلية خفيفة',
    location: 'مدينة نصر، القاهرة',
    dateTime: DateTime.now().add(const Duration(hours: 4)),
    price: 160,
    status: 'pending',
  ),
];

final mockHelperEarnings = <Order>[
  Order(
    id: 'e1',
    title: 'خدمات مشاوير',
    location: 'القاهرة',
    dateTime: DateTime.now().subtract(const Duration(days: 1)),
    price: 120,
    status: 'completed',
  ),
  Order(
    id: 'e2',
    title: 'مرافقة أطفال',
    location: 'القاهرة',
    dateTime: DateTime.now().subtract(const Duration(days: 3)),
    price: 150,
    status: 'completed',
  ),
  Order(
    id: 'e3',
    title: 'موظف شركات',
    location: 'القاهرة',
    dateTime: DateTime.now().subtract(const Duration(days: 7)),
    price: 200,
    status: 'completed',
  ),
];
