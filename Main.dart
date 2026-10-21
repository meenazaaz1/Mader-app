import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math';
// สมมติการเรียกใช้ Firebase (เมื่อตั้งค่า Project Firebase แล้วสามารถเปิดใช้งานได้ทันที)
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(); // เปิดใช้งานเมื่อต่อ Firebase จริง
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: WelcomeScreen()));
}

// ตัวแปรเก็บค่าระบบฟิลเตอร์และการแชท

double maxDist = 15.0;
double selectAge = 25.0;
double selectHeight = 170.0;
double selectWeight = 60.0;
String selectedGender = 'หญิง'; 

List<Map<String, dynamic>> chatList = [
  {
    'name': 'Fah, 24',
    'image': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100',
    'lastMessage': 'ขอแสดงความยินดีด้วย คุณและ Fah ได้แมตกันแล้ว 🎉',
    'isNewMatch': true,
  },
  {
    'name': 'Namwan, 22',
    'image': 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=100',
    'lastMessage': 'ขอแสดงความยินดีด้วย คุณและ Namwan ได้แมตกันแล้ว 🎉',
    'isNewMatch': true,
  },
  {
    'name': 'Joy, 26',
    'image': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100',
    'lastMessage': 'ขอแสดงความยินดีด้วย คุณและ Joy ได้แมตกันแล้ว 🎉',
    'isNewMatch': true,
  }
];

int remainingCross = 75; 
int remainingHeart = 20;
int remainingSuperLike = 5;
bool isPremium = false; 
String myName = 'DJ-NA';
int myAge = 30;
int myHeight = 175;
int myWeight = 68;
String myLocation = 'Ban Thung Sukhla, Chon Buri, Thailand';
String myGender = 'ผู้ชาย';
String myGoal = 'คู่ชีวิต';
String myHometown = 'เทศบาลเมืองศรีราชา';
String myJob = 'operator';
String myCompany = 'เพิ่มบริษัท';
String mySchool = 'เพิ่มโรงเรียนมัธยมศึกษา';
String myUniversity = 'เพิ่มมหาวิทยาลัย';
String myEducationLevel = 'ประกาศนียบัตรมัธยมศึกษาตอนปลาย';
String myKids = 'ไม่มีลูก';
String myBio = 'โสด ..... หาคู่ชีวิต....\nอายุ 30 หาแฟนแบบคบจริงจัง\nอาศัยอยู่เครือสหพัฒน์ ทำงานที่แหลมฉบัง';

List<String> myPhotos = [
  'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=600',
  'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=600',
];

List<Map<String, dynamic>> likedUsers = [
  {'name': 'Fah', 'age': 24, 'image': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=600'},
  {'name': 'Namwan', 'age': 22, 'image': 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=600'},
  {'name': 'Joy', 'age': 26, 'image': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=600'},
];

// ================= หน้าแรก =================

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC2185B),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(colors: [Color(0xFFFF4081), Color(0xFFFFAB40)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 15, offset: const Offset(0, 8))],
                  ),
                  child: const Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(left: 20, top: 22, child: Icon(Icons.favorite, size: 45, color: Colors.white70)),
                      Positioned(right: 20, bottom: 22, child: Icon(Icons.favorite, size: 55, color: Colors.white)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text('MADER', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 2.5)),
                const SizedBox(height: 6),
                const Text('แอพหาคู่และการออกเดท', style: TextStyle(fontSize: 14, color: Colors.white70)),
                const SizedBox(height: 40),
                SizedBox(
                  width: 280,
                  child: Column(
                    children: [
                      _btn(context, 'ลงชื่อเข้าใช้ด้วย Google', Colors.white, Colors.black87, isGoogle: true),
                      const SizedBox(height: 12),
                      _btn(context, 'ลงชื่อเข้าใช้ด้วยเบอร์โทรศัพท์', Colors.blue, Colors.white, isPhone: true),
                      const SizedBox(height: 12),
                      _btn(context, 'ลงชื่อเข้าใช้ด้วย Line', const Color(0xFF00B900), Colors.white, isLine: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _btn(BuildContext context, String label, Color bg, Color fg, {bool isGoogle = false, bool isPhone = false, bool isLine = false}) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: bg, foregroundColor: fg, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
        onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainHolder())),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isGoogle) const Text('G', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue))
            else if (isPhone) const Icon(Icons.phone, color: Colors.white, size: 18)
            else if (isLine) Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
              child: const Text('LINE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF00B900))),
            ),
            const SizedBox(width: 12),
            Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: fg)),
          ],
        ),
      ),
    );
  }
}

