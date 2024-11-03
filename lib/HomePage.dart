import 'dart:math';

import 'package:book/AnimatedText.dart';
import 'package:book/Book.dart';
import 'package:book/BookDeatils.dart';
import 'package:book/Bot.dart';
import 'package:book/Favourite.dart';
import 'package:book/fav_provider.dart';
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
      "title": "Man's Search for Meaning",
      "author": "Viktor E. Frankl",
      "description":
          "Drawing on his experiences as a Holocaust survivor, Viktor Frankl presents a powerful exploration of finding meaning even in the bleakest circumstances. Blending personal memoir with psychological insights, Frankl introduces his concept of 'logotherapy,' which emphasizes the importance of purpose and resilience. This profound work is not just a testament to the human spirit but also a guide to living a life filled with meaning and purpose, even amidst suffering.",
      "image":
          "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1535419394i/4069.jpg",
      "isFavorite": false,
      "rating": 4.6,
      "genre": "Psychology"
    },
    {
      "title": "The Power of Habit: Why We Do What We Do in Life and Business",
      "author": "Charles Duhigg",
      "description":
          "Charles Duhigg takes readers on a journey into the science of habits, revealing how they are formed, why they persist, and how they can be changed. Through fascinating stories and scientific research, he examines the 'habit loop' and how understanding this process can lead to meaningful transformations in personal and professional life. This insightful guide to behavior change has become a go-to resource for anyone looking to break bad habits, build new ones, or enhance productivity.",
      "image":
          "https://cdn.kobo.com/book-images/7ffa3bcd-e05f-4ed1-8f68-86ef36352d1f/1200/1200/False/the-power-of-habit-why-we-do-what-we-do-in-life-and-business-by-charles-duhigg-essentials.jpg",
      "isFavorite": false,
      "rating": 4.4,
      "genre": "Psychology"
    },
    {
      "title": "Grit: The Power of Passion and Perseverance",
      "author": "Angela Duckworth",
      "description":
          "Angela Duckworth’s research on 'grit' – the combination of passion and sustained perseverance – offers a fresh perspective on what it takes to succeed. Through compelling studies and real-life stories, Duckworth demonstrates that talent alone does not guarantee success; rather, it is persistence and resilience that drive extraordinary achievements. This motivational book encourages readers to cultivate grit, embrace challenges, and stay committed to their goals, regardless of setbacks.",
      "image":
          "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1632024090i/27213329.jpg",
      "isFavorite": false,
      "rating": 4.3,
      "genre": "Psychology"
    },
    {
      "title":
          "The Social Animal: The Hidden Sources of Love, Character, and Achievement",
      "author": "David Brooks",
      "description":
          "In this insightful work, David Brooks explores the role of unconscious mind and emotions in shaping our behaviors, relationships, and identities. Through the fictional lives of two characters, Brooks weaves together insights from psychology, sociology, and neuroscience to reveal how we connect with others, develop character, and find fulfillment. A blend of storytelling and scientific analysis, this book provides an accessible and profound look at the complexities of human nature and social behavior.",
      "image": "https://cdn.bookey.app/20220401143534045/20220401143821304.jpg",
      "isFavorite": false,
      "rating": 4.2,
      "genre": "Psychology"
    },
    {
      "title":
          "Quiet: The Power of Introverts in a World That Can't Stop Talking",
      "author": "Susan Cain",
      "description":
          "Susan Cain’s groundbreaking book celebrates the strengths of introverts and challenges the societal bias toward extroversion. Blending research, personal stories, and historical examples, Cain explores the unique contributions of introverts and offers advice on how they can thrive in a world that often overlooks their strengths. This empowering read provides valuable insights into personality differences and encourages appreciation for the quiet, thoughtful approach to life.",
      "image":
          "https://images-na.ssl-images-amazon.com/images/I/71aaO6VbyGL.jpg",
      "isFavorite": false,
      "rating": 4.4,
      "genre": "Psychology"
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
          "https://images-na.ssl-images-amazon.com/images/I/71FDkx5WllL.jpg",
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
    {
      "title":
          "The Productivity Project: Accomplishing More by Managing Your Time, Attention, and Energy",
      "author": "Chris Bailey",
      "description":
          "Chris Bailey spent a year conducting productivity experiments on himself, and in The Productivity Project, he shares his discoveries and actionable strategies. From managing time and energy to mastering focus, Bailey offers insights into what truly works for enhancing productivity. His approachable, hands-on advice helps readers tackle procrastination, prioritize important tasks, and create more fulfilling work habits. This book is an engaging read for anyone looking to maximize productivity in a way that’s both practical and sustainable.",
      "image": "https://m.media-amazon.com/images/I/81+QjeNZdRL._SL1500_.jpg",
      "isFavorite": false,
      "rating": 4.2,
      "genre": "Productivity"
    },
    {
      "title": "Mindset: The New Psychology of Success",
      "author": "Carol S. Dweck",
      "description":
          "Carol S. Dweck introduces the concept of 'mindset' and explains how our beliefs about our abilities can shape success in various areas of life, including work, relationships, and education. She contrasts the 'fixed mindset,' where people believe their talents are static, with the 'growth mindset,' where individuals embrace challenges and believe in their capacity to improve. Backed by decades of research, this book provides readers with actionable insights on developing a growth mindset to unlock their potential and achieve greater personal fulfillment.",
      "image": "https://www.betaglyph.com/content/images/2020/10/mindset.jpg",
      "isFavorite": false,
      "rating": 4.3,
      "genre": "Psychology"
    },
    {
      "title": "Dare to Lead",
      "author": "Brené Brown",
      "description":
          "Brown focuses on leadership through vulnerability, explaining how authenticity, empathy, and courage foster stronger, more resilient teams and leaders. This book is a compelling guide for anyone looking to inspire and lead with integrity while embracing the strength found in openness and understanding.",
      "image":
          "https://cloudfront.penguin.co.in/wp-content/uploads/2023/06/9780670098484-2.jpg",
      "isFavorite": false,
      "rating": 4.4,
      "genre": "Self-help"
    },
    {
      "title": "Guns, Germs, and Steel: The Fates of Human Societies",
      "author": "Jared Diamond",
      "description":
          "In this Pulitzer Prize-winning work, Jared Diamond explores the environmental and geographical factors that have shaped the course of human history. He argues that differences in the availability of domesticable animals and plants, along with geographical barriers, have significantly influenced the development of civilizations. Through a multidisciplinary approach, Diamond presents a compelling narrative that explains why some societies have thrived while others have struggled, challenging readers to reconsider historical narratives from a broader perspective.",
      "image":
          "http://img.valorebooks.com/FULL/97/9780/978073/9780736646291.jpg",
      "isFavorite": false,
      "rating": 4.5,
      "genre": "History"
    },
    {
      "title": "The Diary of a Young Girl",
      "author": "Anne Frank",
      "description":
          "Anne Frank's poignant diary chronicles her life in hiding during the Nazi occupation of the Netherlands. Written by a young Jewish girl, it offers a deeply personal perspective on the horrors of World War II, as well as insights into the human spirit's resilience. Through her eloquent writing, Anne reflects on her hopes, dreams, and fears, making this diary a timeless testament to the struggles faced by those living under oppressive regimes. It remains an essential read for understanding the impact of war and the importance of tolerance and human rights.",
      "image":
          "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1560816565i/48855.jpg",
      "isFavorite": false,
      "rating": 4.4,
      "genre": "History"
    },
    {
      "title": "A People's History of the United States",
      "author": "Howard Zinn",
      "description":
          "Howard Zinn presents a different perspective on American history by focusing on the experiences and struggles of marginalized groups. Through a narrative that highlights the voices of Native Americans, women, African Americans, and laborers, Zinn challenges traditional historical narratives that often glorify the actions of political leaders. This book invites readers to rethink the story of the United States and understand history from the ground up, making it a crucial addition to the study of American history.",
      "image":
          "https://d33wubrfki0l68.cloudfront.net/bc6b2a077e3752627d1e70ee13afd2c0cc8231a2/ed11d/images/book-16.jpg",
      "isFavorite": false,
      "rating": 4.3,
      "genre": "History"
    },
    {
      "title": "The History of the Decline and Fall of the Roman Empire",
      "author": "Edward Gibbon",
      "description":
          "Edward Gibbon's seminal work is a comprehensive analysis of the Roman Empire's decline over several centuries. Published in six volumes, it examines the political, military, and cultural factors contributing to the empire's fall. Gibbon's eloquent prose and rigorous scholarship have made this work a classic in historical literature. He explores themes of governance, decadence, and the rise of Christianity, providing readers with a nuanced understanding of one of history's most significant transformations.",
      "image":
          "https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781625584212/the-history-of-the-decline-and-fall-of-the-roman-empire-complete-9781625584212_hr.jpg",
      "isFavorite": false,
      "rating": 4.2,
      "genre": "History"
    },
    {
      "title": "The Silk Roads: A New History of the World",
      "author": "Peter Frankopan",
      "description":
          "Peter Frankopan's The Silk Roads offers a fresh perspective on world history by shifting the focus from the West to the East. This book explores the significance of trade routes that connected various civilizations, shaping cultures, economies, and politics across continents. Frankopan argues that the Silk Roads were crucial to the development of global connections and interactions. Through engaging storytelling and rich detail, this work invites readers to appreciate the interconnectedness of history and the influence of Eastern societies on the world.",
      "image":
          "https://www.bibdsl.co.uk/imagegallery2/bds/202126/9781526623560_3.jpg",
      "isFavorite": false,
      "rating": 4.6,
      "genre": "History"
    },
    {
      "title": "The Wright Brothers",
      "author": "David McCullough",
      "description":
          "David McCullough chronicles the incredible story of Orville and Wilbur Wright, two brothers who changed the course of aviation history. This biography delves into their relentless pursuit of flight, their innovative spirit, and the challenges they faced along the way. Through meticulous research and vivid storytelling, McCullough captures the essence of the Wright brothers' determination and ingenuity. This inspiring tale not only highlights their achievements but also reflects on the broader impact of their work on technology and society.",
      "image":
          "https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781471150364/wright-brothers-9781471150364_hr.jpg",
      "isFavorite": false,
      "rating": 4.3,
      "genre": "History"
    },
    {
      "title": "A Brief History of Time",
      "author": "Stephen Hawking",
      "description":
          "In this groundbreaking exploration of the universe, Stephen Hawking explains complex concepts of physics, such as black holes, time travel, and the Big Bang, in an accessible manner. With profound insights into space, time, and the nature of reality, the book takes readers on a journey through the mysteries of the cosmos, challenging them to ponder humanity's place in the vastness of the universe. It encourages readers to consider some of the most profound questions of existence, blending scientific rigor with philosophical inquiry.",
      "image":
          "https://d30a6s96kk7rhm.cloudfront.net/original/readings/978/059/307/9780593077184.jpg",
      "isFavorite": false,
      "rating": 4.5,
      "genre": "Science"
    },
    {
      "title": "The Selfish Gene",
      "author": "Richard Dawkins",
      "description":
          "Richard Dawkins presents a revolutionary view of evolution from the perspective of genes, proposing that our genetic material behaves 'selfishly' to ensure its own survival across generations. Using vivid metaphors and examples, Dawkins illustrates how complex behaviors, like altruism and cooperation, emerge as strategies for gene propagation. The book dives into the essence of what drives living organisms, sparking debate and reshaping our understanding of evolutionary biology, human nature, and the interconnectedness of life on Earth.",
      "image":
          "https://d33wubrfki0l68.cloudfront.net/351ac2babc733aaeb02c2631162484a42b367086/43578/images/book-the-selfish-gene.jpg",
      "isFavorite": false,
      "rating": 4.4,
      "genre": "Science"
    },
    {
      "title": "The 5 AM Club: Own Your Morning. Elevate Your Life.",
      "author": "Robin Sharma",
      "description":
          "In The 5 AM Club, Robin Sharma presents a powerful concept: waking up at 5 AM can dramatically transform your productivity and life. The book follows a fictional narrative of a struggling artist and an entrepreneur who learn the secrets of high achievers from a billionaire mentor. Sharma outlines a morning routine that incorporates exercise, reflection, and growth to kickstart your day and enhance performance. With actionable insights and motivational anecdotes, this book encourages readers to take control of their mornings and, ultimately, their lives.",
      "image": "https://m.media-amazon.com/images/I/61Av4S46owL._SY425_.jpg",
      "isFavorite": false,
      "rating": 4.3,
      "genre": "Productivity"
    },
    {
      "title": "Cosmos",
      "author": "Carl Sagan",
      "description":
          "In this timeless classic, Carl Sagan guides readers through the wonders of the universe, blending science, history, and philosophy to reveal the intricate connections between humanity and the cosmos. Sagan's eloquent writing brings to life the story of the stars, galaxies, and planets, as well as the scientific achievements that have expanded our knowledge of the universe. Cosmos is both a tribute to the spirit of scientific discovery and an invitation to dream about our place in the cosmos, reminding readers of the beauty and mystery of the natural world.",
      "image":
          "https://i.pinimg.com/originals/eb/83/34/eb833405c42de0ec19bf618cd7d96026.jpg",
      "isFavorite": false,
      "rating": 4.7,
      "genre": "Science"
    },
    {
      "title": "The Immortal Life of Henrietta Lacks",
      "author": "Rebecca Skloot",
      "description":
          "This compelling biography tells the story of Henrietta Lacks, an African American woman whose cancer cells, taken without her knowledge, became one of the most important tools in medicine. Known as HeLa cells, they have enabled countless breakthroughs in cancer research, genetics, and virology. Rebecca Skloot examines the intersections of ethics, science, and race, shedding light on the human cost behind scientific progress. This poignant narrative highlights the importance of bioethics and how one woman’s legacy continues to impact modern medicine.",
      "image":
          "https://img1.od-cdn.com/ImageType-100/1191-1/%7B2615090E-0B42-40C2-ABD3-6E05AAA66413%7DImg100.jpg",
      "isFavorite": false,
      "rating": 4.6,
      "genre": "Science"
    },
    {
      "title": "The Little Book That Still Beats the Market",
      "author": "Joel Greenblatt",
      "description":
          "In this compact yet powerful guide, Joel Greenblatt introduces the 'Magic Formula' – a simple, effective approach to value investing that anyone can understand. Using clear language and relatable examples, Greenblatt demystifies complex financial concepts, showing readers how to identify undervalued companies and build a winning portfolio. While lesser-known than some investing classics, this book has gained respect among investors for its straightforward, practical strategies and its ability to help everyday people navigate the stock market confidently. Ideal for beginners and seasoned investors alike, it offers a fresh, accessible take on value investing.",
      "image":
          "https://s3.amazonaws.com/finn--production/uploads/public_4f0b1fbb-2544-4595-892b-48c46d989fee_image.jpeg",
      "isFavorite": false,
      "rating": 4.2,
      "genre": "Finance"
    },
    {
      "title": "The Gene: An Intimate History",
      "author": "Siddhartha Mukherjee",
      "description":
          "This comprehensive work by Siddhartha Mukherjee traces the history of genetics, from its beginnings with Mendel’s pea plants to the latest advances in gene editing. Mukherjee combines storytelling with scientific insight, exploring the profound impact of genetics on identity, heredity, and medicine. With deep compassion and clarity, the book discusses the ethical and social challenges of genetic knowledge, while celebrating the scientific breakthroughs that hold promise for future generations. The Gene is a captivating look into the forces that shape human life at its most fundamental level.",
      "image":
          "https://m.media-amazon.com/images/I/418M6wFAXtL._SY445_SX342_.jpg",
      "isFavorite": false,
      "rating": 4.5,
      "genre": "Science"
    },
    {
      "title": "Getting Things Done: The Art of Stress-Free Productivity",
      "author": "David Allen",
      "description":
          "David Allen introduces a time-tested system for productivity, known as GTD (Getting Things Done), which helps individuals manage tasks, reduce stress, and achieve goals more effectively. Allen’s method focuses on capturing, clarifying, organizing, reflecting, and engaging with tasks systematically. With practical tips for managing a chaotic workload, this book offers a clear framework for staying organized and maximizing productivity, making it a popular choice for professionals seeking a structured approach to work and life.",
      "image":
          "https://cdn.shopify.com/s/files/1/0275/4091/4294/products/81trXFlSkCL_1200x1878.jpg?v=1589179010",
      "isFavorite": false,
      "rating": 4.3,
      "genre": "Productivity"
    },
    {
      "title": "The Power of Now: A Guide to Spiritual Enlightenment",
      "author": "Eckhart Tolle",
      "description":
          "While not strictly a productivity book, Eckhart Tolle's classic explores the importance of mindfulness and living in the present moment, both of which are essential for focused and meaningful work. Tolle argues that most stress and unhappiness come from dwelling on the past or worrying about the future. By cultivating presence and awareness, readers can experience a deeper sense of peace, reduce distractions, and improve productivity by focusing on the tasks at hand. This transformative guide has helped many find balance and clarity in their lives.",
      "image":
          "https://images.bwbcovers.com/096/The-Power-of-Now-Tolle-Eckhart-9780968236406.jpg",
      "isFavorite": false,
      "rating": 4.6,
      "genre": "Productivity"
    },
    {
      "title":
          "Eat That Frog!: 21 Great Ways to Stop Procrastinating and Get More Done in Less Time",
      "author": "Brian Tracy",
      "description":
          "In this motivational guide, Brian Tracy presents a simple but effective approach to beating procrastination and maximizing productivity. The book’s central metaphor—'eating the frog'—refers to tackling the most challenging task first, which can set the tone for a productive day. With 21 actionable strategies for prioritizing and completing tasks, Tracy provides readers with tools to manage time effectively, stay focused, and accomplish their most important goals with confidence.",
      "image": "https://images.gr-assets.com/books/1328854785l/95887.jpg",
      "isFavorite": false,
      "rating": 4.2,
      "genre": "Productivity"
    },
    {
      "title":
          "The One Thing: The Surprisingly Simple Truth Behind Extraordinary Results",
      "author": "Gary Keller and Jay Papasan",
      "description":
          "Gary Keller and Jay Papasan advocate for the power of focusing on a single, most important task each day to achieve remarkable results. They argue that by identifying and committing to 'The One Thing' that truly matters, individuals can make significant progress toward their goals without becoming overwhelmed. Through practical insights and examples, the authors show readers how to eliminate distractions, prioritize effectively, and stay on track for long-term success.",
      "image":
          "https://images-na.ssl-images-amazon.com/images/I/51fs1YC1VNL.jpg",
      "isFavorite": false,
      "rating": 4.4,
      "genre": "Productivity"
    },
    {
      "title": "Astrophysics for People in a Hurry",
      "author": "Neil deGrasse Tyson",
      "description":
          "In this concise and engaging introduction to astrophysics, Neil deGrasse Tyson distills complex ideas about the universe into digestible, captivating explanations. From dark matter to the Big Bang, Tyson covers the essentials of the cosmos, providing a compelling overview for readers short on time. With humor and clarity, he makes space science accessible and enjoyable, sparking curiosity about the wonders of the universe. This book is perfect for anyone wanting to better understand our place in the cosmos without getting bogged down in heavy scientific jargon.",
      "image":
          "https://img1.od-cdn.com/ImageType-100/0887-1/%7B5B1F43D8-338E-42C5-95C4-E71B803278AA%7DImg100.jpg",
      "isFavorite": false,
      "rating": 4.3,
      "genre": "Science"
    }
  ];

  String selectedGenre = 'All';
  bool sortByRating = false;
  String searchQuery = '';

  // Toggle the favorite status
  // void toggleFavorite(int index) {
  //   setState(() {
  //     books[index]['isFavorite'] = !books[index]['isFavorite'];
  //   });
  // }
  void toggleFavorite(int index) {
    final favoritesModel = Provider.of<FavoritesModel>(context, listen: false);
    favoritesModel.toggleFavorite(books[index]);
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
          FloatingActionButton(
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
