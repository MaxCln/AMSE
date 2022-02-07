import 'package:flutter/material.dart';
import 'profile.dart';
import 'mediaList.dart';
import 'about.dart';
import 'models/media.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mediathèque',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Médiathèque'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0, _currentIndex = 0;

  PageController _pageController = PageController(initialPage: 0);

  final _bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Profile",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: "List",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.info),
      label: "About",
    ),
  ];

  final List<Media> _myMedia = [
    Media(
      id: 1,
      type: "movie",
      name: "Alien, le 8ème passager",
      synopsis:
          "Durant le voyage-retour du cargo spatial Nostromo après une mission commerciale de routine, l'équipage, cinq hommes et deux femmes plongés en hibernation depuis dix mois sont tirés de leur léthargie plus tôt que prévu par l'ordinateur de bord du vaisseau. Ce dernier a en effet capté des signaux radio inconnus dans l'espace et, du fait d'une clause attenante à leur contrat de navigation, l'équipage du vaisseau est tenu de vérifier tout indice de vie extraterrestre.\n\nMais, au cours de cette vérification sur une planète désertique, l'officier Kane est attaqué par une forme de vie inconnue, une sorte de créature arachnide qui recouvre son visage en l'étouffant avec sa queue. Après avoir été délivré de la créature étrangère qui semble être morte, l'équipage retrouve le sourire et fait un dernier repas tous ensemble avant de se rendormir. Mais, lors du dîner, Kane est pris de convulsions et voit soudainement son abdomen perforé par une créature qui sort de son corps et qui s'échappe dans les coursives du vaisseau.\n\nUn jeu macabre du chat et de la souris débute alors entre l'équipage et la créature, l'« Alien ». (Wikipédia)",
      review:
          "L'un des meilleurs films de sf. Ridley Scott adopte un rythme volontairement lent, la mise en scéne est très maitrisèe, très envoûtante. D'ailleurs la clé de la réussite c'est que, l'alien en lui-même reste pour la plupart du temps caché, et c'est ça qui donne cette atmosphère si effrayante. Bref pour moi c'est le meilleur film de Scott(et une référence du genre). C'est ultra efficace! (Allociné)",
      chapter: 1,
      completed: "Complété",
      rating: 4.0,
      image: "../images/alien-poster.jpg",
      favorite: false,
    ),
    Media(
      id: 2,
      type: "anime",
      name: "Shoujo Kakumei Utena",
      synopsis:
          "Utena est une petite fille lorsqu'elle perd ses parents. Alors qu'elle ne tiens plus à la vie, et n'a pour seule envie que de rejoindre ses parents dans la mort, apparaît un prince, Dios, qui en lui montrant quelque chose dont elle ne se souviendra pas, lui donne le courage de vivre et surtout l'envie de lui ressembler. En souvenir de ce jour, il lui offre une bague qui dois lui permettre de le retrouver. Celle ci porte l'emblème de l'académie Ôthori.\n\nA l'âge de 14 ans, Utena est élève de l'académie Ôthori. Elle s'habille comme un garçon et joue au basket-ball. Elle espère ressembler ainsi à son prince. Comme elle l'explique elle-même dans le premier épisode : \"Je ne veux pas être une princesse sans défense mais un prince valeureux ! \".",
      review: "ZETTAI. UNMEI. MOKUSHIROKU.",
      chapter: 36,
      completed: "En cours",
      rating: 5,
      image: "../images/utena-poster.jpg",
      favorite: false,
    ),
    Media(
      id: 3,
      type: "movie",
      name: "Fight Club",
      synopsis:
          "Le narrateur, sans identité précise, vit seul, travaille seul, dort seul, mange seul ses plateaux-repas pour une personne comme beaucoup d'autres personnes seules qui connaissent la misère humaine, morale et sexuelle. C'est pourquoi il va devenir membre du Fight club, un lieu clandestin ou il va pouvoir retrouver sa virilité, l'échange et la communication. Ce club est dirigé par Tyler Durden, une sorte d'anarchiste entre gourou et philosophe qui prêche l'amour de son prochain.",
      review:
          "A la fois sombre et captivante cette oeuvre est une claque cinématographique ! Réalisé par le Sorcier Fincher, ce film culte nous propose une critique très virulente de la société de consommation à travers la narration d'Edward Norton. Bien qu'il soit sorti en 1999, cette satire sociale est aujourd'hui plus que jamais d'actualité. Au niveau de la réalisation c'est du grand art, l'atmosphère mêle oppression et fascination. Quand à la performance des acteurs, un seul mot : Magistral. L'intensité est poussé à son paroxysme quand Edward Norton et Helena Bonham Carter se tiennent la main tout en regardant l'explosion des bâtiments financiers sur un morceau de Pixies, Where is my Mind, après une telle remise en question ma réponse est : je ne sais pas.",
      chapter: 1,
      completed: "Complété",
      rating: 0.5,
      image: "../images/fightclub-poster.jpg",
      favorite: false,
    ),
    Media(
      id: 4,
      type: "anime",
      name: "Mawaru Penguindrum",
      synopsis:
          "Mawaru Penguindrum raconte l'histoire de 2 frères, Kanba et Shôma et de leur petite sœur Himari.\n\nIls vivent tous les trois, dans une modeste maison, avec très peu de moyens. Malgré les apparences qu'ils donnent de mener une vie paisible, Himari est atteinte d'une maladie mortelle. D'après le médecin, il ne lui reste à peine que quelques mois à vivre.\nLes deux frères, conscients du destin tragique de leur petite soeur, font tout pour la rendre heureuse durant ses derniers instants.\n\nIls l'emmènent donc, à l'aquarium, voir les pingouins. Alors que Shôma achète un cadeau à Himari, celle-ci disparait. Les deux frères finissent par la retrouver au sol, inconsciente. Elle est immédiatement amenée à l'hôpital, mais malheureusement, elle y décède.\nLes deux frères, sous le choc, restent alors près du corps de Himari et commencent à se disputer.\n\nC'est alors qu'un miracle a lieu. Une mystérieuse entité prend possession du chapeau de Himari et propose un marché à Kanba et Shôma : la survie de leur sœur contre un secret gardé par une certaine Ringo...",
      review:
          "I love the word \"fate\". You know how everyone talks about this anime called Mawaru Penguindrum? Just one single show can completely change your landscape. Such a thought-provoking series is not made by mere coincidence. It's definitely... fate. Of course, it's not for everyone. There are many mysterious, seemingly pointless story developments. It's hard to accept abstract ideas that start with nothing but confusion. But I think... Every line of dialogue, every object drawn in the show exist for a reason. Nothing in this show is pointless.\n\nWhat if I asked viewers what anime was like before they have seen Mawaru Penguindrum? They've forgotten what it was like when they didn't? You could say anime today isn't hopeless thanks to this show. The feeling of noticing perplexing symbolism. Hearing the sound that you'll never forget. Plot twists at startling rate. This show can change your perspective of anime in a heartbeat. Apples, diaries, penguins, and even the color of trash cans... seemed like treasures filled with possibilities when I saw them with an open mind. But... I can't go back now. I can still watch generic anime. Although, I can't recall what I liked about them. Sometimes I wonder why there aren't more deep, meaningful anime like this. The next season's lineup appear awfully uncertain to me right now. Like Poyopoyo Kansatsu Nikki's cat. A half-cute, half-round, manly cat. On the other hand, if there has to be shallow series to make deep ones more enjoyable... then everything must have a meaning. That's what I would like to think.\n\nMawaru Penguindrum starts with mystery. Storytelling here is like a true Japanese movie: Subtle. Main heroine here is Oginome Ringo. The stalker of main characters' teacher. She builds an observation post below the teacher's house from scratch. A charismatic yandere in modern Tokyo. It's a penguin eat dog world. The \"real\", heroine in the second half is useless in the first half. Girls like her should just get netorare! Gosh, you must watch this series to the end.\n\nMawaru Penguindrum will keep you thinking. Abstract ideas here are like puzzles: Thought-provoking. Main heroine here is Takakura Himari. The sister of main characters. She's sick from a terminal disease. A tragic princess in the border between life and death. It's a world of duality. The brothers stop searching for an unknown object called \"Penguindrum\" and try to keep her alive from scratch. Journeys like that should be more important than destination! Gosh, I must watch this series again.\n\nDo you like beautiful imagery in anime? Do you like allegory and careful attention paid to every detail on the screen? Of course you do! I feel the same way. Or rather, I can only love beautiful artwork. After all, I am an anime enthusiast. There are so much detail in every single frame that will make more and more sense by the episode. That's why you must not only watch this series, you have to watch it again. Viewers who don't do this are ugly and stupid. They can't appreciate the art in Mawaru Penguindrum. Listen well. No one loves mindless viewers. They don't have the right to be loved. It's a pretentious anime, after all. Artwork in 'Mawawru Penguindrum' removed the impurity in the background, such that only beauty remains. Just as the great Ikuhara produced the magnificent 'Shoujo Kakumei Utena' from storyboards. So, I have a favor to ask of you. Give yourself the opportunity to see this masterpiece. Let yourself see the beauty in this series. It's Fabulous Max!\n\nAction, comedy, suspense, joy and sorrow, calmness and anger. If BGM didn't reflect the mood on screen, then why do they even exist? Because, ever since that very first episode, music in the background matched perfectly with the story. The only thing we heard were true theme songs and BGM... Music to our ears. Isn't it electrifying?\n\nListen, you lowlifes who will never amount to anything. Obtain the TL notes from my blog. Let's initiate the Survival Strategy.\n\nWhy are people born? If people are born only to suffer through shallow anime, is it meant as some kind of a punishment? Or a cynical joke? If that's the case, viewers who adhere to their innate curiosity programmed in their DNA... are far more elegant and simple. If there really is a 2011 anime worthy of watching, then, it must be called Mawaru Penguindrum.\n\nI love anime that deal with \"fate\". You know how everyone talks about this anime called Mawaru Penguindrum? If you were able to read through this wall of text, you probably have what it takes to enjoy this series. I didn't write the review in this format by mere coincidence. It's definitely... fate. Of course, it's not for everyone. There are many unpredictable twists and unexplained mysteries. It's hard to fully understand the meaning of all the allegories and symbolisms in this series. But I think... Every line of dialogue, every object drawn in this series exist for a reason. Nothing in this show is pointless.\n\n*Stamps* Destiny.",
      chapter: 24,
      completed: "Complété",
      rating: 5,
      image: "../images/penguindrum-poster.jpg",
      favorite: true,
    ),
    Media(
      id: 5,
      type: "videogame",
      name: "God of War",
      synopsis:
          "L'histoire de God of War se déroule au départ dans l'univers de la mythologie grecque et raconte l'histoire d'un simple mortel élevé au rang de dieu.\n\nNé à Sparte, Kratos est un chef guerrier, aussi bien respecté que redouté, possédant une force étrangement inhumaine. Un jour, acculé devant l’invasion d'une armée barbare lors d'une bataille sanglante, il pactise par désespoir avec Arès, Dieu de la guerre, en échange de sa totale allégeance à celui-ci. Il obtient ainsi une grande puissance, ce qui lui permet de vaincre facilement son ennemi et de devenir invincible, enchainant les victoires lors de toutes les guerres qu'il entame par la suite, sous les ordres de son bienfaiteur. Malheureusement, ayant perdu son âme, il saccage une ville tombée sous son armée et massacre tous les habitants dont sa femme et sa fille, qu'il tue de ses mains sans en avoir conscience. En échange du pardon pour ses crimes, et espérant qu'on lui efface ses souvenirs qui le hantent, il offre sa puissance et ses armes aux dieux, résolvant les conflits dans lesquels le Panthéon ne peut pas intervenir directement, devenant le fantôme de Sparte. C'est ainsi que les dieux l'aident à éliminer Arès devenu tyrannique.\n\nEn récompense de ses exploits, Kratos devient le nouveau Dieu de la guerre mais n'obtient aucunement l'effacement de ses crimes et de ses souvenirs douloureux, à son grand désaroi. À la suite de cet échec, qu'il prend pour une nouvelle trahison, Kratos se déchaine au point de devenir incontrôlable, ce qui déplait aux dieux qui le bannissent de l'Olympe. Kratos entame alors une nouvelle croisade mais cette fois-ci contre Zeus en personne. Il s'allie pour cela avec les titans, précédentes divinités déchues par Zeus, et provoque une grande guerre qui causera la chute des dieux de l'Olympe mais également des titans eux-mêmes qui l'ont aussi abandonné lors de la bataille finale.\n\nDevenu persona non grata sur ses terres ravagées par sa quête vengeresse, Kratos s'exile dans le Nord espérant y refaire sa vie à l’abri des regards. Son périple se poursuit donc par la suite dans l'univers de la mythologie nordique.\n\nC'est un Kratos fatigué mais apaisé que l'on retrouve et qui élève désormais seul son fils, sa nouvelle femme étant décédée. Kratos essaye, à travers son expérience, d'inculquer à sa progéniture les valeurs qui lui permettront de vivre dans ce monde hostile, tout en tentant de lui transmettre tout son savoir faire. Le fantôme de Sparte espère ainsi que son fils ne reproduise pas les mêmes erreurs que lui, à savoir des actions insensées et irréfléchies menées par la haine et la naïveté. Malheureusement son passé le rattrape une nouvelle fois par l'arrivée d'un étranger aux pouvoirs extraordinaires...",
      review:
          "Un peu long et sinueux (c'est faux mais faut bien varier les données)",
      chapter: 1,
      completed: "En pause",
      rating: 2.3,
      image: "../images/gow-poster.jpg",
      favorite: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        children: [
          Profile(_myMedia),
          MediaList(_myMedia),
          About(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationBarItems,
        unselectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
      ),
    );
  }
}