class MainHolder extends StatefulWidget {
  const MainHolder({super.key});

  @override
  State<MainHolder> createState() => _MainHolderState();
}

class _MainHolderState extends State<MainHolder> {
  int _idx = 0;
  final List<Widget> _pages = [const SwipeScreen(), const LikesScreen(), const ChatListScreen(), const ProfileScreen()];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_idx],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _idx,
        onTap: (i) => setState(() => _idx = i),
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.style), label: 'ปัดหาคู่'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite, color: Colors.pinkAccent), label: 'Like'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'ข้อความ'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'โปรไฟล์ฉัน'),
        ],
      ),
    );
  }
}

class LikesScreen extends StatefulWidget {
  const LikesScreen({super.key});

  @override
  State<LikesScreen> createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen> {
  void _showPricingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: const [
              Icon(Icons.star, color: Colors.amber),
              SizedBox(width: 8),
              Text('เลือกแพ็กเกจพรีเมียม', style: TextStyle(color: Colors.orange, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('ปลดล็อกการปัดไม่จำกัดและสิทธิพิเศษอื่นๆ อีกเพียบ!'),
                const SizedBox(height: 15),
                _tile(context, 'รายเดือน', '199 บาท / เดือน'),
                const SizedBox(height: 10),
                _tile(context, '6 เดือน', '999 บาท / 6 เดือน'),
                const SizedBox(height: 10),
                _tile(context, 'รายปี', '1,599 บาท / ปี'),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('ยกเลิก', style: TextStyle(color: Colors.grey))),
          ],
        );
      },
    );
  }

  Widget _tile(BuildContext context, String title, String price) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(14), border: Border.all(color: Colors.orange.shade200)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              Text(price, style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 13)),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
            onPressed: () {
              setState(() { isPremium = true; remainingCross = 9999; remainingHeart = 9999; });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('🎉 สมัครแพ็กเกจ "$title" สำเร็จแล้ว!')));
            },
            child: const Text('เลือก'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('คนที่กด Like คุณ', style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold)), backgroundColor: Colors.white, elevation: 1),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.75),
        itemCount: likedUsers.length,
        itemBuilder: (context, index) {
          final user = likedUsers[index];
          return GestureDetector(
            onTap: () { if (!isPremium) _showPricingDialog(context); },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(user['image'], fit: BoxFit.cover),
                  if (!isPremium) BackdropFilter(filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12), child: Container(color: Colors.black.withOpacity(0.3))),
                  Positioned.fill(child: DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.transparent, Colors.black.withOpacity(0.8)], begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: const [0.6, 1.0])))),
                  Positioned(
                    bottom: 12, left: 12, right: 12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(isPremium ? '${user['name']}, ${user['age']}' : '???', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                        if (!isPremium) const Icon(Icons.lock, color: Colors.amber, size: 18),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ================= หน้าปัดหาคู่ =================

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({super.key});
  @override
  State<SwipeScreen> createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  int _currentIndex = 0;
  int _photoIndex = 0;
  
  final List<Map<String, dynamic>> _profiles = [
    {
      'name': 'พลอย', 
      'age': 23, 
      'distance': '3.5 กม.',
      'photos': [
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=600',
        'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=600',
      ], 
      'bio': 'โสดค่ะ หาคนคุยจริงจัง ชอบเที่ยวคาเฟ่ ☕✨'
    },
    {
      'name': 'มิน', 
      'age': 25, 
      'distance': '820 เมตร',
      'photos': [
        'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=600',
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=600',
      ], 
      'bio': 'ชอบดูหนัง ฟังเพลง ออกกำลังกายครับ 💪'
    },
  ];

  void _nextPhoto() {
    final profile = _profiles[_currentIndex];
    List<String> photos = profile['photos'];
    if (_photoIndex < photos.length - 1) {
      setState(() => _photoIndex++);
    } else {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _profiles.length;
        _photoIndex = 0;
      });
    }
  }

  void _prevPhoto() {
    if (_photoIndex > 0) {
      setState(() => _photoIndex--);
    }
  }

  void _handleMatch() {
    final profile = _profiles[_currentIndex];
    if (!chatList.any((c) => c['name']!.startsWith(profile['name']))) {
      chatList.insert(0, {
        'name': '${profile['name']}, ${profile['age']}', 
        'image': profile['photos'][0], 
        'lastMessage': 'ขอแสดงความยินดีด้วย คุณและ ${profile['name']} ได้แมตกันแล้ว 🎉',
        'isNewMatch': true,
      });
    }
    showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text('🎉 Match สำเร็จ!', style: TextStyle(color: Colors.pink)),
      content: Text('คุณและ ${profile['name']} ใจตรงกันแล้ว'),
      actions: [TextButton(onPressed: () { Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(userName: profile['name'], userImage: profile['photos'][0]))); }, child: const Text('เริ่มคุย'))],
    ));
  }

  void _handleSuperLike() {
    final profile = _profiles[_currentIndex];
    if (!chatList.any((c) => c['name']!.startsWith(profile['name']))) {
      chatList.insert(0, {
        'name': '${profile['name']}, ${profile['age']}', 
        'image': profile['photos'][0], 
        'lastMessage': 'ขอแสดงความยินดีด้วย คุณและ ${profile['name']} ได้แมตกันแล้ว 🎉',
        'isNewMatch': true,
      });
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('⭐ ส่ง Super Like แล้ว!', style: TextStyle(color: Colors.blue)),
        content: Text('คุณได้ส่ง Super Like ให้ ${profile['name']} เรียบร้อย!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _currentIndex = (_currentIndex + 1) % _profiles.length;
                _photoIndex = 0;
              });
            },
            child: const Text('ตกลง', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('ตัวกรองการค้นหา', style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold)),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('เพศที่สนใจ', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    DropdownButtonFormField<String>(
                      value: selectedGender,
                      items: ['หญิง', 'ชาย', 'ทุกคน'].map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
                      onChanged: (val) { if (val != null) { setDialogState(() => selectedGender = val); setState(() {}); } },
                      decoration: InputDecoration(isDense: true, border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(height: 15),
                    Text('ระยะทางสูงสุด: ${maxDist.toInt()} กม.'),
                    Slider(value: maxDist, min: 5, max: 50, activeColor: Colors.pink, onChanged: (v) { setDialogState(() => maxDist = v); setState(() {}); }),
                    const SizedBox(height: 10),
                    Text('ช่วงอายุ: ${selectAge.toInt()} ปี'),
                    Slider(value: selectAge, min: 18, max: 60, activeColor: Colors.pink, onChanged: (v) { setDialogState(() => selectAge = v); setState(() {}); }),
                    const SizedBox(height: 10),
                    Text('ส่วนสูง: ${selectHeight.toInt()} ซม.'),
                    Slider(value: selectHeight, min: 140, max: 200, activeColor: Colors.pink, onChanged: (v) { setDialogState(() => selectHeight = v); setState(() {}); }),
                    const SizedBox(height: 10),
                    Text('น้ำหนัก: ${selectWeight.toInt()} กก.'),
                    Slider(value: selectWeight, min: 40, max: 120, activeColor: Colors.pink, onChanged: (v) { setDialogState(() => selectWeight = v); setState(() {}); }),
                  ],
                ),
              ),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: const Text('ตกลง', style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold))),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final profile = _profiles[_currentIndex];
    List<String> photos = profile['photos'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('MADER', style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.tune, color: Colors.pink), onPressed: () => _showFilterDialog(context)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: GestureDetector(
                  onTapUp: (details) {
                    double screenWidth = MediaQuery.of(context).size.width;
                    if (details.globalPosition.dx < screenWidth / 2) {
                      _prevPhoto();
                    } else {
                      _nextPhoto();
                    }
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(photos[_photoIndex], fit: BoxFit.cover),
                      Positioned.fill(child: DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.transparent, Colors.black.withOpacity(0.8)], begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: const [0.45, 1.0])))),
                      Positioned(
                        top: 12, left: 12, right: 12,
                        child: Row(
                          children: List.generate(photos.length, (index) {
                            return Expanded(
                              child: Container(
                                height: 3.5,
                                margin: const EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(
                                  color: index == _photoIndex ? Colors.white : Colors.white.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      Positioned(
                        bottom: 24, left: 20, right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${profile['name']}, ${profile['age']}', 
                              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                const Icon(Icons.location_on, color: Colors.pinkAccent, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  'ห่างจากคุณ ${profile['distance']}', 
                                  style: const TextStyle(fontSize: 14, color: Colors.white70, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(profile['bio'], style: const TextStyle(fontSize: 15, color: Colors.white70)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(heroTag: 'rewind', backgroundColor: Colors.white, onPressed: () => setState(() => _currentIndex = _currentIndex > 0 ? _currentIndex - 1 : _profiles.length - 1), child: const Icon(Icons.replay, color: Colors.amber)),
                FloatingActionButton(heroTag: 'cross', backgroundColor: Colors.white, onPressed: () => setState(() { _currentIndex = (_currentIndex + 1) % _profiles.length; _photoIndex = 0; }), child: const Icon(Icons.close, color: Colors.redAccent)),
                FloatingActionButton(heroTag: 'heart', backgroundColor: Colors.white, onPressed: _handleMatch, child: const Icon(Icons.favorite, color: Colors.pink)),
                FloatingActionButton(heroTag: 'star', backgroundColor: Colors.white, onPressed: _handleSuperLike, child: const Icon(Icons.star, color: Colors.lightBlue)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});
  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    final newMatches = chatList.where((chat) => chat['isNewMatch'] == true).toList();
    return Scaffold(
      appBar: AppBar(title: const Text('ข้อความทั้งหมด', style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold)), backgroundColor: Colors.white, elevation: 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (newMatches.isNotEmpty) ...[
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text('คู่แมตช์ใหม่', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: newMatches.length,
                itemBuilder: (context, index) {
                  final chat = newMatches[index];
                  final shortName = chat['name']!.split(',')[0];
                  return GestureDetector(
                    onTap: () {
                      setState(() { chat['isNewMatch'] = false; });
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(userName: shortName, userImage: chat['image']!)));
                    },
                    child: Container(
                      width: 80,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(chat['image']!, width: 75, height: 75, fit: BoxFit.cover),
                              ),
                              Positioned(
                                bottom: 4, right: 4,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(8)),
                                  child: const Text('ใหม่', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(shortName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13), maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(height: 20),
          ],
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('การสนทนา', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: chatList.isEmpty 
              ? const Center(child: Text('ยังไม่มีข้อความหรือการแมต'))
              : ListView.builder(
                  itemCount: chatList.length,
                  itemBuilder: (context, index) {
                    final chat = chatList[index];
                    return ListTile(
                      leading: CircleAvatar(radius: 25, backgroundImage: NetworkImage(chat['image']!)),
                      title: Text(chat['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(chat['lastMessage']!, maxLines: 1, overflow: TextOverflow.ellipsis),
                      onTap: () {
                        setState(() { chat['isNewMatch'] = false; });
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(userName: chat['name']!.split(',')[0], userImage: chat['image']!)));
                      },
                    );
                  },
                ),
          ),
        ],
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String userName;
  final String userImage;
  const ChatScreen({super.key, required this.userName, required this.userImage});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _ctrl = TextEditingController();
  final List<String> _msgs = [];

  void _showSafetyMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2))),
              const SizedBox(height: 15),
              const Text('ความปลอดภัยและการสนับสนุน', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Divider(height: 25),
              ListTile(
                leading: const CircleAvatar(backgroundColor: Color(0xFFE8EEF5), child: Icon(Icons.remove_circle_outline, color: Colors.black87)),
                title: const Text('ไม่ตรงกัน (ยกเลิกการแมต)', style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('ยกเลิกการแมต'),
                      content: const Text('คุณต้องการยกเลิกการแมตกับบุคคลนี้ใช่หรือไม่?'),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context), child: const Text('ไม่ใช่')),
                        TextButton(
                          onPressed: () {
                            chatList.removeWhere((item) => item['name']!.startsWith(widget.userName));
                            Navigator.pop(context);
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('ยกเลิกการแมตเรียบร้อยแล้ว')));
                          },
                          child: const Text('ยืนยัน', style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ListTile(
                leading: const CircleAvatar(backgroundColor: Color(0xFFE8EEF5), child: Icon(Icons.error_outline, color: Colors.black87)),
                title: const Text('รายงานปัญหาการสนทนานี้', style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('ส่งรายงานปัญหาเรียบร้อยแล้ว')));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [CircleAvatar(radius: 15, backgroundImage: NetworkImage(widget.userImage)), const SizedBox(width: 10), Text(widget.userName)]),
        actions: [
          IconButton(icon: const Icon(Icons.more_vert, color: Colors.black87), onPressed: () => _showSafetyMenu(context)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(color: Colors.pink.shade50, borderRadius: BorderRadius.circular(16)),
                    child: Text('ขอแสดงความยินดีด้วย คุณและ ${widget.userName} ได้แมตกันแล้ว 🎉', style: const TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 13)),
                  ),
                ),
                ..._msgs.map((m) => Align(alignment: Alignment.centerRight, child: Container(margin: const EdgeInsets.only(top: 8), padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: Colors.pink.shade400, borderRadius: BorderRadius.circular(12)), child: Text(m, style: const TextStyle(color: Colors.white))))),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            color: Colors.white,
            child: Row(
              children: [
                IconButton(icon: const Icon(Icons.emoji_emotions_outlined, color: Colors.pink), onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('เปิดแผงอีโมจิ')))),
                IconButton(icon: const Icon(Icons.image_outlined, color: Colors.pink), onPressed: () => setState(() => _msgs.add("[ส่งรูปภาพจำลองเรียบร้อย 📷]"))),
                IconButton(icon: const Icon(Icons.mic_none, color: Colors.pink), onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('กำลังบันทึกเสียงพูด...')))),
                Expanded(child: TextField(controller: _ctrl, decoration: const InputDecoration(hintText: 'พิมพ์ข้อความ...', border: InputBorder.none))),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.pink), 
                  onPressed: () { if (_ctrl.text.isNotEmpty) { setState(() => _msgs.add(_ctrl.text)); _ctrl.clear(); } },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _showPricingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: const [
              Icon(Icons.star, color: Colors.amber),
              SizedBox(width: 8),
              Text('เลือกแพ็กเกจพรีเมียม', style: TextStyle(color: Colors.orange, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('ปลดล็อกการปัดไม่จำกัดและสิทธิพิเศษอื่นๆ อีกเพียบ!'),
                const SizedBox(height: 15),
                _buildPriceTile(context, 'รายเดือน', '199 บาท / เดือน'),
                const SizedBox(height: 10),
                _buildPriceTile(context, '6 เดือน', '999 บาท / 6 เดือน'),
                const SizedBox(height: 10),
                _buildPriceTile(context, 'รายปี', '1,599 บาท / ปี'),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('ยกเลิก', style: TextStyle(color: Colors.grey))),
          ],
        );
      },
    );
  }

  Widget _buildPriceTile(BuildContext context, String title, String price) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(14), border: Border.all(color: Colors.orange.shade200)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              Text(price, style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 13)),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
            onPressed: () {
              setState(() { isPremium = true; });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('🎉 สมัครแพ็กเกจ "$title" สำเร็จแล้ว!')));
            },
            child: const Text('เลือก'),
          ),
        ],
      ),
    );
  }

  void _openProfilePreview(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePreviewScreen()));
  }

  void _showEditBioDialog(BuildContext context) {
    TextEditingController bioController = TextEditingController(text: myBio);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('แก้ไขประโยคชวนรู้จัก', style: TextStyle(fontWeight: FontWeight.bold)),
        content: TextField(
          controller: bioController,
          maxLines: 5,
          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('ยกเลิก', style: TextStyle(color: Colors.grey))),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, foregroundColor: Colors.white),
            onPressed: () {
              setState(() { myBio = bioController.text; });
              Navigator.pop(context);
            },
            child: const Text('บันทึก'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int totalItems = myPhotos.length < 8 ? myPhotos.length + 1 : 8;
    int crossAxisCount = 4;
    int rows = (totalItems / crossAxisCount).ceil();
    double gridHeight = rows * 85.0 + (rows - 1) * 8.0;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(title: const Text('โปรไฟล์ของฉัน', style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold)), backgroundColor: Colors.white, elevation: 1),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))]),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => _openProfilePreview(context),
                      child: CircleAvatar(radius: 45, backgroundImage: NetworkImage(myPhotos.isNotEmpty ? myPhotos[0] : 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=600')),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('$myName, $myAge', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        const SizedBox(width: 6),
                        const Icon(Icons.verified, color: Colors.blue, size: 20),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                          style: TextButton.styleFrom(foregroundColor: Colors.black, padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                          icon: const Icon(Icons.edit, size: 16, color: Colors.black),
                          label: const Text('แก้ไขโปรไฟล์', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black)),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfileScreen())).then((_) => setState(() {}));
                          },
                        ),
                        const SizedBox(width: 12),
                        TextButton.icon(
                          style: TextButton.styleFrom(foregroundColor: Colors.black, padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                          icon: const Icon(Icons.remove_red_eye_outlined, size: 16, color: Colors.black),
                          label: const Text('พรีวิวโปรไฟล์', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black)),
                          onPressed: () => _openProfilePreview(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text('ส่วนสูง: $myHeight ซม. | น้ำหนัก: $myWeight กก.\nสถานที่: $myLocation', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => _showPricingDialog(context),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.amber.shade200, Colors.orange.shade100]), borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber, size: 28),
                      SizedBox(width: 12),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('MADER GOLD', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), Text('ดูว่าใคร Like คุณ Match ได้ไวขึ้น')])),
                      Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('รูปภาพของฉัน (สูงสุด 8 รูป)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: gridHeight,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 8, mainAxisSpacing: 8),
                        itemCount: totalItems,
                        itemBuilder: (context, index) {
                          if (index == myPhotos.length && myPhotos.length < 8) {
                            return Container(
                              decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.pink.shade200)),
                              child: IconButton(icon: const Icon(Icons.add, color: Colors.pink), onPressed: () => setState(() => myPhotos.add('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=600'))),
                            );
                          }
                          if (index < myPhotos.length) {
                            return Stack(
                              children: [
                                Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), image: DecorationImage(image: NetworkImage(myPhotos[index]), fit: BoxFit.cover))),
                                Positioned(top: 2, right: 2, child: GestureDetector(onTap: () => setState(() => myPhotos.removeAt(index)), child: const CircleAvatar(radius: 9, backgroundColor: Colors.black54, child: Icon(Icons.close, size: 10, color: Colors.white)))),
                              ],
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => _showEditBioDialog(context),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.pink.shade100, width: 1.5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('ประโยคชวนรู้จักของฉัน', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Icon(Icons.edit, size: 18, color: Colors.pink.shade400),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(myBio, style: const TextStyle(fontSize: 14, color: Colors.black87)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePreviewScreen extends StatefulWidget {
  const ProfilePreviewScreen({super.key});
  @override
  State<ProfilePreviewScreen> createState() => _ProfilePreviewScreenState();
}

class _ProfilePreviewScreenState extends State<ProfilePreviewScreen> {
  int _currentIndex = 0;
  void _nextPhoto() { if (_currentIndex < myPhotos.length - 1) setState(() => _currentIndex++); }
  void _prevPhoto() { if (_currentIndex > 0) setState(() => _currentIndex--); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('พรีวิวโปรไฟล์', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), backgroundColor: Colors.white, elevation: 0, iconTheme: const IconThemeData(color: Colors.black)),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: GestureDetector(
            onTapUp: (details) {
              double screenWidth = MediaQuery.of(context).size.width;
              if (details.globalPosition.dx < screenWidth / 2) { _prevPhoto(); } else { _nextPhoto(); }
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(myPhotos.isNotEmpty ? myPhotos[_currentIndex] : 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=600', fit: BoxFit.cover),
                Positioned.fill(child: DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.transparent, Colors.black.withOpacity(0.8)], begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: const [0.5, 1.0])))),
                Positioned(
                  top: 12, left: 12, right: 12,
                  child: Row(
                    children: List.generate(myPhotos.length, (index) {
                      return Expanded(
                        child: Container(
                          height: 3.5,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(color: index == _currentIndex ? Colors.white : Colors.white.withOpacity(0.4), borderRadius: BorderRadius.circular(2)),
                        ),
                      );
                    }),
                  ),
                ),
                Positioned(
                  bottom: 24, left: 20, right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [Text('$myName, $myAge', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)), const SizedBox(width: 8), const Icon(Icons.verified, color: Colors.blue, size: 22)]),
                      const SizedBox(height: 6),
                      Text(myBio, style: const TextStyle(fontSize: 15, color: Colors.white70)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  void _showEditPopup(String title, String currentVal, Function(String) onSaved, {bool isNumber = false}) {
    TextEditingController controller = TextEditingController(text: currentVal);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('แก้ไข $title', style: const TextStyle(fontWeight: FontWeight.bold)),
        content: TextField(
          controller: controller,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('ยกเลิก', style: TextStyle(color: Colors.grey))),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, foregroundColor: Colors.white),
            onPressed: () { onSaved(controller.text); setState(() {}); Navigator.pop(context); },
            child: const Text('บันทึก'),
          ),
        ],
      ),
    );
  }

  void _showSelectionPopup(String title, List<String> options, String currentVal, Function(String) onSelected) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('เลือก $title', style: const TextStyle(fontWeight: FontWeight.bold)),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (context, index) {
              final opt = options[index];
              return ListTile(
                title: Text(opt),
                trailing: opt == currentVal ? const Icon(Icons.check, color: Colors.pink) : null,
                onTap: () { onSelected(opt); setState(() {}); Navigator.pop(context); },
              );
            },
          ),
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('ปิด'))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(title: const Text('โปรไฟล์หาคู่', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)), backgroundColor: Colors.white, elevation: 1, iconTheme: const IconThemeData(color: Colors.black87)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Column(children: [const Text('แก้ไขโปรไฟล์', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple)), const SizedBox(height: 6), Container(height: 3, color: Colors.deepPurple)])),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePreviewScreen())),
                    child: Column(children: [Text('ดูตัวอย่างโปรไฟล์', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade600)), const SizedBox(height: 6), Container(height: 3, color: Colors.transparent)]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text('ข้อมูลเบื้องต้น', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
            const SizedBox(height: 12),
            _buildFieldTile(label: 'ชื่อจริง', value: myName, trailingIcon: Icons.edit, onTap: () => _showEditPopup('ชื่อจริง', myName, (val) => myName = val)),
            _buildFieldTile(label: 'อายุ', value: myAge.toString(), trailingIcon: Icons.edit, onTap: () => _showEditPopup('อายุ', myAge.toString(), (val) => myAge = int.tryParse(val) ?? myAge, isNumber: true)),
            _buildFieldTile(label: 'ตำแหน่งการหาคู่', value: myLocation, trailingIcon: Icons.keyboard_arrow_down, onTap: () => _showEditPopup('ตำแหน่งการหาคู่', myLocation, (val) => myLocation = val)),
            _buildFieldTile(label: 'เพศ', value: myGender, trailingIcon: Icons.keyboard_arrow_down, onTap: () => _showSelectionPopup('เพศ', ['ผู้ชาย', 'ผู้หญิง', 'LGBTQ+'], myGender, (val) => myGender = val)),
            _buildFieldTile(label: 'จุดประสงค์ด้านความสัมพันธ์', value: myGoal, trailingIcon: Icons.keyboard_arrow_down, onTap: () => _showSelectionPopup('จุดประสงค์ด้านความสัมพันธ์', ['คู่ชีวิต', 'เพื่อนคุย', 'แฟน'], myGoal, (val) => myGoal = val)),
            _buildFieldTile(label: 'ส่วนสูง', value: '$myHeight ซม.', trailingIcon: Icons.keyboard_arrow_down, onTap: () => _showEditPopup('ส่วนสูง (ซม.)', myHeight.toString(), (val) => myHeight = int.tryParse(val) ?? myHeight, isNumber: true)),
            _buildFieldTile(label: 'เมืองเกิด', value: myHometown, trailingIcon: Icons.keyboard_arrow_down, onTap: () => _showEditPopup('เมืองเกิด', myHometown, (val) => myHometown = val)),
            const SizedBox(height: 24),
            const Text('การทำงานและการศึกษา', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
            const SizedBox(height: 12),
            _buildFieldTile(label: 'ตำแหน่งงาน', value: myJob, trailingIcon: Icons.keyboard_arrow_down, onTap: () => _showEditPopup('ตำแหน่งงาน', myJob, (val) => myJob = val)),
            _buildFieldTile(label: 'เพิ่มบริษัท', value: myCompany, trailingIcon: Icons.keyboard_arrow_down, onTap: () => _showEditPopup('บริษัท', myCompany, (val) => myCompany = val)),
            _buildFieldTile(label: 'เพิ่มโรงเรียนมัธยมศึกษา', value: mySchool, trailingIcon: Icons.keyboard_arrow_down, onTap: () => _showEditPopup('โรงเรียนมัธยมศึกษา', mySchool, (val) => mySchool = val)),
            _buildFieldTile(label: 'เพิ่มมหาวิทยาลัย', value: myUniversity, trailingIcon: Icons.keyboard_arrow_down, onTap: () => _showEditPopup('มหาวิทยาลัย', myUniversity, (val) => myUniversity = val)),
            _buildFieldTile(label: 'ระดับการศึกษา', value: myEducationLevel, trailingIcon: Icons.keyboard_arrow_down, onTap: () => _showSelectionPopup('ระดับการศึกษา', ['ประกาศนียบัตรมัธยมศึกษาตอนปลาย', 'ปริญญาตรี', 'ปริญญาโท', 'ปริญญาเอก'], myEducationLevel, (val) => myEducationLevel = val)),
            const SizedBox(height: 24),
            const Text('ไลฟ์สไตล์', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
            const SizedBox(height: 12),
            _buildFieldTile(label: 'ลูกของคุณ', value: myKids, trailingIcon: Icons.keyboard_arrow_down, onTap: () => _showSelectionPopup('ลูกของคุณ', ['ไม่มีลูก', 'มีลูกแล้ว', 'อยากมีลูกในอนาคต'], myKids, (val) => myKids = val)),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldTile({required String label, required String value, required IconData trailingIcon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade200)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                  const SizedBox(height: 3),
                  Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87)),
                ],
              ),
            ),
            Icon(trailingIcon, color: Colors.grey.shade600, size: 20),
          ],
        ),
      ),
    );
  }
}
