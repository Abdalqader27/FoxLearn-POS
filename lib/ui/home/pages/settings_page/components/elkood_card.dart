import 'package:flutter/material.dart';
import 'package:foxlearn_pos/generated/assets.dart';
import 'package:foxlearn_pos/services/screen.dart';
import 'package:foxlearn_pos/ui/home/pages/settings_page/components/social_media_icons_icons.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncer;

import 'circular-social-icon.dart';
import 'fancy-background.dart';
import 'logo-section-allies.dart';

class ElkoodCard extends StatelessWidget {
  final child;

  const ElkoodCard({Key? key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: FancyBackgroundApp(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(Screen.width(32)),
          children: <Widget>[
            LogoSection(
              logo: Assets.logoElkoodLogo,
            ),
            Padding(
              padding: EdgeInsets.all(Screen.width(12)),
              child: Text(
                "شركة متخصصة بصناعة البرمحيات",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: Screen.width(15)),
              ),
            ),
            bodySection(),
            SizedBox(
              height: Screen.height(16),
            ),
            contactSection(context),
          ],
        ),
      ),
    );
  }
}

Widget contactSection(context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SocialIcon(
            onTap: () {
              UrlLauncer.launch('https://wa.me/+963 956402046');
            },
            icon: SocialMediaIcons.whatsapp,
            delay: 0.5),
        SocialIcon(
            onTap: () {
              UrlLauncer.launch('https://www.facebook.com/ElkoodTS/');
            },
            icon: SocialMediaIcons.facebook,
            delay: 0.6),
        SocialIcon(
            onTap: () {
              UrlLauncer.launch("https://www.instagram.com/elkoodts");
            },
            icon: SocialMediaIcons.instagram,
            delay: 0.7),
        SocialIcon(
            onTap: () {
              UrlLauncer.launch("https://t.me/Elkoodts");
            },
            icon: SocialMediaIcons.telegram_plane,
            delay: 0.8),
        SocialIcon(
            onTap: () {
              UrlLauncer.launch("https://www.linkedin.com/company/elkood");
            },
            icon: SocialMediaIcons.linkedin,
            delay: 0.9),
      ],
    ),
  );
}

Widget bodySection() {
  return Column(
    children: [
      SizedBox(
        height: Screen.height(16),
      ),
      ContactTile(
        text: "www.elkood.com",
        iconData: Icons.language_rounded,
        onTap: () {
          UrlLauncer.launch('http://www.elkood.com');
        },
      ),
      SizedBox(
        height: Screen.height(16),
      ),
      ContactTile(
        text: "info@elkood.com",
        iconData: Icons.mail,
        onTap: () {
          UrlLauncer.launch('mailto:info@elkood.com');
        },
      ),
      SizedBox(
        height: Screen.height(16),
      ),
      ContactTile(
        text: "+963 956-402-046",
        iconData: Icons.phone,
        onTap: () {
          UrlLauncer.launch('tel:+963 956-402-046');
        },
      ),
      SizedBox(
        height: Screen.height(16),
      ),
      ContactTile(
        text: "المحافظة - حلب - سوريا",
        iconData: Icons.location_on,
      ),
      SizedBox(
        height: Screen.height(16),
      ),
    ],
  );
}

class ContactTile extends StatelessWidget {
  final IconData? iconData;
  final String? text;
  final VoidCallback? onTap;

  const ContactTile({Key? key, this.iconData, this.text, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Screen.width(16)),
      child: Row(
        children: [
          Icon(iconData, size: Screen.width(25), color: Colors.white),
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 6,
            child: GestureDetector(
              onTap: onTap,
              child: Text(
                text!,
                maxLines: 1,
                textAlign: TextAlign.right,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontSize: Screen.width(18),
                    decoration: onTap != null ? TextDecoration.underline : null,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
