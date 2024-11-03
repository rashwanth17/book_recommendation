import 'package:book/BookDeatils.dart';
import 'package:book/Favourite.dart';
import 'package:flutter/material.dart';

class BooksPage extends StatefulWidget {
  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  List<Map<String, dynamic>> favoriteBooks = [];
  final List<Map<String, dynamic>> gameOfThronesBooks = [
    {
      "title": "A Game of Thrones",
      "author": "George R. R. Martin",
      "image":
          "https://cdn.kobo.com/book-images/73a7aebd-0bc0-4d63-a4f7-865af7f48bef/1200/1200/False/a-game-of-thrones-a-song-of-ice-and-fire-book-1.jpg",
      "description":
          "The first novel in the epic series A Song of Ice and Fire introduces readers to the Seven Kingdoms of Westeros, where noble families vie for power and the Iron Throne. As winter approaches, the Stark family of Winterfell becomes embroiled in political intrigue, betrayal, and the looming threat of the supernatural. This gripping tale sets the stage for a saga of honor, loyalty, and the brutal realities of warfare.",
      "rating": 4.5,
      "isFavorite": false
    },
    {
      "title": "A Clash of Kings",
      "author": "George R. R. Martin",
      "image": "https://images.thenile.io/r1000/9780006479895.jpg",
      "description":
          "The second novel continues the power struggles in Westeros as the realm descends into civil war. Multiple claimants to the Iron Throne emerge, and alliances shift as characters navigate treachery and conflict. With the threat of the White Walkers growing in the North, the stakes are higher than ever, showcasing Martin's ability to weave complex narratives filled with political maneuvering and deep character development.",
      "rating": 4.6,
      "isFavorite": false
    },
    {
      "title": "A Storm of Swords",
      "author": "George R. R. Martin",
      "image": "https://images.thenile.io/r1000/9780007459469.jpg",
      "description":
          "In this third installment, the war for the Iron Throne intensifies, leading to shocking betrayals and devastating battles. The narrative takes unexpected turns, featuring pivotal moments that alter the fates of beloved characters. As alliances form and dissolve, Martin explores themes of honor, revenge, and the consequences of ambition, all while the cold winds of winter begin to loom.",
      "rating": 4.7,
      "isFavorite": false
    },
    {
      "title": "A Feast for Crows",
      "author": "George R. R. Martin",
      "image": "https://pictures.abebooks.com/isbn/9780553390575-uk.jpg",
      "description":
          "This fourth novel shifts focus to the aftermath of the war, detailing the political landscape in a kingdom in turmoil. With many main characters absent, new figures rise to power, and the consequences of previous actions are felt throughout the realm. Martin delves into themes of loss, power vacuums, and the daily struggles of survival as Westeros grapples with the implications of its shattered alliances.",
      "rating": 4.4,
      "isFavorite": false
    },
    {
      "title": "A Dance with Dragons",
      "author": "George R. R. Martin",
      "image":
          "https://www.posters.eu/media/catalog/product/cache/cb3faf85ecb1e071fdba48f981c86454/h/o/house-of-the-dragon-poster-61x91.5cm.jpg",
      "description":
          "The fifth book runs parallel to A Feast for Crows, continuing the storylines of key characters as they navigate the treacherous waters of politics, war, and personal ambition. In the North, the Wall faces dire threats, while in the South, the battle for the Iron Throne rages on. Martin's intricate storytelling and character development reach new heights, immersing readers in a richly detailed world filled with moral complexity.",
      "rating": 4.5,
      "isFavorite": false
    },
    {
      "title": "The Hedge Knight",
      "author": "George R. R. Martin",
      "image": "https://d1466nnw0ex81e.cloudfront.net/n_iv/600/592169.jpg",
      "description":
          "Set in the world of A Song of Ice and Fire, The Hedge Knight is a novella that follows the adventures of Dunk and Egg, a hedge knight and his squire. Their journey through Westeros is filled with challenges, humor, and encounters with notable figures from history. This story provides a deeper understanding of the lore and culture of Martin's world, showcasing the struggles and aspirations of common folk amidst the grand events of the realm.",
      "rating": 4.3,
      "isFavorite": false
    },
    {
      "title": "The Winds of Winter",
      "author": "George R. R. Martin",
      "image":
          "https://d1s83tmo8l7caa.cloudfront.net/app/uploads/2016/12/07193730/winds-of-winter-book-cover.jpg",
      "description":
          "Upcoming sixth novel in the series A Song of Ice and Fire, The Winds of Winter is highly anticipated as it promises to bring resolution to numerous cliffhangers and deepen the complex narratives of the characters. Fans eagerly await revelations about the fate of Westeros as the threat of the White Walkers looms ever closer, and the battle for the Iron Throne intensifies.",
      "rating": 0.0,
      "isFavorite": false
    },
    {
      "title": "A Dream of Spring",
      "author": "George R. R. Martin",
      "image":
          "https://i.pinimg.com/originals/d4/58/20/d4582061b35ca603facbc3de139f3ac9.jpg",
      "description":
          "Upcoming seventh novel in the series, A Dream of Spring is expected to conclude the epic saga of A Song of Ice and Fire. As the characters face their final challenges and confront the consequences of their actions, readers can expect an explosive finale that ties together the intricate plotlines woven throughout the series.",
      "rating": 0.0,
      "isFavorite": false
    },
  ];

