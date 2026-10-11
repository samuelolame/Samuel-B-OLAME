import 'package:model_me/lang.dart';

const modelName = 'SAMUEL B';
String get tagline => tr('Mannequin & Acteur', 'Actor & model');
const specialties = ['Runway', 'Editorial', 'Commercial'];

String get aboutText => tr
   ('Salut\nJe suis modèle et acteur basé à Montréal, et j’évolue dans différents'
   'univers liés à la mode, l’image et la production audiovisuelle.'
  'Ce qui m’attire particulièrement dans ce métier, c’est la possibilité '
  'd’explorer différents personnages, styles et univers visuels.'
  'Je suis intéressé par des projets en acting, fashion, éditorial, e-commerce, commercial et publicité,'
  'et j’aime pouvoir m’adapter à une direction artistique tout en apportant ma propre présence à l’image.'
  'Devant la caméra, je cherche à être naturel, expressif et polyvalent.'
  'Que ce soit pour une campagne, un shooting éditorial, une production vidéo,'
  'une publicité ou un projet d’acting, j’accorde autant d’importance à l’attitude'
  'et à l’expression qu\'à la capacité de comprendre et de servir la vision créative du projet.'
  '\n\nLe sport occupe également une place importante dans ma vie.'
  'Je pratique régulièrement le running et la calisthénie, deux disciplines qui m\'ont appris'
  'la constance, la discipline et le dépassement de soi. Cette pratique influence directement'
  'ma façon d’aborder mon travail : être préparé, rester engagé et toujours chercher à progresser.'

  'Je suis ouvert aux collaborations avec agences, directeurs de casting,'
  'photographes, directeurs de production, réalisateurs, marques et équipes'
  'créatives à la recherche d’un profil polyvalent et à l’aise devant la caméra.'
  '\n\nBaser à Montréal \nDisponible pour des projets locaux et nationaux.', 
  
  'Hi\nI am a Montreal-based model and actor working across various'
   'fields related to fashion, imagery, and audiovisual production.'
  'What draws me most to this profession is the opportunity'
  'to explore different characters, styles, and visual worlds.'
  'I am interested in projects involving acting, fashion, editorial work, e-commerce, and advertising,'
  'and I enjoy adapting to artistic direction while bringing my own unique presence to the frame.'
  'In front of the camera, I aim to be natural, expressive, and versatile.'
  'Whether for a campaign, an editorial shoot, a video production,'
  'a commercial, or an acting role, I place equal importance on attitude'
  'and expression as I do on understanding and serving the project’s creative vision.'
  '\n\nSports also play a significant role in my life.'
  'I regularly practice running and calisthenics—two disciplines that have taught me'
  'consistency, discipline, and the drive to push my limits. This mindset directly influences'
  'my approach to work: staying prepared, remaining committed, and always striving for growth.'

  'I am open to collaborations with agencies, casting directors,'
  'photographers, production managers, directors, brands, and creative teams'
  'looking for a versatile talent who is comfortable in front of the camera.'
  '\n\nBased in Montreal \nAvailable for local and national projects.');


String get contactText => tr ('Pour les collaborations, castings et réservations, écris-moi.', 'For collaborations, castings, and bookings, write to me.');
const email = 'bash24693@gmail.com'; // mon mail
const devInstagramUrl = 'https://www.instagram.com/esprit_coder?stkn=amdocmcxbTM5Mmpm'; // mon dev
const instagramUrl = 'https://www.instagram.com/sam.22.oll?stkn=NHBvDM3eHN4am1y'; // mon ista
const facebookUrl = 'https://www.facebook.com/share/19k3zrJ2Es/'; //mon fb
const tiktokUrl = 'https://www.tiktok.com/@sam.22.oll?_r=1&_t=ZS-99zWuLUJNw2'; //mon tiktok
const pinterestUrl = 'https://pin.it/c3h7pl1fv'; //mon Pin

const heroPhoto = 'assets/images/meEditorial12.jpg';
const aboutPhoto = 'assets/images/Digits01.jpg';

class Photo {
  final String path;
  final String category;
  const Photo(this.path, this.category);
}


final categories = ['Tous', 'Editorial', 'Runway','Commercial', 'Sport',];

