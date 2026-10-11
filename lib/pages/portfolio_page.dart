import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:model_me/lang.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:model_me/constants.dart';
import 'package:model_me/data/model_data.dart';
import 'package:model_me/util/mes_Box.dart';
import 'package:model_me/util/mes_tile.dart';


class PortfolioPage extends StatefulWidget {
  final Device device;
  const PortfolioPage({super.key, required this.device});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final keys = List.generate(navItems.length, (_) => GlobalKey());
  String filter = tr('Tous', 'All');
  Device get d => widget.device;

  void go(int i) {
    final ctx = keys[i].currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> open(String url) async {
    await launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final columns = width < 600 ? 2:3;
    return ValueListenableBuilder<String>(
      valueListenable: lang,
      builder: (context, _, _) {
        final body = SingleChildScrollView(
          child: Column(
            children: [
              _hero(),
              _portfolio(columns: columns),
              _stats(),
              _about(),
              _contact(),
              _footer(),
            ],
          ),
        );
        return Scaffold(
          backgroundColor: kIce,
          appBar: d.isDesktop
              ? null
              : AppBar(
                  backgroundColor: kNavy,
                  foregroundColor: Colors.white,
                  centerTitle: true,
                  actions: [const LangButton()],
                  title: const Text(
                    modelName,
                    style: TextStyle(
                      letterSpacing: 6,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
          drawer: d.isDesktop ? null : AppDrawer(onSelect: go),
          body: d.isDesktop
              ? Column(
                  children: [
                    _navBar(),
                    Expanded(child: body),
                  ],
                )
              : body,
        );
      },
    );
  }

  Widget _section(int? i, Color color, Widget child) => Container(
    key: i == null ? null : keys[i],
    width: double.infinity,
    color: color,
    padding: EdgeInsets.symmetric(
      horizontal: d.pad,
      vertical: d.isDesktop ? 96 : 56,
    ),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: child,
      ),
    ),
  );

  Widget _title(String t, {bool light = false, bool center = false}) => Padding(
    padding: const EdgeInsets.only(bottom: 32),
    child: Column(
      crossAxisAlignment: center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          t,
          style: TextStyle(
            fontSize: d.isDesktop ? 40 : 28,
            fontWeight: FontWeight.w300,
            letterSpacing: 6,
            color: light ? Colors.white : kNavy,
          ),
        ),
        const SizedBox(height: 12),
        Container(width: 48, height: 2, color: kBlue),
      ],
    ),
  );