  final List<Map<String, dynamic>> harryPotterBooks = [
    {
      "title": "Harry Potter and the Philosopher's Stone",
      "author": "J.K. Rowling",
      "image":
          "https://image.tmdb.org/t/p/original/bVcMIUkUH0pbk5cyPnfUPSEPgj0.jpg",
      "description":
          "The first book in the Harry Potter series introduces Harry, a young boy who discovers he's a wizard on his eleventh birthday. He joins Hogwarts School of Witchcraft and Wizardry, makes lifelong friends, and faces dark forces that threaten his life and the wizarding world.",
      "rating": 4.8,
      "isFavorite": false
    },
    {
      "title": "Harry Potter and the Chamber of Secrets",
      "author": "J.K. Rowling",
      "image":
          "https://mybookcave.com/app/uploads/2020/09/Harry-Potter-and-the-Chamber-of-Secrets-400x600.jpg",
      "description":
          "In his second year at Hogwarts, Harry finds himself at the center of a mystery involving a cursed chamber, petrified students, and a powerful heirloom from the founders of Hogwarts. As he faces new challenges, Harry uncovers more about his family and his destiny.",
      "rating": 4.7,
      "isFavorite": false
    },
    {
      "title": "Harry Potter and the Prisoner of Azkaban",
      "author": "J.K. Rowling",
      "image":
          "https://image.tmdb.org/t/p/original/uONIJQrMBteTSOBj5pj7CMOfUw1.jpg",
      "description":
          "Harry's third year at Hogwarts brings news of a dangerous escapee, Sirius Black, who is said to be after him. As secrets about Harry's past are unveiled, he learns about friendship, loyalty, and the true nature of courage in the face of fear.",
      "rating": 4.9,
      "isFavorite": false
    },
    {
      "title": "Harry Potter and the Goblet of Fire",
      "author": "J.K. Rowling",
      "image":
          "https://image.tmdb.org/t/p/original/htAybCgvmCDlEsJXwnSQxPpvlXY.jpg",
      "description":
          "In his fourth year, Harry finds himself unexpectedly entered in the Triwizard Tournament, a magical competition between three wizarding schools. As the competition grows more dangerous, dark forces resurface, marking the return of Voldemort and setting the stage for a coming battle.",
      "rating": 4.8,
      "isFavorite": false
    },
    {
      "title": "Harry Potter and the Order of the Phoenix",
      "author": "J.K. Rowling",
      "image":
          "https://www.themoviedb.org/t/p/original/m3kg11bRlnI46mXEL3KCOJ3n9Zn.jpg",
      "description":
          "Harry returns to a Hogwarts fraught with tension and skepticism about Voldemort's return. With the help of the Order of the Phoenix, he navigates new dangers, struggles with authority, and builds alliances in his battle against the encroaching darkness.",
      "rating": 4.6,
      "isFavorite": false
    },
    {
      "title": "Harry Potter and the Half-Blood Prince",
      "author": "J.K. Rowling",
      "image": "https://picfiles.alphacoders.com/409/409117.jpg",
      "description":
          "Harry's sixth year brings an ominous focus on Voldemort's past as he and Dumbledore seek to uncover secrets that may hold the key to his defeat. With danger mounting, Harry learns painful truths about loyalty, sacrifice, and the price of love.",
      "rating": 4.8,
      "isFavorite": false
    },
    {
      "title": "Harry Potter and the Deathly Hallows",
      "author": "J.K. Rowling",
      "image":
          "https://collider.com/wp-content/uploads/harry-potter-and-the-deathly-hallows-part-2-movie-poster-01.jpg",
      "description":
          "In the final book of the series, Harry and his friends set out to destroy Voldemort's Horcruxes, embarking on a dangerous journey that tests their strength, resolve, and friendship. The epic conclusion sees Harry confronting his fate and the ultimate battle for the wizarding world.",
      "rating": 4.9,
      "isFavorite": false
    }
  ];

