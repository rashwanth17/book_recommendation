import 'dart:math';

import 'package:book/AnimatedText.dart';
import 'package:book/Book.dart';
import 'package:book/BookDeatils.dart';
import 'package:book/Bot.dart';
import 'package:book/Favourite.dart';
import 'package:book/theme_provider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Color> basicColors = [
    Colors.redAccent,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.yellowAccent,
    Colors.orangeAccent,
  ];
  // Color getRandomColor() {
  //   final random = Random();
  //   return basicColors[random.nextInt(basicColors.length)];
  // }

  final List<Map<String, String>> quotes = [
    {
      "quote": "A reader lives a thousand lives before he dies.",
      "author": "George R.R. Martin"
    },
    {
      "quote": "There is no friend as loyal as a book.",
      "author": "Ernest Hemingway"
    },
    {"quote": "So many books, so little time.", "author": "Frank Zappa"},
    {"quote": "Books are a uniquely portable magic.", "author": "Stephen King"},
    {
      "quote": "Until I feared I would lose it, I never loved to read.",
      "author": "Harper Lee"
    }
  ];

  final List<Map<String, dynamic>> books = [
    {
      "title": "The Molecule of More",
      "author": "Daniel Z. Lieberman",
      "description":
          "This book explores the molecule dopamine and how it drives human desires and behavior. It delves into how dopamine influences our decision-making processes, affecting our motivation and pleasure-seeking behaviors. Through engaging narratives and scientific insights, the author illustrates how understanding dopamine can lead to better choices in life, relationships, and work.",
      "image":
          "https://www.forewordreviews.com/books/covers/the-molecule-of-more.jpg",
      "isFavorite": false,
      "rating": 4.5,
      "genre": "Science"
    },
    {
      "title": "Think Like a Monk",
      "author": "Jay Shetty",
      "description":
          "The book offers advice on how to live a more meaningful, balanced, and focused life. Jay Shetty draws from his experiences as a monk to share valuable lessons on mindfulness, purpose, and resilience. He provides practical tips and exercises that can help readers cultivate a monk-like mindset in their everyday lives, enabling them to navigate challenges with grace and clarity.",
      "image":
          "https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781982134488/think-like-a-monk-9781982134488_hr.jpg",
      "isFavorite": false,
      "rating": 4.0,
      "genre": "Self-help"
    },
    {
      "title": "The Psychology of Money",
      "author": "Morgan Housel",
      "description":
          "This book teaches timeless lessons on wealth, greed, and happiness. Morgan Housel shares engaging stories and insights that reveal the complex relationship people have with money. He emphasizes that financial success isn't solely about knowledge or intelligence but also about behavior, mindset, and understanding one’s own relationship with money. Housel's compelling narratives encourage readers to reflect on their own financial choices and values.",
      "image": "https://media.thuprai.com/front_covers/psychology-of-money.jpg",
      "isFavorite": false,
      "rating": 4.7,
      "genre": "Finance"
    },
    {
      "title": "The Subtle Art of Not Giving a F*ck",
      "author": "Mark Manson",
      "description":
          "This book offers a counterintuitive approach to living a good life by embracing limitations and focusing on what really matters. Mark Manson challenges conventional self-help advice and encourages readers to confront their fears and weaknesses. He provides a candid exploration of how accepting life's challenges can lead to a more authentic and fulfilling existence, emphasizing that true happiness comes from solving problems rather than avoiding them.",
      "image":
          "https://i5.walmartimages.com/asr/3be5ebcf-c0c4-45b8-a49d-08baa6a14c87_1.636569a6333aa1529a0950793264911a.jpeg",
      "isFavorite": false,
      "rating": 4.5,
      "genre": "Self-help"
    },
    {
      "title": "Rich Dad Poor Dad",
      "author": "Robert T. Kiyosaki",
      "description":
          "This book explores the mindset and financial knowledge that can help achieve wealth through lessons from two contrasting father figures. Robert Kiyosaki shares the different approaches to money and investing that he learned from his 'rich dad' and 'poor dad.' Through anecdotes and practical advice, he encourages readers to rethink their assumptions about work, education, and financial success, ultimately guiding them towards financial independence.",
      "image": "https://images.thenile.io/r1000/9781612680194.jpg",
      "isFavorite": false,
      "rating": 4.7,
      "genre": "Finance"
    },
    {
      "title": "The Art of Being Alone",
      "author": "Renuka Gavrani",
      "description":
          "This book delves into finding peace and fulfillment in solitude, helping readers embrace alone time for personal growth. Renuka Gavrani offers practical strategies for cultivating a positive relationship with solitude, emphasizing its importance for self-reflection and creativity. The book encourages readers to see being alone as an opportunity for self-discovery and empowerment, rather than a state to be feared or avoided.",
      "image":
          "https://friendsbook.pk/cdn/shop/files/61GbHEZKOPL._SL1500.jpg?v=1704142480",
      "isFavorite": false,
      "rating": 4.3,
      "genre": "Self-help"
    },
    {
      "title": "Atomic Habits",
      "author": "James Clear",
      "description":
          "This book provides a comprehensive guide to building good habits and breaking bad ones, showing how small changes lead to remarkable results. James Clear presents a framework for understanding habit formation and provides actionable strategies for making lasting change. He illustrates how systems of improvement can help readers achieve their goals and emphasizes the importance of patience and consistency in personal growth.",
      "image":
          "https://wizdomapp.com/wp-content/uploads/2024/02/Atomic-Habits-1.png",
      "isFavorite": false,
      "rating": 4.9,
      "genre": "Self-help"
    },
    {
      "title": "Thinking, Fast and Slow",
      "author": "Daniel Kahneman",
      "description":
          "This book explores the two systems that drive the way we think—'fast' intuitive thinking and 'slow' logical thinking. Daniel Kahneman, a Nobel laureate, delves into cognitive psychology and behavioral economics to explain how these systems influence our decisions. He presents fascinating insights into human judgment and decision-making, revealing common biases and errors that can affect our thinking processes.",
      "image": "https://i.insider.com/541748b0eab8eade098fda39?width=1200",
      "isFavorite": false,
      "rating": 4.6,
      "genre": "Psychology"
    },
    {
      "title": "Deep Work",
      "author": "Cal Newport",
      "description":
          "This book emphasizes the power of focused, distraction-free work to produce better results in less time. Cal Newport argues that cultivating deep work habits is essential in a world filled with distractions. He provides practical strategies for enhancing concentration and productivity, helping readers to create a work environment that fosters deep thinking and high-quality output. Newport's insights are applicable to anyone looking to improve their focus and effectiveness in their personal and professional lives.",
      "image":
          "https://www.tirryaq.com/wp-content/uploads/2020/11/41QoykqonNL._SX317_BO1204203200_.jpg",
      "isFavorite": false,
      "rating": 4.4,
      "genre": "Productivity"
    },
    {
      "title": "Sapiens: A Brief History of Humankind",
      "author": "Yuval Noah Harari",
      "description":
          "This book explores the history of human evolution, society, and culture from ancient times to the present. Yuval Noah Harari examines how Homo sapiens came to dominate the Earth and the forces that shaped human history. Through engaging storytelling and thought-provoking analysis, he challenges readers to reconsider the foundations of human society and our place in the world, offering insights into the future of humanity.",
      "image":
          "https://pathakshamabesh.com/wp-content/uploads/2022/02/9780099590088.jpg",
      "isFavorite": false,
      "rating": 4.7,
      "genre": "History"
    },
    {
      "title": "The Intelligent Investor",
      "author": "Benjamin Graham",
      "description":
          "This classic book introduces value investing principles, helping readers make wise investment decisions by focusing on long-term strategy rather than market fluctuations. Graham emphasizes the importance of patience, research, and understanding a company’s true worth, rather than reacting to every market trend. His methods have influenced top investors, including Warren Buffett, and provide a solid foundation for anyone serious about growing their wealth.",
      "image":
          "https://m.media-amazon.com/images/I/71vllLbpsdL._UF1000,1000_QL80_.jpg",
      "isFavorite": false,
      "rating": 4.5,
      "genre": "Finance"
    },
    {
      "title": "Principles: Life and Work",
      "author": "Ray Dalio",
      "description":
          "Ray Dalio, one of the world’s leading investors, shares the principles that guided his success. This book offers valuable insights on setting meaningful goals, learning from mistakes, and making informed, data-driven decisions. Dalio’s unique approach combines life lessons with work strategies, making it an inspirational read for anyone who wants to achieve success in both personal and professional spheres. His candid storytelling and actionable advice provide a roadmap for overcoming challenges and achieving long-term success.",
      "image":
          "https://m.media-amazon.com/images/I/71-byw29G4L._AC_UF1000,1000_QL80_.jpg",
      "isFavorite": false,
      "rating": 4.4,
      "genre": "Finance"
    },
    {
      "title": "The Millionaire Next Door",
      "author": "Thomas J. Stanley ",
      "description":
          "This book explores the habits and lifestyles of America’s wealthiest, debunking common myths about how wealth is accumulated. It shows that millionaires often live modest lives and focus on smart financial choices rather than flashy spending. Through fascinating research and real-life case studies, the authors reveal the spending, saving, and investing habits that lead to financial independence and a secure future, proving that wealth is often the result of hard work, discipline, and smart money management.",
      "image":
          "https://cdn.kobo.com/book-images/ce7e93b9-e743-4915-9b76-f6f2cde47d99/353/569/90/False/the-millionaire-next-door-6.jpg",
      "isFavorite": false,
      "rating": 4.1,
      "genre": "Finance"
    },
    {
      "title": "A Random Walk Down Wall Street",
      "author": "Burton G. Malkiel",
      "description":
          "Malkiel provides an accessible overview of investing in the stock market, discussing strategies like index funds, long-term investing, and the efficient-market hypothesis. The book explores common investment myths, shares practical advice for beginner investors, and demonstrates how everyday individuals can effectively manage their portfolios. By advocating for a balanced and diversified approach to investing, Malkiel equips readers with the knowledge and confidence to make smart financial decisions in an unpredictable market.",
      "image":
          "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1529041799l/40242274.jpg",
      "isFavorite": false,
      "rating": 4.3,
      "genre": "Finance"
    },

    // {
    //   "title": "The Power of Now",
    //   "author": "Eckhart Tolle",
    //   "description":
    //       "Tolle guides readers on a transformative journey to mindfulness, teaching them to let go of past burdens and future anxieties to find peace in the present moment. This profound book encourages deep introspection and helps readers achieve mental clarity, resilience, and spiritual awakening by embracing the 'now.'",
    //   "image":
    //       "https://upload.wikimedia.org/wikipedia/en/6/66/TPON_Cover_LG.jpg",
    //   "isFavorite": false,
    //   "rating": 4.5,
    //   "genre": "Self-help"
    // },
    // {
    //   "title": "Dare to Lead",
    //   "author": "Brené Brown",
    //   "description":
    //       "Brown focuses on leadership through vulnerability, explaining how authenticity, empathy, and courage foster stronger, more resilient teams and leaders. This book is a compelling guide for anyone looking to inspire and lead with integrity while embracing the strength found in openness and understanding.",
    //   "image":
    //       "https://marineshop.net/wp-content/uploads/sites/3/2023/03/0399592522-dare-to-lead.png",
    //   "isFavorite": false,
    //   "rating": 4.4,
    //   "genre": "Self-help"
    // },
    // {
    //   "title": "Grit: The Power of Passion and Perseverance",
    //   "author": "Angela Duckworth",
    //   "description":
    //       "Duckworth’s research reveals that success depends more on perseverance than raw talent, offering insights on building resilience and staying motivated through adversity. She shares compelling stories and strategies for developing grit, proving that passion combined with persistence can lead to extraordinary achievements.",
    //   "image":
    //       "https://images-na.ssl-images-amazon.com/images/I/71w6pAlFOTL.jpg",
    //   "isFavorite": false,
    //   "rating": 4.3,
    //   "genre": "Self-help"
    // }

    // Add more books here...
  ];

  String selectedGenre = 'All';
  bool sortByRating = false;
  String searchQuery = '';

  // Toggle the favorite status
  void toggleFavorite(int index) {
    setState(() {
      books[index]['isFavorite'] = !books[index]['isFavorite'];
    });
  }

  List<Map<String, dynamic>> get filteredBooks {
    List<Map<String, dynamic>> filtered = books
        .where((book) =>
            (selectedGenre == 'All' || book['genre'] == selectedGenre) &&
            book['title'].toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    if (sortByRating) {
      filtered.sort((a, b) => b['rating'].compareTo(a['rating']));
    }

    return filtered;
  }

  List<Map<String, dynamic>> get favoriteBooks =>
      books.where((book) => book['isFavorite']).toList();

  int _selectedIndex = 0;
  bool _isKeyboardVisible = false;
  FocusNode _focusNode = FocusNode();
  // String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        // Update visibility state based on focus
        _isKeyboardVisible = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose(); // Dispose of the FocusNode
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedText(),
        // title: HyperText(text: "READLY"),
        actions: [
          IconButton(
            icon: Icon(Icons.sunny),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blueAccent, // Starting color
                        Colors.purpleAccent, // Ending color
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    focusNode: _focusNode,
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value; // Update search query
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      fillColor:
                          Colors.transparent, // Make fillColor transparent
                      filled: true,
                      suffixIcon: const Icon(Icons.search, color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15), // Adjust padding as needed
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Conditionally render the carousel based on keyboard visibility
                if (!_isKeyboardVisible) // Only show carousel if keyboard is not visible
                  CarouselSlider(
                    items: quotes.asMap().entries.map((entry) {
                      int index = entry.key;
                      var item = entry.value;

                      // Select two colors for the gradient
                      Color startColor =
                          basicColors[index % basicColors.length];
                      Color endColor =
                          basicColors[(index + 1) % basicColors.length];

                      return Container(
                        width: 250,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [startColor, endColor],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item["quote"]!,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "- ${item["author"]!}",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 100,
                      viewportFraction: 0.8,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                    ),
                  ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.red.withOpacity(0.55),
                            Colors.red.withOpacity(0.9),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        // color: Theme.of(context).colorScheme.primary
                      ),
                      child: GestureDetector(
                        // style: ElevatedButton.styleFrom(
                        //   backgroundColor: Theme.of(context).colorScheme.primary,
                        // ),
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    // color: Colors.green,
                                  ),
                                  height: 250,
                                  child: ListView(
                                    children: [
                                      ListTile(
                                        title: Text('All'),
                                        onTap: () {
                                          setState(() {
                                            selectedGenre = 'All';
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        title: Text('Science'),
                                        onTap: () {
                                          setState(() {
                                            selectedGenre = 'Science';
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        title: Text('Self-help'),
                                        onTap: () {
                                          setState(() {
                                            selectedGenre = 'Self-help';
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        title: Text('Finance'),
                                        onTap: () {
                                          setState(() {
                                            selectedGenre = 'Finance';
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        title: Text('History'),
                                        onTap: () {
                                          setState(() {
                                            selectedGenre = 'History';
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        title: Text('Psychology'),
                                        onTap: () {
                                          setState(() {
                                            selectedGenre = 'Psychology';
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        title: Text('Productivity'),
                                        onTap: () {
                                          setState(() {
                                            selectedGenre = 'Productivity';
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: Center(
                          child: Text(
                            'Select Genre',
                            textAlign: TextAlign.center,
                            style: TextStyle(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.red.withOpacity(0.55),
                            Colors.red.withOpacity(0.9),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        // color: Theme.of(context).colorScheme.primary
                      ),
                      child: GestureDetector(
                        // height: ,
                        onTap: () {
                          setState(() {
                            sortByRating = !sortByRating;
                          });
                        },
                        child: Center(
                          child: Text(
                            'Sort by Rating',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                // color: Theme.of(context).colorScheme.secondary,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.5,
                  ),
                  itemCount: filteredBooks.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetailPage(
                              title: filteredBooks[index]['title'],
                              author: filteredBooks[index]['author'],
                              description: filteredBooks[index]['description'],
                              imageUrl: filteredBooks[index]['image'],
                              rating: filteredBooks[index]['rating'].toString(),
                            ),
                          ),
                        );
                      },
                      child: Book(
                        title: filteredBooks[index]['title'],
                        imageUrl: filteredBooks[index]['image'],
                        isFavorite: filteredBooks[index]['isFavorite'],
                        rating: filteredBooks[index]['rating'],
                        onFavoriteToggle: () {
                          toggleFavorite(books.indexOf(filteredBooks[index]));
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // FloatingActionButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => Bot()),
          //     );
          //   },
          //   backgroundColor: Colors.redAccent,
          //   child: Icon(
          //     Icons.chat_bubble,
          //     // color: Colors.white,
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          FloatingActionButton(
            // backgroundColor: Colors.redAccent,
            child: Icon(
              Icons.favorite,
              color: Colors.redAccent,
            ),
            onPressed: () {
              if (favoriteBooks.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('No favorite books yet!')),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritesPage(
                      favoriteBooks: favoriteBooks,
                    ),
                  ),
                );
              }
            },
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