const photos = [
  Photo('assets/images/meEditorial19.jpg', 'Editorial'),
  Photo('assets/images/meEditorial13.jpg', 'Editorial'),
  Photo('assets/images/meEditorial07.jpg', 'Editorial'),
  Photo('assets/images/meEditorial14.jpg', 'Editorial'),
  Photo('assets/images/meEditorial15.jpg', 'Editorial'),
  Photo('assets/images/meEditorial16.jpg', 'Editorial'),
  Photo('assets/images/meEditorial10.jpg', 'Editorial'),
  Photo('assets/images/meEditorial12.jpg', 'Editorial'),
  Photo('assets/images/meEditorial23.jpg', 'Editorial'),
  Photo('assets/images/meEditorial25.jpg', 'Editorial'),
  Photo('assets/images/meEditorial26.jpg', 'Editorial'),
  Photo('assets/images/meEditorial27.jpg', 'Editorial'),
  Photo('assets/images/meEditorial03.jpg', 'Editorial'),
  Photo('assets/images/meEditorial17.jpg', 'Editorial'),
  Photo('assets/images/Samuel-5.jpg', 'Editorial'),
  Photo('assets/images/Samuel-1.jpg', 'Editorial'),
  Photo('assets/images/commercial.jpg', 'Editorial'),
  Photo('assets/images/meE30.png', 'Editorial'),
  Photo('assets/images/meE31.png', 'Editorial'),
  Photo('assets/images/meE33.png', 'Editorial'),
  Photo('assets/images/meE35.png', 'Editorial'),
  Photo('assets/images/meE36.png', 'Editorial'),
  Photo('assets/images/meE37.png', 'Editorial'),
  Photo('assets/images/meE38.png', 'Editorial'),
  Photo('assets/images/meE39.png', 'Editorial'),
  Photo('assets/images/meE40.png', 'Editorial'),
  Photo('assets/images/meE41.png', 'Editorial'),
  Photo('assets/images/meE42.png', 'Editorial'),
  Photo('assets/images/meE43.png', 'Editorial'),
  Photo('assets/images/meE44.png', 'Editorial'),
  Photo('assets/images/meE45.png', 'Editorial'),
  Photo('assets/images/meE46.png', 'Editorial'),
  Photo('assets/images/meE47.png', 'Editorial'),
  Photo('assets/images/meE48.png', 'Editorial'),
  Photo('assets/images/meE49.png', 'Editorial'),
  Photo('assets/images/meE50.png', 'Editorial'),
  Photo('assets/images/meE51.png', 'Editorial'),
  Photo('assets/images/meE52.png', 'Editorial'),
  Photo('assets/images/meE53.png', 'Editorial'),
  Photo('assets/images/meE54.png', 'Editorial'),
  Photo('assets/images/meE55.png', 'Editorial'),
  Photo('assets/images/meE56.png', 'Editorial'),

  Photo('assets/images/runway01.jpg', 'Runway'),
  Photo('assets/images/runway05.jpg', 'Runway'),
  Photo('assets/images/runway07.jpg', 'Runway'),
  Photo('assets/images/runway08.jpg', 'Runway'),
  Photo('assets/images/runway02.jpg', 'Runway'),
  Photo('assets/images/runway03.jpg', 'Runway'),
  Photo('assets/images/runway10.jpg', 'Runway'),
  Photo('assets/images/runway12.jpg', 'Runway'),
  Photo('assets/images/runway13.jpg', 'Runway'),
  Photo('assets/images/runway14.jpg', 'Runway'),
  Photo('assets/images/runway15.jpg', 'Runway'),
  Photo('assets/images/runway16.jpg', 'Runway'),
  Photo('assets/images/runway17.png', 'Runway'),
  Photo('assets/images/runway18.jpg', 'Runway'),
  Photo('assets/images/runway19.jpg', 'Runway'),
  
  
  Photo('assets/images/Commercial01.jpg', 'Commercial'),

  Photo('assets/images/Sport.jpg', 'Sport'),
  Photo('assets/images/sports04.png', 'Sport'),
  Photo('assets/images/sports05.png', 'Sport'),
  Photo('assets/images/sports06.png', 'Sport'),
  Photo('assets/images/Digits02.jpg', 'Sport'),
  Photo('assets/images/Digits03.jpg', 'Sport'),
  Photo('assets/images/Sport01.jpg', 'Sport'),

  Photo('assets/images/TM4A4745.jpg', 'Editorial'),
  Photo('assets/images/commercial02.jpg', 'Commercial'),
];

List<({String fr, String en, String v})> get stats => [
  (fr:'Taille',en:'Height', v: '6\'1"'),
  (fr:'Poids', en: 'Weight', v: '154 lbs'),
  (fr:'Poitrine',en: 'chest', v: '40"'),
  (fr:'Tour de taille', en: 'Waist', v:'27"'),
  (fr:'Hanches', en: 'Hips', v: '36"'),
  (fr:'Chemise',en: 'Shirt', v: 'L/M'),
  (fr:'Pantalon',en: 'Pants', v: 'L'),
  (fr:'Entrejambe',en: 'Inseam', v: '35"'),
  (fr:'Pointure', en:'Shoe size', v: '11'),
  (fr:'Cheveux',en: 'Hair', v: 'Black'),
  (fr:'Longueur cheveux',en: 'Hair length', v: 'Short'),
  (fr:'Yeux', en: 'Eyes', v: 'Brown'),
];