  final List<Map<String, dynamic>> lotr = [
    {
      "title": "The Fellowship of the Ring",
      "author": "J.R.R. Tolkien",
      "image":
          "https://image.tmdb.org/t/p/original/6oom5QYQ2yQTMJIbnvbkBL9cHo6.jpg",
      "description":
          "The first book in The Lord of the Rings series follows Frodo Baggins, a young hobbit who inherits the One Ring, a powerful artifact. He embarks on a journey with a diverse group of allies to destroy it before it falls into the hands of Sauron, the Dark Lord.",
      "rating": 4.9,
      "isFavorite": false
    },
    {
      "title": "The Two Towers",
      "author": "J.R.R. Tolkien",
      "image":
          "https://image.tmdb.org/t/p/original/rrGlNlzFTrXFNGXsD7NNlxq4BPb.jpg",
      "description":
          "The second book in the series follows Frodo and Sam as they continue their perilous journey to Mordor, accompanied by the creature Gollum. Meanwhile, their friends face battles and dark forces as they fight to protect Middle-earth.",
      "rating": 4.8,
      "isFavorite": false
    },
    {
      "title": "The Return of the King",
      "author": "J.R.R. Tolkien",
      "image":
          "https://image.tmdb.org/t/p/original/rCzpDGLbOoPwLjy3OAm5NUPOTrC.jpg",
      "description":
          "In the final book, Frodo and Sam reach Mount Doom to destroy the One Ring, while Aragorn leads the armies of Middle-earth in a final stand against Sauron's forces. The fate of Middle-earth is decided in this epic conclusion.",
      "rating": 5.0,
      "isFavorite": false
    }
  ];

  final List<Map<String, dynamic>> narnia = [
    {
      "title": "The Lion, the Witch and the Wardrobe",
      "author": "C.S. Lewis",
      "image":
          "http://img2.wikia.nocookie.net/__cb20140317235438/disney/images/f/fd/Chronicles_of_narnia_the_lion_the_witch_and_the_wardrobe.jpg",
      "description":
          "The first book introduces the Pevensie siblings, who enter the magical world of Narnia through a wardrobe. They join forces with Aslan, the great lion, to defeat the White Witch, who has cast Narnia into eternal winter.",
      "rating": 4.7,
      "isFavorite": false
    },
    {
      "title": "Prince Caspian",
      "author": "C.S. Lewis",
      "image":
          "https://image.tmdb.org/t/p/original/hasOsiU3D4QFw9ciKGrbb55JbuA.jpg",
      "description":
          "The Pevensies return to Narnia to help Prince Caspian reclaim his throne from his corrupt uncle. Together, they rally the creatures of Narnia for an epic battle to restore peace to the land.",
      "rating": 4.6,
      "isFavorite": false
    },
    {
      "title": "The Voyage of the Dawn Treader",
      "author": "C.S. Lewis",
      "image":
          "https://i0.wp.com/www.heyuguys.com/images/2010/12/Voyage-of-the-Dawn-Treader-Poster-5.jpg?w=1016&ssl=1",
      "description":
          "Lucy and Edmund Pevensie are pulled into Narnia again, this time with their cousin Eustace. They join King Caspian on a daring sea voyage to find the seven lost lords of Narnia, encountering dragons, merfolk, and enchanted islands.",
      "rating": 4.8,
      "isFavorite": false
    },
    {
      "title": "The Silver Chair",
      "author": "C.S. Lewis",
      "image":
          "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/42fe885b-f8db-4d13-a81d-47aabd4033bc/daxl20k-bb2e1ebf-a495-4d20-9ce2-1111a48b483e.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzQyZmU4ODViLWY4ZGItNGQxMy1hODFkLTQ3YWFiZDQwMzNiY1wvZGF4bDIway1iYjJlMWViZi1hNDk1LTRkMjAtOWNlMi0xMTExYTQ4YjQ4M2UuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.HL3hEoi1rEWEPC0njDCZEIDsdq81-LZJs-akTfcME9o",
      "description":
          "Eustace and his friend Jill Pole are called to Narnia to rescue Prince Rilian, the son of Caspian, who is under an enchantment. Their quest takes them deep into the treacherous and mysterious Underland.",
      "rating": 4.5,
      "isFavorite": false
    }
  ];