  ButtonStyle get _filled => FilledButton.styleFrom(
    backgroundColor: kBlue,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
    shape: const RoundedRectangleBorder(),
  );
  Widget _navBar() => Container(
    color: kNavy,
    height: 72,
    padding: EdgeInsets.symmetric(horizontal: d.pad),
    child: Row(
      children: [
        const Text(
          modelName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            letterSpacing: 8,
            fontWeight: FontWeight.w300,
          ),
        ),
        const Spacer(),
        for (var i = 0; i < navItems.length; i++)
          TextButton(
            onPressed: () => go(i),
            child: Text(
              navItems[i].toUpperCase(),
              style: const TextStyle(
                color: Colors.white70,
                letterSpacing: 2,
                fontSize: 12,
              ),
            ),
          ),
        const LangButton(),
      ],
    ),
  );

  // ---------- Accueil ----------
  Widget _hero() {
    final nameSize = d.isDesktop ? 120.0 : (d == Device.tablet ? 84.0 : 52.0);
    final align = d.isDesktop
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.center;
    final text = Column(
      crossAxisAlignment: align,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          tagline,
          style: TextStyle(color: kSky, letterSpacing: 4, fontSize: 12),
        ),
        const SizedBox(height: 16),
        Text(
          modelName,
          style: TextStyle(
            color: Colors.white,
            fontSize: nameSize,
            fontWeight: FontWeight.w200,
            letterSpacing: nameSize / 8,
            height: 1,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          specialties.join('  ·  ').toUpperCase(),
          style: const TextStyle(
            color: Colors.white70,
            letterSpacing: 3,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: d.isDesktop ? WrapAlignment.start : WrapAlignment.center,
          children: [
            FilledButton(
              onPressed: () => go(1),
              style: _filled,
              child: Text(tr('VOIR LE PORTFOLIO', 'VIEW PORTFOLIO')),
            ),
            OutlinedButton(
              onPressed: () => go(4),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white54),
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 20,
                ),
                shape: const RoundedRectangleBorder(),
              ),
              child: Text(tr('ME CONTACTER', 'CONTACT ME')),
            ),
          ],
        ),
      ],
    );
    final photo = ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 440),
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(220)),
          child: Image.asset(
            heroPhoto,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
      ),
    );
    return _section(
      0,
      kNavy,
      d.isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 5, child: text),
                Expanded(
                  flex: 4,
                  child: Align(alignment: Alignment.centerRight, child: photo),
                ),
              ],
            )
          : Column(children: [photo, const SizedBox(height: 40), text]),
    );
  }

  // ---------- Portfolio ----------
  Widget _portfolio({required int columns}) {
    final shown = filter == 'Tous'
        ? photos
        : photos.where((p) => p.category == filter).toList();
    return _section(
      1,
      kIce,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title('PORTFOLIO'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final c in categories)
                ChoiceChip(
                  label: Text(
                    c.toUpperCase(),
                    style: TextStyle(
                      color: filter == c ? Colors.white : kNavy,
                      fontSize: 12,
                      letterSpacing: 1.5,
                    ),
                  ),
                  selected: filter == c,
                  showCheckmark: false,
                  selectedColor: kBlue,
                  backgroundColor: Colors.white,
                  side: BorderSide(color: kBlue.withValues(alpha: 0.3)),
                  onSelected: (_) => setState(() => filter = c),
                ),
            ],
          ),
          const SizedBox(height: 32),
          MasonryGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: shown.length,
            crossAxisCount:columns,
            mainAxisSpacing: 30,
            crossAxisSpacing: 30,
            itemBuilder: (context, index) => MyBox(photo: shown[index], photos: shown,),
          ),
        ],
      ),
    );
  }

  // ---------- Mensurations ----------
  Widget _stats() => _section(
    2,
    Colors.white,
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title('MODEL STATS'),
        LayoutBuilder(
          builder: (context, c) {
            final cols = d == Device.mobile ? 1 : 2;
            final w = (c.maxWidth - 48 * (cols - 1)) / cols;
            return Wrap(
              spacing: 48,
              children: [
                for (final s in stats)
                  SizedBox(
                    width: w,
                    child: Mytile(label: tr(s.fr, s.en), value: s.v),
                  ),
              ],
            );
          },
        ),
      ],
    ),
  );

  // ---------- À propos ----------
  Widget _about() {
    final img = ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Image.asset(
          aboutPhoto,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
    );
    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _title(tr('À PROPOS', 'ABOUT'), light: true),
        Text(
          aboutText,
          style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.8),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final s in specialties)
              Chip(
                label: Text(
                  s.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    letterSpacing: 2,
                  ),
                ),
                backgroundColor: kBlue,
                side: BorderSide.none,
              ),
          ],
        ),
      ],
    );
    return _section(
      3,
      kNavy,
      d.isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 380, child: img),
                const SizedBox(width: 72),
                Expanded(child: text),
              ],
            )
          : Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 380),
                  child: img,
                ),
                const SizedBox(height: 40),
                Align(alignment: Alignment.centerLeft, child: text),
              ],
            ),
    );
  }

  // ---------- Contact ----------
  Widget _contact() => _section(
    4,
    kIce,
    Column(
      children: [
        _title('CONTACT', center: true),
        Text(
          contactText,
          textAlign: TextAlign.center,
          style: TextStyle(color: kNavy, fontSize: 18, height: 1.6),
        ),
        const SizedBox(height: 34),
        Wrap(
          spacing: 9,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: [
            FilledButton.icon(
              onPressed: () => open('mailto:$email'),
              style: _filled,
              icon: const Icon(Icons.mail_outline),
              label: const Text('E-MAIL'),
            ),
            OutlinedButton.icon(
              onPressed: () => open(instagramUrl),
              style: OutlinedButton.styleFrom(
                foregroundColor: kBlue,
                side: const BorderSide(color: kBlue),
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 20,
                ),
                shape: const RoundedRectangleBorder(),
              ),
              icon: const Icon(Icons.camera_alt_outlined),
              label: const Text('INSTAGRAM'),
            ),
            OutlinedButton.icon(
              onPressed: () => open(facebookUrl),
              style: OutlinedButton.styleFrom(
                foregroundColor: kBlue,
                side: const BorderSide(color: kBlue),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                shape: const RoundedRectangleBorder(),
              ),
              icon: const Icon(Icons.facebook),
              label: const Text('FACEBOOK'),
            ),
            OutlinedButton.icon(
              onPressed: () => open(tiktokUrl),
              style: OutlinedButton.styleFrom(
                foregroundColor: kBlue,
                side: const BorderSide(color: kBlue),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                shape: const RoundedRectangleBorder(),
              ),
              icon: const Icon(Icons.tiktok),
              label: const Text('TIKTOK'),
            ),
            OutlinedButton.icon(
              onPressed: () => open(pinterestUrl),
              style: OutlinedButton.styleFrom(
                foregroundColor: kBlue,
                side: const BorderSide(color: kBlue),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                shape: const RoundedRectangleBorder(),
              ),
              icon: const Icon(Icons.push_pin),
              label: const Text('PINTEREST'),
            ),
          ],
        ),
      ],
    ),
  );
  // ---------- Pied de page ----------
  Widget _footer() => Container(
    width: double.infinity,
    color: const Color(0xFF060E22),
    padding: const EdgeInsets.all(24),
    child:Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('© ${DateTime.now().year} $modelName',
          textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white54,
        fontSize: 12,
        letterSpacing: 1.5,
      ),),
          InkWell(
            onTap: (){
              open(devInstagramUrl);
              debugPrint('sam dev');
            },
            child: Text('  -dev by @esprit_coder',
            textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                    letterSpacing: 1.5,
                  ),),
          ),
      ],
    )
  );
}
