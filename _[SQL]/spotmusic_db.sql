/*
Navicat MySQL Data Transfer

Source Server         : Wamp64
Source Server Version : 50650
Source Host           : localhost:3306
Source Database       : spotmusic_db

Target Server Type    : MYSQL
Target Server Version : 50650
File Encoding         : 65001

Date: 2021-01-26 10:18:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `id_account` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_account`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of accounts
-- ----------------------------

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(24) NOT NULL,
  `password` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '$2y$10$S.vc0uvgYDbDNY0xFauUXu9VHRccJNNhXlswJFlQmtn8XZhYuQRBa');

-- ----------------------------
-- Table structure for albums
-- ----------------------------
DROP TABLE IF EXISTS `albums`;
CREATE TABLE `albums` (
  `id_album` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `release_year` year(4) NOT NULL,
  `photo_url` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_album`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of albums
-- ----------------------------
INSERT INTO `albums` VALUES ('1', 'Imaginaerum', '2011', 'assets/img/albums/nightwish/Imaginaerum.jpg');
INSERT INTO `albums` VALUES ('2', 'HELIX', '2018', 'assets/img/albums/amaranthe/helix.jpg');
INSERT INTO `albums` VALUES ('3', 'Endless Forms Most Beautiful', '2015', 'assets/img/albums/nightwish/endless_forms_most_beautiful.jpg');

-- ----------------------------
-- Table structure for albums_genres
-- ----------------------------
DROP TABLE IF EXISTS `albums_genres`;
CREATE TABLE `albums_genres` (
  `id_album` int(11) NOT NULL,
  `id_genre` int(11) NOT NULL,
  PRIMARY KEY (`id_album`,`id_genre`) USING BTREE,
  KEY `id_genre` (`id_genre`) USING BTREE,
  CONSTRAINT `albums_genres_ibfk_1` FOREIGN KEY (`id_album`) REFERENCES `albums` (`id_album`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `albums_genres_ibfk_2` FOREIGN KEY (`id_genre`) REFERENCES `genres` (`id_genre`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of albums_genres
-- ----------------------------
INSERT INTO `albums_genres` VALUES ('1', '17');
INSERT INTO `albums_genres` VALUES ('2', '17');
INSERT INTO `albums_genres` VALUES ('3', '17');

-- ----------------------------
-- Table structure for artists
-- ----------------------------
DROP TABLE IF EXISTS `artists`;
CREATE TABLE `artists` (
  `id_artist` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `biography` text COLLATE utf8_unicode_ci NOT NULL,
  `instruments` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `photo_url` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_artist`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of artists
-- ----------------------------
INSERT INTO `artists` VALUES ('1', 'Floor Jansen', 'After a high school musical, this young Flying Dutchy got hooked for life to music, singing and performing. It turned out to become a colorful career. I was born in the snowy February the 21st in 1981. I must have liked to cold and the snow for I moved to Finland 33 years later. A choice made to learn the language and the culture of my Finnish band mates. Guys I met over 10 years ago on a European tour where my Dutch band After Forever supported Nightwish. We got along very well and always stayed in touch throughout the years. Life is full of surprises, and here I am, living in Finland and singing in Nightwish!', 'Vocals', 'assets/img/artists/nightwish/member_floor.jpg');
INSERT INTO `artists` VALUES ('2', 'Tuomas Holopainen', 'I was born Tuomas Lauri Johannes Holopainen into a family of four, on Christmas Day 1976. Since then my home has been a small city of Kitee in North Carelia, Finland. Music came into my life at the age of 6 when my mother made me take piano lessons in a music school of Carelia, followed by clarinet and tenor saxophone studies some years later. ', 'Keyoboards', 'assets/img/artists/nightwish/member_tuomas.jpg');
INSERT INTO `artists` VALUES ('3', 'Marco Hietala', 'I was born as a younger son and named Marko Tapani Hietala, completing the Hietala family of four. My birth date is 14th of January 1966. I lived my first 15 years in Tervo, a little Savonian town in Middle Finland with a total population of about 2,500. No offence, I still have friends and family there.', 'Bass & Vocalss', 'assets/img/artists/nightwish/member_marco.jpg');
INSERT INTO `artists` VALUES ('4', 'Jukka Nevalainen', 'I was born in Kitee, Finland, on 21st of April 1978. I led a very happy childhood in a family of five: me, my mom, dad, sister and brother. Pesapallo, a Finnish variant of baseball, played a big part in my life in the early years, but at the age of 11, music finally saved me from sports (or maybe it saved sports from me, I do not know.). ', 'Drums', 'assets/img/artists/nightwish/member_jukka.jpg');
INSERT INTO `artists` VALUES ('5', 'Emppu Vuorinen', 'After careful planning and execution, Emppu and his twin brother popped out on June 24, 1978 in Kitee to the joy of the Vuorinen family. The final number of siblings came to be five: me, bro and three wonderful sisters. The family is completed by my mom and dad, the instigators of this chaos.', 'Guitars', 'assets/img/artists/nightwish/member_emppu.jpg');
INSERT INTO `artists` VALUES ('6', 'Troy Donockley', 'I was born as a baby in Cumbria to my wondrous parents. I spent my childhood dreaming of being a musician and aged 16 I achieved an end of year school report which read  (Troy seems to be out at sea, and it looks like he is never coming back).', 'Uilleann pipes, low whistles, bodhran, bouzouki & vocals', 'assets/img/artists/nightwish/member_troy.jpg');
INSERT INTO `artists` VALUES ('7', 'Kai Hahto', 'Born in 1973 in Vaasa, Finland, Kai started playing the drums at the age of 6. His mother and father saw him hitting on all pots and pans in the kitchen since he was 3 years old, so they decided to buy him a real drum kit.', 'Drums on (Endless Forms Most Beautiful)', 'assets/img/artists/nightwish/member_kai.jpg');
INSERT INTO `artists` VALUES ('8', 'Elize Ryd', 'Hanna Elise Isabell Maj Hostblomma Ryd (born 15 October 1984), known professionally as Elize Ryd, is a Swedish singer-songwriter, dancer, composer, and show artist, best known as one of the three vocalists in the melodic metalcore/power metal band Amaranthe. She also gained some popularity prior to the band\'s inception by performing guest vocals for the symphonic power metal band Kamelot, both on tour and in the studio. She sings in the soprano range.', 'Vocals', 'assets/img/artists/amaranthe/member_elize.jpg');
INSERT INTO `artists` VALUES ('9', 'Olof Morck', 'Olof Morck (born 12 December 1981 in Gothenburg, Sweden) is the guitarist and one of the songwriters of the metal band Amaranthe, as well as guitarist of the power metal band Dragonland. He is well known for his platinum blonde hair. He was also a member of Nightrage between 2006 and 2011 as a guitarist. Recently, he has provided two guitar solos for the album The Isolation Game by the Italian melodic death metal band Disarmonia Mundi. ', 'Guitars & Keyboard', 'assets/img/artists/amaranthe/member_olof.jpg');
INSERT INTO `artists` VALUES ('10', 'Henrik Englund Wilhelmsson', '', 'Vocals', 'assets/img/artists/amaranthe/member_henrik.jpg');
INSERT INTO `artists` VALUES ('11', 'Johan Andreassen', 'John Andreassen (born 26 August 1943, Oslo) is a Norwegian television producer who has been behind a number of TV productions for the Norwegian Broadcasting Corporation. He was in 2000 the country\'s only Professor of Multi-Camera Production, and has taught at Lillehammer University College. He has been with the Norwegian Broadcasting Corporation since 1964.', 'Bass', 'assets/img/artists/amaranthe/member_johan.jpg');
INSERT INTO `artists` VALUES ('12', 'Morten Lowe Sorensen', 'Danish drummer, Morten Loewe Sorenson, joined Swedish heavy metal, Amaranthe in 2008. In 2011, the group released their debut album, Amaranthe and most recently released their third album, Massive Addictive in October of 2014. ', 'Drums', 'assets/img/artists/amaranthe/member_morten.jpg');
INSERT INTO `artists` VALUES ('13', 'Nils Molin', 'Morten Lowe Sorensen (ur. 20 lipca 1983 w Esbjerg)  dunski perkusista. Morten Lowe Sorensen znany jest, prawdopodobnie, przede wszystkim z wystepow w szwedzkim zespole Amaranthe, ktorego jest czlonkiem od 2008 roku. Do 2014 roku nagral wraz z zespolem trzy albumy studyjne, a takze otrzymal nagrode Bandit Rock Awards.', 'Vocals', 'assets/img/artists/amaranthe/member_nils.jpg');

-- ----------------------------
-- Table structure for artists_bands
-- ----------------------------
DROP TABLE IF EXISTS `artists_bands`;
CREATE TABLE `artists_bands` (
  `id_artist` int(11) NOT NULL,
  `id_band` int(11) NOT NULL,
  PRIMARY KEY (`id_artist`,`id_band`) USING BTREE,
  KEY `id_band` (`id_band`) USING BTREE,
  CONSTRAINT `artists_bands_ibfk_1` FOREIGN KEY (`id_artist`) REFERENCES `artists` (`id_artist`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `artists_bands_ibfk_2` FOREIGN KEY (`id_band`) REFERENCES `bands` (`id_band`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of artists_bands
-- ----------------------------
INSERT INTO `artists_bands` VALUES ('1', '1');
INSERT INTO `artists_bands` VALUES ('2', '1');
INSERT INTO `artists_bands` VALUES ('3', '1');
INSERT INTO `artists_bands` VALUES ('4', '1');
INSERT INTO `artists_bands` VALUES ('5', '1');
INSERT INTO `artists_bands` VALUES ('6', '1');
INSERT INTO `artists_bands` VALUES ('7', '1');
INSERT INTO `artists_bands` VALUES ('8', '2');
INSERT INTO `artists_bands` VALUES ('9', '2');
INSERT INTO `artists_bands` VALUES ('10', '2');
INSERT INTO `artists_bands` VALUES ('11', '2');
INSERT INTO `artists_bands` VALUES ('12', '2');
INSERT INTO `artists_bands` VALUES ('13', '2');

-- ----------------------------
-- Table structure for bands
-- ----------------------------
DROP TABLE IF EXISTS `bands`;
CREATE TABLE `bands` (
  `id_band` int(11) NOT NULL AUTO_INCREMENT,
  `band_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `biography` text COLLATE utf8_unicode_ci NOT NULL,
  `release_year` year(4) NOT NULL,
  `photo_url` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_band`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of bands
-- ----------------------------
INSERT INTO `bands` VALUES ('1', 'Nightwish', 'It\'s July, 1996. A hidden campfire looms on the island in the middle of Lake Pyhajarvi, Kitee. Then at midnight, something happens that has far-reaching consequences. Tuomas Holopainen has an idea of a solo project that would play atmospheric (mood music.) The idea quickly crystallises: the sound would include acoustic guitars, flutes, strings, piano and female vocals. Guitarist Erno (Emppu) Vuorinen and vocalist Tarja Turunen soon join the project.', '1996', 'assets/img/bands/nightwish/band_cover.jpg');
INSERT INTO `bands` VALUES ('2', 'Amaranthe', 'These are the voyages of the visionary band AMARANTHE. Their ultimate mission: to explore the opaque realms between extreme metal and electronic tunes, to pioneer the invention of new approaches of joining two traditionally contradicting musical worlds, to boldly go where no metal band has gone before. Evolution requires visionaries. One of the biggest bangs of the modern metal universe happened in the fall of 2008.', '2008', 'assets/img/bands/amaranthe/band_cover.jpg');
INSERT INTO `bands` VALUES ('3', 'Bts', 'BTS (Hangul: ë°©íƒ„ì†Œë…„ë‹¨; RR: Bangtan Sonyeondan), also known as the Bangtan Boys, is a seven-\r\nmember South Korean boy band formed by Big Hit Entertainment. The name became a backronym for \r\nBeyond the Scene in July 2017. ', '2013', 'assets/img/bands/bts/bts.jpg');
INSERT INTO `bands` VALUES ('4', 'Exo', 'Exo (Korean: ì—‘ì†Œ; stylized as EXO) is a South Koreanâ€“Chinese boy band based in Seoul, with nine \r\nmembers: Suho, Baekhyun, Chanyeol, D.O., Kai, Sehun, Xiumin, Lay, and Chen. The band was formed \r\nby SM Entertainment in 2011 and debuted in 2012. Their music incorporates genres like pop, hip-hop, \r\nand R&B, alongside electronic dance music genres like house, trap, and synth-pop. Exo releases \r\nand performs music in Korean, Mandarin, and Japanese.', '2012', 'assets/img/bands/exo/exo.jpg');
INSERT INTO `bands` VALUES ('5', 'Black Pink', 'Black Pink (Hangul: ë¸”ëž™í•‘í¬; stylized as BLACKPINK or BLÎ›Æ†KPIÐ˜K) is a South Korean girl group \r\nformed by YG Entertainment, consisting of members Jisoo, Jennie, Lisa, and RosÃ©.', '2016', 'assets/img/bands/black pink/black_pink.jpg');
INSERT INTO `bands` VALUES ('6', 'Big Bang', 'Big Bang (Hangul: ë¹…ë±…; stylized as BIGBANG) is a South Korean boy band formed by YG Entertainment. \r\nWith members G-Dragon, T.O.P, Taeyang, Daesung, and Seungri, they are often cited as one of the most \r\ninfluential acts to shape the K-pop industry by helping spread the Korean Wave internationally and \r\ndubbed as the \"Kings of K-pop\" by the media.', '2006', 'assets/img/bands/big bang/big_bang.png');
INSERT INTO `bands` VALUES ('7', '3 Doors Down', '3 Doors Down is an American rock band from Escatawpa, Mississippi, that formed in 1996. The band \r\noriginally consisted of Brad Arnold (lead vocals, drums), Todd Harrell (bass guitar), Matt Roberts (lead \r\nguitar), and Chris Henderson (rhythm guitar). The band rose to international fame with their first single, \r\n\"Kryptonite\", which placed in the top three on the Billboard Hot 100 chart.', '2000', 'assets/img/bands/3 doors down/3_doors_down.jpg');
INSERT INTO `bands` VALUES ('8', 'Fade', 'Fade (stylized as fade) was a Japanese-American rock band formed in 1991. To date, Fade has released 5 \r\nmini-albums, 3 full-length studio albums, and 2 singles. Fade is currently signed with record label \r\nUniversal Music Japan. On April 9, 2014, fade announced an indefinite hiatus, in effect after the \r\ncompletion of their June tour.', '2002', 'assets/img/bands/fade/fade.jpg');
INSERT INTO `bands` VALUES ('9', 'Ac Dc', 'AC/DC are an Australian rock band formed in Sydney in 1973 by brothers Malcolm and Angus Young. \r\nTheir music has been described by music journalists as hard rock, blues rock, and, controversially and \r\nheavy metal.', '1975', 'assets/img/bands/ac dc/ac_dc.jpg');
INSERT INTO `bands` VALUES ('10', 'Imagine Dragons', 'Imagine Dragons is an American pop rock band from Las Vegas, Nevada, consisting of lead vocalist Dan \r\nReynolds, lead guitarist Wayne Sermon, bassist Ben McKee, and drummer Daniel Platzman.\r\nTheir name is an anagram for a phrase only known to members of the group, that Reynolds stated each \r\nmember approved of.', '2012', 'assets/img/bands/imagine dragons/imagine_dragons.jpg');
INSERT INTO `bands` VALUES ('11', 'Alan Walker', 'Alan Olav Walker\r\n(born 24 August\r\n1997) is a Norwegian\r\nDJ and record\r\nproducer, born in\r\nNorthampton,\r\nEngland. He is best\r\nknown for his 2015\r\nsingle \"Faded\",\r\nwhich received\r\nplatinum\r\ncertifications in\r\nover 10 countries.\r\nHe was ranked 36th\r\non DJ Mags Top 100\r\nDJs list of 2018,\r\nplacing 19 positions\r\nlower than the\r\nprevious year.', '2012', 'assets/img/bands/alan walker/Allen Walker.jpeg');
INSERT INTO `bands` VALUES ('12', 'Paradise Lost', 'Most people will\r\nknow Medusa as the\r\nGorgon from Greek\r\nmythology; she is\r\nthe infamous beast\r\nwith venomous snakes\r\nfor hair who will\r\nturn anyone that\r\ndares to look into\r\nher eyes to stone.\r\nIt is this hideous\r\ncreature who\r\nPARADISE LOST have\r\nchosen to be the\r\nfigureheard for\r\ntheir 15th studio\r\nalbum, as, from a\r\nphilosophical\r\nperspective, she is\r\nmore than simply a\r\nmonster. Singer Nick\r\nHolmes started his\r\nresearch, intrigued\r\nto find greater\r\nmeaning behind the\r\nsymbol of Medusa and\r\nbecame particularly\r\nfascinated by the\r\nGorgonâ€™s nihilistic\r\nconnotations.', '1988', 'assets/img/bands/paradise lost/Paradise Lost.jpg');
INSERT INTO `bands` VALUES ('13', 'Within Temptation', 'Within Temptation is\r\na Dutch symphonic\r\nmetal band founded\r\nin April 1996 by\r\nvocalist Sharon den\r\nAdel and guitarist\r\nRobert Westerholt.\r\nThey have always\r\nbeen classified by\r\ncritics as gothic\r\nmetal, although the\r\n\"gothic\" influence\r\nvaries with each\r\nalbum. Their most\r\nprominent and\r\nwell-known sound is\r\ndescribed as\r\nsymphonic metal,\r\nalthough their\r\nearlier material,\r\nsuch as debut album\r\nEnter, was mostly\r\ngothic metal, with\r\nEnter also having a\r\nhint of doom metal.', '1996', 'assets/img/bands/within temptation/Wirhin_Tempation.jpg');
INSERT INTO `bands` VALUES ('14', 'Epica', 'Epica is a Dutch\r\nsymphonic meta]\r\nband, founded by\r\nguitarist and\r\nvocalist Mark Jansen\r\nafter his departure\r\nfrom After Forever.\r\nFormed as a\r\nsymphonic metal band\r\nwith gothic\r\ntendencies, later\r\nEpica have\r\nincorporated into\r\ntheir sound strong\r\ndeath metal\r\ninfluences. Starting\r\nfrom the third\r\nalbum, even\r\nprogressive metal\r\nattitudes have\r\nbecome evident. In\r\naddition, the band\r\noften uses thrash\r\nmetal and groove\r\nmetal riffs, black\r\nmetal passages\r\n(mostly in the drum\r\ntechnique), power\r\nmetal moments and\r\nreferences to Arabic\r\nmusic.', '2002', 'assets/img/bands/epica/epica.jpg');
INSERT INTO `bands` VALUES ('15', 'Linkin Park', 'Linkin Park is an\r\nAmerican rock band\r\nfrom Agoura Hills,\r\nCalifornia. Formed\r\nin 1996, the band\r\nrose to\r\ninternational fame\r\nwith their debut\r\nalbum Hybrid Theory\r\n(2000), which was\r\ncertified Diamond by\r\nthe RIAA in 2005,\r\nand multi-Platinum\r\nin several other\r\ncountries. Their\r\nfollowing studio\r\nalbum Meteora\r\ncontinued the bands\r\nsuccess, topping the\r\nBillboard 200 album\r\nchart in 2003, and\r\nwas followed by\r\nextensive touring\r\nand charity work.', '1996', 'assets/img/bands/linkin park/Linkin Park.jpeg');

-- ----------------------------
-- Table structure for bands_albums
-- ----------------------------
DROP TABLE IF EXISTS `bands_albums`;
CREATE TABLE `bands_albums` (
  `id_band` int(11) NOT NULL,
  `id_album` int(11) NOT NULL,
  PRIMARY KEY (`id_band`,`id_album`) USING BTREE,
  KEY `id_album` (`id_album`) USING BTREE,
  CONSTRAINT `bands_albums_ibfk_1` FOREIGN KEY (`id_band`) REFERENCES `bands` (`id_band`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bands_albums_ibfk_2` FOREIGN KEY (`id_album`) REFERENCES `albums` (`id_album`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of bands_albums
-- ----------------------------
INSERT INTO `bands_albums` VALUES ('1', '1');
INSERT INTO `bands_albums` VALUES ('2', '2');
INSERT INTO `bands_albums` VALUES ('1', '3');

-- ----------------------------
-- Table structure for blocked
-- ----------------------------
DROP TABLE IF EXISTS `blocked`;
CREATE TABLE `blocked` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `by` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`,`by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of blocked
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('79', 'Metal');
INSERT INTO `categories` VALUES ('80', 'Electronic');
INSERT INTO `categories` VALUES ('81', 'Hip-Hop');

-- ----------------------------
-- Table structure for chat
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `from` (`from`,`to`,`read`),
  KEY `to` (`to`,`read`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of chat
-- ----------------------------

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `tid` (`tid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for downloads
-- ----------------------------
DROP TABLE IF EXISTS `downloads`;
CREATE TABLE `downloads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `by` int(11) NOT NULL,
  `track` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `track` (`track`),
  KEY `by` (`by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of downloads
-- ----------------------------
INSERT INTO `downloads` VALUES ('1', '1', '1', '2019-05-19 09:27:19');

-- ----------------------------
-- Table structure for genres
-- ----------------------------
DROP TABLE IF EXISTS `genres`;
CREATE TABLE `genres` (
  `id_genre` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `release_year` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `photo_url` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_genre`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of genres
-- ----------------------------
INSERT INTO `genres` VALUES ('1', 'Pop', 'Pop music is a genre of popular music that originated in its modern form in the United States and United Kingdom during the mid-1950s. The terms \"popular music\" and \"pop music\" are often used interchangeably, although the former describes all music that is popular and includes many diverse styles. \"Pop\" and \"rock\" were roughly synonymous terms until the late 1960s, when they became increasingly differentiated from each other. ', '1940', 'assets/img/genres/pop.jpg');
INSERT INTO `genres` VALUES ('2', 'Mood', 'Easy listening\r\n(sometimes known as\r\nmood music) is a\r\npopular music genre\r\nand radio format\r\nthat was most\r\npopular during the\r\n1950s to 1970s. It\r\nis related to\r\nmiddle-of-the-road\r\n(MOR) music and\r\nencompasses\r\ninstrumental\r\nrecordings of\r\nstandards, hit songs\r\nand popular non-rock\r\nvocals. ', '1940', 'assets/img/genres/mood.jpg');
INSERT INTO `genres` VALUES ('3', 'Electronic', 'Electronic dance\r\nmusic (EDM), also\r\nknown as dance\r\nmusic, club music,\r\nor simply dance, is\r\na broad range of\r\npercussive\r\nelectronic music\r\ngenres made largely\r\nfor nightclubs,\r\nraves and festivals.\r\nIt is generally\r\nproduced for\r\nplayback by disc\r\njockeys who create\r\nseamless selections\r\nof tracks, called a\r\nmix by segueing from\r\none recording to\r\nanother.', '1980', 'assets/img/genres/elect-dance.jpg');
INSERT INTO `genres` VALUES ('4', 'Hip-Hop', 'Hip hop or hip-hop,\r\nis a culture and art\r\nmovement that began\r\nin the Bronx in New\r\nYork City during the\r\nlate 1970s. The\r\norigins of the word\r\nare often disputed.\r\nIt is also argued as\r\nto whether hip hop\r\nstarted in the South\r\nor West Bronx. While\r\nthe term hip hop is\r\noften used to refer\r\nexclusively to hip\r\nhop music (also\r\ncalled rap), hip hop\r\nis characterized by\r\nnine elements, of\r\nwhich only four\r\nelements are\r\nconsidered essential\r\nto understand hip\r\nhop musically. The\r\nmain elements of hip\r\nhop consist of four\r\nmain pillars.', '1970', 'assets/img/genres/hip-hop.jpg');
INSERT INTO `genres` VALUES ('5', 'Chill-out', 'Chill-out (shortened\r\nas chill; also\r\ntypeset as chillout\r\nor chill out) is a\r\nloosely defined form\r\nof popular music\r\ncharacterized by\r\nslow tempos and\r\nrelaxed moods. The\r\ndefinition of\r\n\"chill-out music\"\r\nhas evolved\r\nthroughout the\r\ndecades, and\r\ngenerally refers to\r\nanything that might\r\nbe identified as a\r\nmodern type of easy\r\nlistening. Some of\r\nthe genres\r\nassociated with\r\n\"chill\" include\r\ndowntempo,\r\nclassical, dance,\r\njazz, hip hop,\r\nworld, pop, lounge,\r\nand ambient.', '1989', 'assets/img/genres/chill.jpg');
INSERT INTO `genres` VALUES ('6', 'Workout', 'The interplay of\r\nexercise and music\r\nhave been\r\nlong-discussed,\r\ncrossing the\r\ndisciplines of\r\nbiomechanics,\r\nneurology,\r\nphysiology, and\r\nsport psychology.\r\nPeople\r\n\"automatically feel\r\nthe beat\" of the\r\nmusic they listen to\r\nand instinctively\r\nadjust their walking\r\npace and heart rate\r\nto the tempo of the\r\nmusic. Listening to\r\nmusic while\r\nexercising has been\r\nfound in multiple\r\nstudies to create an\r\nincreased sense of\r\nmotivation,\r\ndistracting the mind\r\nwhile increasing\r\nheart rate.', '2009', 'assets/img/genres/workout.jpg');
INSERT INTO `genres` VALUES ('7', 'Party', 'Party Music was\r\noriginally scheduled\r\nto be released in\r\nearly September\r\n2001, but the\r\nrelease was delayed\r\nuntil November of\r\nthat year due to the\r\ncover art, which\r\ndepicted Boots Riley\r\nand Pam the\r\nFunkstress\r\ndestroying the twin\r\ntowers of the World\r\nTrade Center using\r\nwhat appeared to be\r\na detonator. The\r\napparent detonator\r\nwas actually an\r\nelectronic tuner.\r\nThe original cover\r\nwas created in June\r\n2001.', '2001', 'assets/img/genres/party.jpg');
INSERT INTO `genres` VALUES ('8', 'Rock', 'Rock music is a\r\nbroad genre of\r\npopular music that\r\noriginated as \"rock\r\nand roll\" in the\r\nUnited States in the\r\nearly 1950s, and\r\ndeveloped into a\r\nrange of different\r\nstyles in the 1960s\r\nand later,\r\nparticularly in the\r\nUnited Kingdom and\r\nin the United\r\nStates.', '1950', 'assets/img/genres/rock.jpg');
INSERT INTO `genres` VALUES ('9', 'Dinner', 'Dinner Music is an\r\nalbum by American\r\ncomposer, bandleader\r\nand keyboardist\r\nCarla Bley recorded\r\nin 1976 and released\r\non the Watt/ECM\r\nlabel in 1977.', '1977', 'assets/img/genres/dinner.jpg');
INSERT INTO `genres` VALUES ('10', 'Jazz', 'Jazz is a music\r\ngenre that\r\noriginated in the\r\nAfrican-American\r\ncommunities of New\r\nOrleans, United\r\nStates, in the late\r\n19th and early 20th\r\ncenturies, and\r\ndeveloped from roots\r\nin blues and\r\nragtime. Jazz is\r\nseen by many as\r\n\"Americas classical\r\nmusic\". Since the\r\n1920s Jazz Age, jazz\r\nhas become\r\nrecognized as a\r\nmajor form of\r\nmusical expression.\r\nIt then emerged in\r\nthe form of\r\nindependent\r\ntraditional and\r\npopular musical\r\nstyles, all linked\r\nby the common bonds\r\nof African-American\r\nand\r\nEuropean-American\r\nmusical parentage\r\nwith a performance\r\norientation.', '1921', 'assets/img/genres/jazz.jpg');
INSERT INTO `genres` VALUES ('11', 'RnB', 'Rhythm and blues,\r\ncommonly abbreviated\r\nas R&B, is a genre\r\nof popular music\r\nthat originated in\r\nAfrican American\r\ncommunities in the\r\n1940s. The term was\r\noriginally used by\r\nrecord companies to\r\ndescribe recordings\r\nmarketed\r\npredominantly to\r\nurban African\r\nAmericans, at a time\r\nwhen \"urbane,\r\nrocking, jazz based\r\nmusic with a heavy,\r\ninsistent beat\" was\r\nbecoming more\r\npopular In the\r\ncommercial rhythm\r\nand blues music\r\ntypical of the 1950s\r\nthrough the 1970s,\r\nthe bands usually\r\nconsisted of piano,\r\none or two guitars,\r\nbass, drums, one or\r\nmore saxophones, and\r\nsometimes background\r\nvocalists.', '1940', 'assets/img/genres/rnb.jpg');
INSERT INTO `genres` VALUES ('12', 'Romance', 'The term romance\r\n(Spanish: romance\r\nromanza, Italian:\r\nromanza, German:\r\nRomanze, French:\r\nromance, Russian:\r\nÑ€Ð¾Ð¼Ð°Ð½Ñ, Portuguese:\r\nromance, Romanian:\r\nromanÅ£Äƒ) has a\r\ncenturies-long\r\nhistory. Applied to\r\nnarrative ballads in\r\nSpain, it came to be\r\nused by the 18th\r\ncentury for simple\r\nlyrical pieces not\r\nonly for voice, but\r\nalso for instruments\r\nalone. The Oxford\r\nDictionary of\r\nMusic[1] states that\r\n\"generally it\r\nimplies a specially\r\npersonal or tender\r\nquality\". ', '1866', 'assets/img/genres/romance.jpg');
INSERT INTO `genres` VALUES ('13', 'Indie', 'Independent music\r\n(often referred to\r\nas indie music or\r\nindie) is music\r\nproduced\r\nindependently from\r\ncommercial record\r\nlabels or their\r\nsubsidiaries, a\r\nprocess that may\r\ninclude an\r\nautonomous,\r\ndo-it-yourself\r\napproach to\r\nrecording and\r\npublishing. The term\r\nindie is sometimes\r\nused to describe a\r\ngenre (such as indie\r\nrock and indie pop),\r\nand as a genre term,\r\n\"indie\" may include\r\nmusic that is not\r\nindependently\r\nproduced, and many\r\nindependent music\r\nartists do not fall\r\ninto a single,\r\ndefined musical\r\nstyle or genre and\r\ncreate\r\nself-published music\r\nthat can be\r\ncategorized into\r\ndiverse genres.', '1920', 'assets/img/genres/indie.jpeg');
INSERT INTO `genres` VALUES ('14', 'Gaming', 'Video game music is\r\nthe soundtrack that\r\naccompanies video\r\ngames. Early video\r\ngame music was once\r\nlimited to simple\r\nmelodies of early\r\nsound synthesizer\r\ntechnology. These\r\nlimitations inspired\r\nthe style of music\r\nknown as chiptunes,\r\nwhich combines\r\nsimple melodic\r\nstyles with more\r\ncomplex patterns or\r\ntraditional music\r\nstyles, and became\r\nthe most popular\r\nsound of the first\r\nvideo games. ', '2012', 'assets/img/genres/gaming.jpg');
INSERT INTO `genres` VALUES ('15', 'Soul', 'Soul music (often\r\nreferred to simply\r\nas soul) is a\r\npopular music genre\r\nthat originated in\r\nthe African American\r\ncommunity in the\r\nUnited States in the\r\n1950s and early\r\n1960s. It combines\r\nelements of\r\nAfrican-American\r\ngospel music, rhythm\r\nand blues and jazz.\r\nSoul music became\r\npopular for dancing\r\nand listening in the\r\nUnited States, where\r\nrecord labels such\r\nas Motown, Atlantic\r\nand Stax were\r\ninfluential during\r\nthe Civil Rights\r\nMovement. Soul also\r\nbecame popular\r\naround the world,\r\ndirectly influencing\r\nrock music and the\r\nmusic of Africa.', '1950', 'assets/img/genres/soul.jpg');
INSERT INTO `genres` VALUES ('16', 'Classical', 'Classical music is\r\nart music produced\r\nor rooted in the\r\ntraditions of\r\nWestern culture,\r\nincluding both\r\nliturgical\r\n(religious) and\r\nsecular music. While\r\na more precise term\r\nis also used to\r\nrefer to the period\r\nfrom 1750 to 1820\r\n(the Classical\r\nperiod), this\r\narticle is about the\r\nbroad span of time\r\nfrom before the 6th\r\ncentury AD to the\r\npresent day, which\r\nincludes the\r\nClassical period and\r\nvarious other\r\nperiods. The central\r\nnorms of this\r\ntradition became\r\ncodified between\r\n1550 and 1900, which\r\nis known as the\r\ncommon-practice\r\nperiod. The major\r\ntime divisions of\r\nWestern art music\r\nare as follows: ', '1829', 'assets/img/genres/classical.jpg');
INSERT INTO `genres` VALUES ('17', 'Metal', 'Heavy metal (or\r\nsimply metal) is a\r\ngenre of rock music\r\nthat developed in\r\nthe late 1960s and\r\nearly 1970s, largely\r\nin the United\r\nKingdom. With roots\r\nin blues rock,\r\npsychedelic rock,\r\nand acid rock, the\r\nbands that created\r\nheavy metal\r\ndeveloped a thick,\r\nmassive sound,\r\ncharacterized by\r\nhighly amplified\r\ndistortion, extended\r\nguitar solos,\r\nemphatic beats, and\r\noverall loudness.', '1960', 'assets/img/genres/metal.jpg');
INSERT INTO `genres` VALUES ('18', 'Latin', 'Latin music\r\n(Portuguese and\r\nSpanish: mÃºsica\r\nlatina) is a genre\r\nused by the music\r\nindustry as a\r\ncatch-all term for\r\nmusic that comes\r\nfrom Spanish- and\r\nPortuguese-speaking\r\nareas of the world,\r\nnamely Ibero America\r\nand Iberian\r\nPeninsula, as well\r\nas music sung in\r\neither language. In\r\nthe United States,\r\nthe music industry\r\ndefines Latin music\r\nas any recording\r\nsung mostly in\r\nSpanish regardless\r\nof its genre or the\r\nartists nationality.', '1900', 'assets/img/genres/latin.jpg');
INSERT INTO `genres` VALUES ('19', 'Kids', 'Childrens music or\r\nkids music is music\r\ncomposed and\r\nperformed for\r\nchildren. In\r\nEuropean-influenced\r\ncontexts this means\r\nmusic, usually\r\nsongs, written\r\nspecifically for a\r\njuvenile audience.\r\nThe composers are\r\nusually adults.\r\nChildrens music has\r\nhistorically held\r\nboth entertainment\r\nand educational\r\nfunctions. Childrens\r\nmusic is often\r\ndesigned to provide\r\nan entertaining\r\nmeans of teaching\r\nchildren about their\r\nculture, other\r\ncultures, good\r\nbehavior, facts and\r\nskills. Many are\r\nfolk songs, but\r\nthere is a whole\r\ngenre of educational\r\nmusic that has\r\nbecome increasingly\r\npopular. ', '1907', 'assets/img/genres/kids.jpg');
INSERT INTO `genres` VALUES ('20', 'Reggae', 'Reggae is a music\r\ngenre that\r\noriginated in\r\nJamaica in the late\r\n1960s. The term also\r\ndenotes the modern\r\npopular music of\r\nJamaica and its\r\ndiaspora. A 1968\r\nsingle by Toots and\r\nthe Maytals, \"Do the\r\nReggay\" was the\r\nfirst popular song\r\nto use the word\r\n\"reggae,\"\r\neffectively naming\r\nthe genre and\r\nintroducing it to a\r\nglobal audience.', '1980', 'assets/img/genres/reggae.jpg');
INSERT INTO `genres` VALUES ('21', 'Blues', 'Blues is a music genre and musical form which was originated in the Deep South of the United States around the 1870s by African Americans from roots in African musical traditions, African-American work songs, spirituals, and the folk music of white Americans of European heritage. Blues incorporated spirituals, work songs, field hollers, shouts, chants, and rhymed simple narrative ballads.\r\n\r\n', '1862', 'assets/img/genres/blues.jpg');
INSERT INTO `genres` VALUES ('22', 'Funk', 'Funk is a music\r\ngenre that\r\noriginated in\r\nAfrican-American\r\ncommunities in the\r\nmid-1960s when\r\nAfrican-American\r\nmusicians created a\r\nrhythmic, danceable\r\nnew form of music\r\nthrough a mixture of\r\nsoul music, jazz,\r\nand rhythm and blues\r\n(R&B). Funk\r\nde-emphasizes melody\r\nand chord\r\nprogressions and\r\nfocuses on a strong\r\nrhythmic groove of a\r\nbass line played by\r\nan electric bassist\r\nand a drum part\r\nplayed by a drummer.\r\nLike much of\r\nAfrican-inspired\r\nmusic, funk\r\ntypically consists\r\nof a complex groove\r\nwith rhythm\r\ninstruments playing\r\ninterlocking\r\ngrooves.', '1960', 'assets/img/genres/funk.jpeg');
INSERT INTO `genres` VALUES ('23', 'Punk', 'Punk rock (or\r\n\"punk\") is a rock\r\nmusic genre that\r\ndeveloped in the\r\nmid-1970s in the\r\nUnited States,\r\nUnited Kingdom, and\r\nAustralia. Rooted in\r\n1960s garage rock\r\nand other forms of\r\nwhat is now known as\r\n\"proto-punk\" music,\r\npunk rock bands\r\nrejected perceived\r\nexcesses of\r\nmainstream 1970s\r\nrock. Punk bands\r\ntypically produced\r\nshort or fast-paced\r\nsongs, with\r\nhard-edged melodies\r\nand singing styles,\r\nstripped-down\r\ninstrumentation, and\r\noften political,\r\nanti-establishment\r\nlyrics.', '1970', 'assets/img/genres/punk.jpg');
INSERT INTO `genres` VALUES ('24', 'Country', 'Country music, also\r\nknown as country and\r\nwestern (or simply\r\ncountry), and\r\nhillbilly music, is\r\na genre of popular\r\nmusic that\r\noriginated in the\r\nsouthern United\r\nStates in the early\r\n1920s. It takes its\r\nroots from genres\r\nsuch as folk music\r\n(especially\r\nAppalachian folk and\r\nWestern music) and\r\nblues. ', '1920', 'assets/img/genres/country.jpeg');
INSERT INTO `genres` VALUES ('25', 'Arab', 'Arabic music\r\n(Arabic: Ø§Ù„Ù…ÙˆØ³ÙŠÙ‚Ù‰\r\nØ§Ù„Ø¹Ø±Ø¨ÙŠØ©â€Ž, translit.\r\nal-mÅ«sÄ«qÄ\r\nal-ArabÄ«yah) is the\r\nmusic of the Arab\r\npeople with all its\r\ndifferent music\r\nstyles and genres.\r\nArabic countries\r\nhave many styles of\r\nmusic and also many\r\ndialects; each\r\ncountry has its own\r\ntraditional music.\r\nArabic music has a\r\nlong history of\r\ninteraction with\r\nmany other regional\r\nmusical styles and\r\ngenres. It\r\nrepresents the music\r\nof all the peoples\r\nthat make up the\r\nArab world today,\r\nall the 22 states. ', '1970', 'assets/img/genres/arab.jpeg');
INSERT INTO `genres` VALUES ('26', 'K-Pop', 'K-pop (abbreviation\r\nof Korean pop;\r\nHangul: ì¼€ì´íŒ) is a\r\nmusical genre\r\ncharacterized by a\r\nwide variety of\r\naudiovisual\r\nelements. While the\r\nmodern form of K-pop\r\ncan be traced back\r\nto the early 90s,\r\nthe term itself has\r\nbeen popularized\r\nsince the 2000s,\r\nreplacing the term\r\nGayo (ê°€ìš”), which\r\nalso refers to\r\ndomestic pop music\r\nin South Korea.\r\nAlthough it\r\ngenerally indicates\r\n\"popular music\"\r\nwithin South Korea,\r\nthe term is often\r\nused in a narrower\r\nsense to describe a\r\nmodern form of South\r\nKorean pop that is\r\ninfluenced by styles\r\nand genres from\r\naround the world,\r\nsuch as\r\nexperimental, jazz,\r\ngospel, hip', '1940', 'assets/img/genres/kpop.jpeg');

-- ----------------------------
-- Table structure for info_pages
-- ----------------------------
DROP TABLE IF EXISTS `info_pages`;
CREATE TABLE `info_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `public` tinyint(4) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of info_pages
-- ----------------------------
INSERT INTO `info_pages` VALUES ('1', '{$lng->developers}', 'developers', '0', 'Our API allows you to retrieve informations from our website via <strong>GET</strong> request and supports the following query parameters:\r\n						<br><br>\r\n						<table border=\"1\" width=\"100%\">\r\n							<tr>\r\n								<td width=\"20%\" valign=\"top\">Name</td>\r\n								<td width=\"20%\" valign=\"top\">Meaning</td>\r\n								<td width=\"60%\" valign=\"top\">Description</td>\r\n							</tr>\r\n							<tr>\r\n								<td width=\"20%\" valign=\"top\"><strong>t (required)</strong></td>\r\n								<td width=\"20%\" valign=\"top\">Query type.</td>\r\n								<td width=\"60%\" valign=\"top\">This parameter specify the type of the query, <strong><code>u</code></strong> is for profile informations, <strong><code>t</code></strong> is for tracks informations.</td>\r\n							</tr>\r\n							<tr>\r\n								<td width=\"20%\" valign=\"top\"><strong>q (required)</strong></td>\r\n								<td width=\"20%\" valign=\"top\">Requested <strong>username</strong>.</td>\r\n								<td width=\"60%\" valign=\"top\">The <code>t</code> parameter supports two values: \r\n								<ul>\r\n									<li>u = <strong>username</strong> [returns basic profile informations containing the following]\r\n										<ul>\r\n											<li><code>id</code> = returns the unique user id</li>\r\n											<li><code>username</code> = returns the username</li>\r\n											<li><code>first_name</code> = returns the first name</li>\r\n											<li><code>last_name</code> = returns the last bame</li></li>\r\n											<li><code>website</code> = returns the website</li></li>\r\n											<li><code>country</code> = returns the country</li></li>\r\n											<li><code>city</code> = returns the city</li></li>\r\n											<li><code>image</code> = returns the profile avatar image</li></li>\r\n											<li><code>cover</code> = returns the profile cover image</li></li>\r\n										</ul>\r\n									</li>\r\n										\r\n									<li>t = <strong>username</strong> [returns a list of latest 20 tracks uploaded by a user containing the following]\r\n										<ul>\r\n											<li><code>id</code> = returns the unique track id</li>\r\n											<li><code>by</code> = returns the unique user id</li>\r\n											<li><code>title</code> = returns the track title</li>\r\n											<li><code>description</code> = returns the description of the track</li>\r\n											<li><code>art</code> = returns the track artwork image</li>\r\n											<li><code>tag</code> = returns the tag list</li>\r\n											<li><code>buy</code> = returns the purchase url</li>\r\n											<li><code>record</code> = returns the record label</li></li>\r\n											<li><code>release</code> = returns the release date</li></li>\r\n											<li><code>license</code> = returns the license type</li></li>\r\n											<li><code>time</code> = returns the date time when was published</li>\r\n											<li><code>likes</code> = returns the number of likes</li>\r\n											<li><code>views</code> = returns the number of views (times played)</li>\r\n										</ul>\r\n									</li>\r\n								</ul></td>\r\n							</tr>\r\n						</table>\r\n						<br>\r\n						<div class=\"divider\"></div>\r\n						<br>\r\n						<div id=\"jump-url\"><strong>Examples of requests:</strong></div><br>\r\n						For profile information of a user:\r\n						<br>\r\n						<code class=\"api-request\">{$site_url}/api.php?t=u&q=USERNAME</code>\r\n						<br><br>\r\n						For a list of latest 20 tracks uploaded by a user:\r\n						<br>\r\n						<code class=\"api-request\">{$site_url}/api.php?t=t&q=USERNAME</code>\r\n						<br><br>\r\n						<div class=\"divider\"></div>\r\n						<br>\r\n						An example of <strong>json</strong> decoding would be the following PHP code:\r\n						<br><br>\r\n						<code>\r\n						<?php<br>\r\n							header(\'Content-Type: text/plain; charset=utf-8;\');\r\n							<br>\r\n							$file = file_get_contents(\"{$site_url}/api.php?t=t&q=USERNAME\");<br>\r\n							print_r(json_decode($file));<br>\r\n						?>\r\n						</code>');

-- ----------------------------
-- Table structure for likes
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` int(11) NOT NULL,
  `by` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `time` (`time`),
  KEY `by` (`by`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of likes
-- ----------------------------

-- ----------------------------
-- Table structure for newsletters
-- ----------------------------
DROP TABLE IF EXISTS `newsletters`;
CREATE TABLE `newsletters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of newsletters
-- ----------------------------
INSERT INTO `newsletters` VALUES ('3', 'SptoDM - Stream', 'test', '2019-05-19 11:08:43');

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '0',
  `child` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL,
  `read` int(11) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `to` (`to`,`type`,`read`),
  KEY `from` (`from`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of notifications
-- ----------------------------
INSERT INTO `notifications` VALUES ('10', '9', '2', '0', '0', '4', '1', '2019-05-25 23:04:32');
INSERT INTO `notifications` VALUES ('11', '10', '2', '0', '0', '4', '1', '2019-05-26 00:34:12');
INSERT INTO `notifications` VALUES ('12', '10', '9', '0', '0', '4', '1', '2019-05-26 00:38:52');
INSERT INTO `notifications` VALUES ('13', '9', '10', '0', '0', '4', '1', '2019-05-26 00:42:37');
INSERT INTO `notifications` VALUES ('14', '2', '10', '0', '0', '4', '1', '2019-05-26 00:43:10');
INSERT INTO `notifications` VALUES ('15', '2', '9', '0', '0', '4', '1', '2019-05-26 00:43:15');

-- ----------------------------
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `by` int(11) NOT NULL,
  `payer_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `payer_first_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `payer_last_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `payer_email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `payer_country` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `txn_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `valid` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `by` (`by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of payments
-- ----------------------------

-- ----------------------------
-- Table structure for playlistentries
-- ----------------------------
DROP TABLE IF EXISTS `playlistentries`;
CREATE TABLE `playlistentries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playlist` int(11) NOT NULL,
  `track` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `playlist` (`playlist`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of playlistentries
-- ----------------------------
INSERT INTO `playlistentries` VALUES ('42', '4', '31');
INSERT INTO `playlistentries` VALUES ('43', '4', '32');
INSERT INTO `playlistentries` VALUES ('44', '4', '33');
INSERT INTO `playlistentries` VALUES ('55', '5', '45');
INSERT INTO `playlistentries` VALUES ('56', '5', '46');

-- ----------------------------
-- Table structure for playlists
-- ----------------------------
DROP TABLE IF EXISTS `playlists`;
CREATE TABLE `playlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `by` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `public` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `by` (`by`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of playlists
-- ----------------------------
INSERT INTO `playlists` VALUES ('4', '9', 'HELIX - CD/LP 2018', '', '1', '2019-05-25 23:32:25');
INSERT INTO `playlists` VALUES ('5', '10', 'IMAGINAERUM - CD/2011', '', '1', '2019-05-26 00:18:58');

-- ----------------------------
-- Table structure for relations
-- ----------------------------
DROP TABLE IF EXISTS `relations`;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leader` int(11) NOT NULL,
  `subscriber` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `subscriber` (`subscriber`),
  KEY `leader` (`leader`),
  KEY `leader_2` (`leader`,`subscriber`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of relations
-- ----------------------------
INSERT INTO `relations` VALUES ('8', '2', '9', '2019-05-25 23:04:32');
INSERT INTO `relations` VALUES ('9', '2', '10', '2019-05-26 00:34:12');
INSERT INTO `relations` VALUES ('10', '9', '10', '2019-05-26 00:38:52');
INSERT INTO `relations` VALUES ('11', '10', '9', '2019-05-26 00:42:37');
INSERT INTO `relations` VALUES ('12', '10', '2', '2019-05-26 00:43:10');
INSERT INTO `relations` VALUES ('13', '9', '2', '2019-05-26 00:43:15');

-- ----------------------------
-- Table structure for reports
-- ----------------------------
DROP TABLE IF EXISTS `reports`;
CREATE TABLE `reports` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `track` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `reason` tinyint(4) NOT NULL,
  `by` int(11) NOT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `state` (`state`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of reports
-- ----------------------------

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `theme` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `perpage` int(11) NOT NULL,
  `volume` varchar(4) NOT NULL,
  `captcha` int(11) NOT NULL,
  `intervaln` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `format` varchar(256) NOT NULL,
  `mail` int(11) NOT NULL,
  `artsize` int(11) NOT NULL,
  `artformat` varchar(256) NOT NULL,
  `tracksize` int(11) NOT NULL,
  `trackformat` varchar(128) NOT NULL,
  `tracksizetotal` bigint(12) NOT NULL,
  `cperpage` int(11) NOT NULL,
  `ilimit` int(11) NOT NULL,
  `mlimit` int(11) NOT NULL,
  `rperpage` int(11) NOT NULL,
  `sperpage` int(11) NOT NULL,
  `nperpage` tinyint(4) NOT NULL,
  `nperwidget` tinyint(4) NOT NULL,
  `lperpost` int(11) NOT NULL,
  `aperip` int(11) NOT NULL,
  `conline` int(4) NOT NULL,
  `ronline` tinyint(4) NOT NULL,
  `mperpage` tinyint(4) NOT NULL,
  `chatr` int(11) NOT NULL,
  `email_activation` tinyint(4) NOT NULL,
  `email_comment` tinyint(4) NOT NULL,
  `email_like` tinyint(4) NOT NULL,
  `email_new_friend` tinyint(4) NOT NULL,
  `smiles` tinyint(4) NOT NULL,
  `permalinks` tinyint(4) NOT NULL,
  `fbapp` int(11) NOT NULL,
  `fbappid` varchar(128) NOT NULL,
  `fbappsecret` varchar(128) NOT NULL,
  `smtp_email` int(11) NOT NULL,
  `smtp_host` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `smtp_port` int(11) NOT NULL,
  `smtp_secure` varchar(32) NOT NULL,
  `smtp_auth` int(11) NOT NULL,
  `smtp_username` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `smtp_password` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `as3` int(11) NOT NULL,
  `as3_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `as3_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `as3_region` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `as3_bucket` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paypalapp` int(11) NOT NULL,
  `paypalclientid` varchar(128) NOT NULL,
  `paypalsecret` varchar(128) NOT NULL,
  `paypalsand` int(11) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `promonth` decimal(6,2) NOT NULL,
  `proyear` decimal(6,2) NOT NULL,
  `protracksize` int(11) NOT NULL,
  `protracktotal` bigint(12) NOT NULL,
  `ad1` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad2` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad3` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad4` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad5` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad6` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ad7` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tracking_code` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('WebPlayer - SpotMusic', 'materio', '10', '0.60', '0', '60000', '0', '2097152', 'png,jpg,gif,jpeg', '1', '2097152', 'png,jpg,gif,jpeg', '5242880', 'mp3,m4a,mp4', '104857600', '10', '9', '1000', '20', '10', '100', '30', '5', '0', '600', '7', '10', '30', '0', '1', '1', '1', '1', '0', '0', '', '', '0', '', '0', '0', '0', '', '', 'english', 'Europe/Athens', '0', '', '', 'us-east-2', '', '0', '', '', '0', 'USD', '3.00', '29.00', '52428800', '1073741824', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for songs
-- ----------------------------
DROP TABLE IF EXISTS `songs`;
CREATE TABLE `songs` (
  `id_song` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `track` int(2) NOT NULL,
  `id_album` int(7) NOT NULL,
  `runtime` smallint(6) NOT NULL,
  `release_year` year(4) NOT NULL,
  PRIMARY KEY (`id_song`) USING BTREE,
  KEY `id_album` (`id_album`) USING BTREE,
  CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`id_album`) REFERENCES `albums` (`id_album`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of songs
-- ----------------------------
INSERT INTO `songs` VALUES ('1', 'Taikatalvi', '1', '1', '155', '2011');
INSERT INTO `songs` VALUES ('2', 'Storytime', '2', '1', '322', '2011');
INSERT INTO `songs` VALUES ('3', 'Ghost River', '3', '1', '328', '2011');
INSERT INTO `songs` VALUES ('4', 'Slow, Love, Slow', '4', '1', '350', '2011');
INSERT INTO `songs` VALUES ('5', 'I Want My Tears Back', '5', '1', '307', '2011');
INSERT INTO `songs` VALUES ('6', 'Scaretale', '6', '1', '452', '2011');
INSERT INTO `songs` VALUES ('7', 'Arabesque', '7', '1', '177', '2011');
INSERT INTO `songs` VALUES ('8', 'Turn Loose the Mermaids', '8', '1', '260', '2011');
INSERT INTO `songs` VALUES ('9', 'Rest Calm', '9', '1', '422', '2011');
INSERT INTO `songs` VALUES ('10', 'The Crow, the Owl and the Dove', '10', '1', '250', '2011');
INSERT INTO `songs` VALUES ('11', 'Last Ride of the Day', '11', '1', '262', '2011');
INSERT INTO `songs` VALUES ('12', 'Song of Myself', '12', '1', '273', '2011');
INSERT INTO `songs` VALUES ('13', 'Imaginaerum', '13', '1', '378', '2011');
INSERT INTO `songs` VALUES ('14', 'The Score', '1', '2', '220', '2018');
INSERT INTO `songs` VALUES ('15', '365', '2', '2', '208', '2018');
INSERT INTO `songs` VALUES ('16', 'Inferno', '3', '2', '192', '2018');
INSERT INTO `songs` VALUES ('17', 'Countdown', '4', '2', '180', '2018');
INSERT INTO `songs` VALUES ('18', 'Helix', '5', '2', '215', '2018');
INSERT INTO `songs` VALUES ('19', 'Dream', '6', '2', '219', '2018');
INSERT INTO `songs` VALUES ('20', 'GG6', '7', '2', '189', '2018');
INSERT INTO `songs` VALUES ('21', 'Breakthrough Starshot', '8', '2', '191', '2018');
INSERT INTO `songs` VALUES ('22', 'My Haven', '9', '2', '223', '2018');
INSERT INTO `songs` VALUES ('23', 'Iconic', '10', '2', '191', '2018');
INSERT INTO `songs` VALUES ('24', 'Unified', '11', '2', '238', '2018');
INSERT INTO `songs` VALUES ('25', 'Momentum', '12', '2', '201', '2018');

-- ----------------------------
-- Table structure for songs_genres
-- ----------------------------
DROP TABLE IF EXISTS `songs_genres`;
CREATE TABLE `songs_genres` (
  `id_song` int(11) NOT NULL,
  `id_genre` int(11) NOT NULL,
  PRIMARY KEY (`id_song`,`id_genre`) USING BTREE,
  KEY `id_genre` (`id_genre`) USING BTREE,
  CONSTRAINT `songs_genres_ibfk_1` FOREIGN KEY (`id_song`) REFERENCES `songs` (`id_song`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `songs_genres_ibfk_2` FOREIGN KEY (`id_genre`) REFERENCES `genres` (`id_genre`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of songs_genres
-- ----------------------------

-- ----------------------------
-- Table structure for tracks
-- ----------------------------
DROP TABLE IF EXISTS `tracks`;
CREATE TABLE `tracks` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `art` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `buy` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `record` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `release` date DEFAULT NULL,
  `license` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `as3_track` int(11) NOT NULL,
  `download` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `public` int(11) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT '0',
  `downloads` int(11) NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `title` (`title`),
  KEY `tag` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tracks
-- ----------------------------
INSERT INTO `tracks` VALUES ('1', '2', '2Scratch - LOCO (feat. TAOG)', '', '1264660386_2112078519_1678600370.mp3', 'hip-hop,electronic,', '116370396_75226223_2139999448.jpg', '', '', null, '0', '7454324', '0', '1', '2019-05-19 09:21:58', '1', '0', '1', '8');
INSERT INTO `tracks` VALUES ('2', '2', '2Scratch - Ballin (ft. TAOG)', '', '2007901984_1966583923_442171286.mp3', 'hip-hop,electronic,', '2004958147_2052017875_1831099688.jpg', '', '', null, '0', '9393427', '0', '1', '2019-05-19 09:33:48', '1', '0', '0', '5');
INSERT INTO `tracks` VALUES ('3', '2', '2Scratch - Superlife (ft. Lox Chatterbox)', '', '2021721972_2096650412_1200748111.mp3', 'hip-hop,electronic,', '1400105631_1236517622_1584503914.jpg', '', '', null, '0', '12716229', '0', '1', '2019-05-19 09:46:36', '1', '0', '0', '5');
INSERT INTO `tracks` VALUES ('31', '9', 'HELIX: Inferno', 'HELIX - CD/LP 2018\r\nSpinefarm/Universal\r\nProduced by Jacob Hansen', '1924306704_1096738251_1123797730.mp3', 'metal,amaranthe,helix,', '619171631_1822585923_1379522416.jpg', '', '', null, '0', '7896960', '0', '0', '2019-05-25 23:35:44', '1', '0', '0', '0');
INSERT INTO `tracks` VALUES ('32', '9', 'HELIX: 365', 'HELIX - CD/LP 2018\r\nSpinefarm/Universal\r\nProduced by Jacob Hansen', '830819685_2089177770_788869498.mp3', 'metal,amaranthe,helix,', '2023745203_249033669_1439023520.jpg', '', '', null, '0', '8486784', '0', '0', '2019-05-25 23:37:52', '1', '0', '0', '1');
INSERT INTO `tracks` VALUES ('33', '9', 'HELIX: The Score', 'HELIX - CD/LP 2018\r\nSpinefarm/Universal\r\nProduced by Jacob Hansen', '1081222191_264024889_158549446.mp3', 'metal,amaranthe,helix,', '1001466214_1104553346_1289405645.jpg', '', '', null, '0', '8990592', '0', '0', '2019-05-25 23:39:59', '1', '0', '0', '1');
INSERT INTO `tracks` VALUES ('44', '10', 'Imaginaerum: Ghost River', 'Released November 30, 2011', '1816390977_1443754085_1596449003.mp3', 'metal,nightwish,imaginaerum,', '1622085510_426038863_2001129179.jpg', '', '', null, '0', '5923919', '0', '0', '2019-05-26 00:31:09', '1', '0', '0', '0');
INSERT INTO `tracks` VALUES ('45', '10', 'Imaginaerum: Storytime', 'Released November 30, 2011', '1547032613_402232080_133056127.mp3', 'metal,nightwish,imaginaerum,', '243895212_1826662237_2003261332.jpg', '', '', null, '0', '5829454', '0', '0', '2019-05-26 00:32:47', '1', '0', '0', '2');
INSERT INTO `tracks` VALUES ('46', '10', 'Imaginaerum: Taikatalvi', 'Released November 30, 2011', '1390200321_1740693664_1206998442.mp3', 'metal,nightwish,imaginaerum,', '783010355_1530814412_1389122933.jpg', '', '', null, '0', '3160788', '0', '0', '2019-05-26 00:33:51', '1', '0', '0', '6');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `idu` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(64) NOT NULL DEFAULT '',
  `city` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(160) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date` date DEFAULT NULL,
  `facebook` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `twitter` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gplus` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `youtube` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `vimeo` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tumblr` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `soundcloud` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `myspace` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastfm` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `private` int(11) NOT NULL DEFAULT '0',
  `suspended` int(11) NOT NULL DEFAULT '0',
  `salted` varchar(256) NOT NULL DEFAULT '',
  `login_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover` varchar(128) NOT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT '0',
  `online` int(11) NOT NULL DEFAULT '0',
  `offline` tinyint(4) NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL,
  `notificationl` tinyint(4) NOT NULL,
  `notificationc` tinyint(4) NOT NULL,
  `notificationd` tinyint(4) NOT NULL,
  `notificationf` tinyint(4) NOT NULL,
  `email_comment` tinyint(4) NOT NULL,
  `email_like` tinyint(4) NOT NULL,
  `email_new_friend` tinyint(4) NOT NULL,
  `email_newsletter` tinyint(4) NOT NULL DEFAULT '1',
  UNIQUE KEY `id` (`idu`),
  KEY `username` (`username`),
  KEY `first_name` (`first_name`),
  KEY `last_name` (`last_name`),
  KEY `suspended` (`suspended`),
  KEY `email_newsletter` (`email_newsletter`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('2', 'mystikos2006', '$2y$10$J8zpz8HarAdB9g28A7WQg.jsF8tFi4vdveCWbIoULUN6aoOLx.10G', 'Mystikos2006@hotmail.com', 'Αγγελος', 'Π.', '', '', '', '', '2019-05-19', 'DkAnGeLTM', '', 'dkang3l', 'channel/UCalUj0WWabqsGzHGskYMwmA', '', '', '', '', '', '883124868_241071820_1113829103.jpg', '0', '0', '$2y$10$WnMuYlRuUTwiNcaw.9I91OwD3OwGX3w5GzYYI6c104h97i2eoinyq', '$2y$10$ACXZ7b9uLBnIJw7E60TQSu9cL6C61mx0OxqXDedcVm24.jWpUIEw.', '1848596941_1570246877_1008573348.png', '0', '1611649002', '0', '', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `users` VALUES ('9', 'Amaranthe', '$2y$10$3SsWhzHiRd4g5vQaFj1kHuk0vXwj/WeK.3ZOJFqD2M6XFb285PoMq', 'amaranthe@spotmusic.gr', '', '', '', '', 'http://www.amaranthe.se', '', '2019-05-25', 'AmarantheBand', 'Amaranthemetal', 'amarantheofficial', 'AmarantheTV', '', '', '', '', '', '753218306_756336975_796702347.jpg', '0', '0', '', '$2y$10$4qLmAJU4oxkP6HMuaTbEhOVrNYx7u3z1UyhuURjqcuCdLigO3/KY.', '145115861_1101930524_336425266.jpg', '0', '1611649083', '0', '188.4.219.46', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `users` VALUES ('10', 'Nightwish', '$2y$10$9NDqPBUleZrfI6l6A5MATOKNzqphNLlfF10DZksU4Gf2tVNDK74D2', 'nightwish@spotmusic.gr', '', '', '', '', 'http://nightwish.com', '', '2019-05-25', 'nightwish', 'NightwishBand', 'floor_jansen_official', 'Nightwish', '', '', '', '', '', '33653342_1328579967_513988673.jpg', '0', '0', '', '$2y$10$ZYutFiconcwvTVtfEeVqmeBWDpQwS4m7iK5ajo3HQscTtoH1cVamm', '640415082_1002199416_484708716.jpg', '0', '1611649056', '0', '188.4.219.46', '1', '1', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for views
-- ----------------------------
DROP TABLE IF EXISTS `views`;
CREATE TABLE `views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `by` int(11) NOT NULL,
  `track` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `by` (`by`),
  KEY `time` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of views
-- ----------------------------
INSERT INTO `views` VALUES ('1', '2', '1', '2019-05-19 09:25:22');
INSERT INTO `views` VALUES ('5', '2', '4', '2019-05-25 21:17:19');
INSERT INTO `views` VALUES ('6', '2', '4', '2019-05-25 21:20:35');
INSERT INTO `views` VALUES ('7', '2', '5', '2019-05-25 21:27:21');
INSERT INTO `views` VALUES ('8', '2', '4', '2019-05-25 21:30:50');
INSERT INTO `views` VALUES ('9', '2', '3', '2019-05-25 21:34:34');
INSERT INTO `views` VALUES ('10', '2', '6', '2019-05-25 21:34:58');
INSERT INTO `views` VALUES ('11', '2', '8', '2019-05-25 21:43:55');
INSERT INTO `views` VALUES ('12', '2', '7', '2019-05-25 21:47:45');
INSERT INTO `views` VALUES ('13', '2', '6', '2019-05-25 21:50:49');
INSERT INTO `views` VALUES ('14', '2', '14', '2019-05-25 22:04:49');
INSERT INTO `views` VALUES ('15', '2', '13', '2019-05-25 22:08:51');
INSERT INTO `views` VALUES ('16', '2', '12', '2019-05-25 22:12:03');
INSERT INTO `views` VALUES ('17', '2', '11', '2019-05-25 22:15:47');
INSERT INTO `views` VALUES ('18', '2', '17', '2019-05-25 22:19:19');
INSERT INTO `views` VALUES ('19', '2', '16', '2019-05-25 22:19:41');
INSERT INTO `views` VALUES ('20', '2', '17', '2019-05-25 22:20:16');
INSERT INTO `views` VALUES ('21', '2', '19', '2019-05-25 22:43:08');
INSERT INTO `views` VALUES ('22', '9', '33', '2019-05-25 23:40:13');
INSERT INTO `views` VALUES ('23', '9', '32', '2019-05-25 23:43:27');
INSERT INTO `views` VALUES ('24', '10', '42', '2019-05-26 00:28:52');
INSERT INTO `views` VALUES ('25', '10', '46', '2019-05-26 00:34:44');
INSERT INTO `views` VALUES ('26', '2', '46', '2019-05-26 04:24:28');