  final List<Map<String, dynamic>> percy = [
    {
      "title": "The Lightning Thief",
      "author": "Rick Riordan",
      "image":
          "https://image.tmdb.org/t/p/original/45FLfu74nXjhNHhbsTJ4ROsGLR5.jpg",
      "description":
          "Percy Jackson discovers he’s the son of Poseidon and is accused of stealing Zeus's lightning bolt. Alongside his friends Annabeth and Grover, he embarks on a quest across the U.S. to prevent a war among the gods.",
      "rating": 4.4,
      "isFavorite": false
    },
    {
      "title": "Sea of Monsters",
      "author": "Rick Riordan",
      "image": "https://picfiles.alphacoders.com/115/thumb-1920-115780.jpg",
      "description":
          "In the second book, Percy and his friends journey to the Sea of Monsters to retrieve the Golden Fleece and save their summer camp, Camp Half-Blood, from impending threats.",
      "rating": 4.3,
      "isFavorite": false
    },
    {
      "title": "The Titan’s Curse",
      "author": "Rick Riordan",
      "image":
          "https://images-na.ssl-images-amazon.com/images/I/91tKe3hv8yL.jpg",
      "description":
          "Percy, Annabeth, and their allies face new dangers as they race against time to rescue a captured goddess and stop the Titans from rising. Along the way, they meet new demigods and face powerful monsters.",
      "rating": 4.5,
      "isFavorite": false
    },
    {
      "title": "The Battle of the Labyrinth",
      "author": "Rick Riordan",
      "image":
          "http://www.betterreading.com.au/wp-content/uploads/2014/10/9780141346830.jpg",
      "description":
          "Percy and his friends navigate the dangerous labyrinth to stop Kronos's army from invading Camp Half-Blood, discovering secrets of the maze and facing deadly traps along the way.",
      "rating": 4.6,
      "isFavorite": false
    },
    {
      "title": "The Last Olympian",
      "author": "Rick Riordan",
      "image":
          "https://i0.wp.com/books.disney.com/content/uploads/2019/05/148478233X.jpg?fit=1875%2C2775&ssl=1",
      "description":
          "In the epic conclusion, Percy and his friends prepare for the final battle against Kronos and his forces, defending Mount Olympus and the mortal world from destruction.",
      "rating": 4.8,
      "isFavorite": false
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novels'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Game of Thrones Section
            buildBookSection(
                context, "Game of Thrones Books", gameOfThronesBooks),
            // Harry Potter Section
            buildBookSection(context, "Harry Potter Books", harryPotterBooks),
            buildBookSection(context, "The Lord of The Rings Books", lotr),
            buildBookSection(context, "The Chronicles of Narnia Books", narnia),
            buildBookSection(
                context, "Percy Jackson & the Olympians Books", percy),
            SizedBox(
              height: 120,
            )
          ],
        ),
      ),
    );
  }

  Widget buildBookSection(BuildContext context, String sectionTitle,
      List<Map<String, dynamic>> books) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            sectionTitle,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 200,
          child: PageView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = {
                "title": books[index]["title"] ?? "No Title Available",
                "author": books[index]["author"] ?? "Unknown Author",
                "image":
                    books[index]["image"] ?? "https://via.placeholder.com/150",
                "description":
                    books[index]["description"] ?? "Description not available.",
                "rating": books[index]["rating"]?.toString() ?? "No Rating",
              };
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDetailPage(
                        title: book['title'],
                        author: book['author'],
                        description: book['description'],
                        imageUrl: book['image'],
                        rating: book['rating'],
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(book["image"]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                book["title"],
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "by ${book["author"]}",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              SizedBox(height: 10),
                              Text("⭐ ${book["rating"]}"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
