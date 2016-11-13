-- phpMyAdmin SQL Dump
-- version 4.6.4deb1+deb.cihar.com~xenial.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 13, 2016 at 11:56 AM
-- Server version: 5.7.16-0ubuntu0.16.04.1
-- PHP Version: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(10) NOT NULL,
  `author` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `book_desc` text NOT NULL,
  `genre` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `author`, `name`, `book_desc`, `genre`) VALUES
(10, 'King, Stephen', 'Salem', 'Znany pisarz Ben Mears powraca do miejsca, gdzie spędził dzieciństwo – małego miasteczka Jerozolima zwanego też Salem. Główny bohater jest szczególnie zainteresowany starym domostwem rodziny Marstenów, w którym przed wielu laty doszło do tragicznych wydarzeń. Okazuje się, że dom został kupiony przez 2 tajemniczych mężczyzn. Wkrótce w Salem w dziwnych okolicznościach zaczynają umierać ludzie.', 'horror'),
(12, 'Lem, Stanisław', 'Fiasko', 'Początkowo akcja toczy się na Tytanie, księżycu Saturna, gdzie bohater Angus Parvis poszukując zaginionych budowniczych kopalni oraz komandora Pirxa, który ruszył im na ratunek, sam popełnia błąd w obcym człowiekowi, mieszkańcowi Ziemi, terenie i staje w obliczu nieuchronnej śmierci. W nadziei wskrzeszenia przy pomocy przyszłych zdobyczy nauki, dokonuje aktu szczególnego samobójstwa przez poddanie się hibernacji.\r\n\r\nPo około stuleciu, na pokładzie statku kosmicznego zmierzającego w kierunku nieznanej cywilizacji pozaziemskiej z planety Kwinta, zostaje ożywiona jedna z osób, których ciała odnaleziono na Tytanie. Naukowcy przypuszczają, że uratowanym może być Parvis lub Pirx, lecz również po wskrzeszeniu członkom załogi nie udaje się ustalić jego danych personalnych, w związku z czym występuje dalej pod przybranym imieniem i nazwiskiem jako Marek Tempe. Konstrukcja powieści, wykluczająca tzw. narratora wszechwiedzącego, pozostawia czytelnika w niepewności co do możliwego rozwiązania zagadki tożsamości[3] bohatera.\r\n\r\nKiedy statek dolatuje do celu, jedno z najistotniejszych zadań w zakresie kontaktu bezpośredniego z obcą cywilizacją zostaje powierzone wskrzeszonemu. Porozumienie między „braćmi w rozumie” okazuje się jednak ostatecznie niemożliwe na skutek zbyt głębokich różnic biologicznych oraz kulturowych i kończy się tytułowym fiaskiem.', 'science-fiction'),
(13, 'Zajdel, Janusz A.', 'Paradyzja', 'Paradyzja to kolonia orbitalna, która od stu lat nie utrzymuje kontaktów z Ziemią. Jej mieszkańcy stworzyli własny, idealny ustrój społeczny. Ziemianie podejrzewają jednak, że władze kolonii naruszają fundamentalne prawa człowieka. Ziemski inspektor wysłany, żeby zbadać na miejscu sytuację, zastaje świat skrajnie różniący się od tego, co głosi oficjalna propaganda. Wszechobecna cenzura i bezlitosny system wymuszania lojalności zmusza obywateli do stosowania wręcz kabaretowych sposobów komunikacji. Ogarnięty paranoją rząd nie chce nawet ujawnić położenia sztucznej planety.', 'science-fiction'),
(15, 'Orbitowski, Łukasz', 'Inna dusza', 'Ale chyba są inne duchy, wiesz, takie, co żyją w człowieku obok tych naszych dusz, zwyczajnych. I czegoś tam sobie chcą. Niektóre są ciche, inne głośne. Wrzeszczą, hałasują. To jest nie do wytrzymania. Znaczy, tak mi się wydaje, że z takim duchem w środku strasznie ciężko żyć, zwłaszcza jak on chce czegoś, na co ty nie masz ochoty.\r\n\r\nMiasto. Zniszczone, obdrapane i brudne kamienice. Zmęczeni ludzie w ubłoconych, wiecznie spóźnionych i zatłoczonych autobusach. Przygnębienie i pustka. I nagle w jednej głowie kiełkuje ta dziwna myśl, nieodparte pragnienie. Bez motywu, bez powodu, jak głód. Tak jakby ciało przejmowała inna dusza, która nakazuje to zrobić, i nie można od niej uciec.\r\n\r\nPewnego dnia miasto zatrzyma się przerażone zbrodnią.', 'kryminał/sensacja'),
(16, 'Banks, Iain M.', 'Wspomnij Phlebasa', 'W galaktyce szaleje okrutna wojna. Zagłada dosięga księżyców, planet, orbitali, a nawet gwiazd, giną miliardy rozumnych istot. Idirianie walczą za wiarę, Kultura - o moralne prawo do istnienia. Tam, gdzie stawką są zasady, nie ma miejsca na litość. Losy konfliktu spoczywają w rękach jednego z ostatnich Metamorfów; od wyniku jego straceńczej misji zależy przyszłość wszechświata. \r\n\r\n"Wspomnij Phlebasa" otwiera zakrojony z rozmachem cykl powieści, w których Banks w mistrzowski sposób połączył najlepsze elementy klasycznej hard SF i space opery, okraszając je mnóstwem oryginalnych pomysłów oraz przewrotnym poczuciem humoru. \r\n', 'science-fiction'),
(77, 'Adams, Richard', 'Wodnikowe Wzgórze', 'Opowiada historię grupy królików, które zmuszone są opuścić swoją królikarnię i wyruszyć w poszukiwaniu nowego miejsca zamieszkania, przeżywając przy tym rozmaite przygody i trudności. Tytułowe "Wodnikowe Wzgórze" to miejsce, w którym ostatecznie osiedlają się króliki, usytuowane na północy hrabstwa Hampshire w Anglii. Króliki, bohaterowie historii, mają swe imiona, strukturę społeczną, język, mitologię, przysłowia, tworzą także poezję. W dążeniu do celu współpracują z innymi zwierzętami, wykorzystują także ludzi i wytwory techniki.', 'fantastyka'),
(78, 'Irving, John', 'Jednoroczna wdowa', 'Książka podzielona jest na trzy części i opowiada historię Ruth Cole. W pierwszej części ma 4 lata; akcja dzieje się w 1958 roku. Ruth jest świadkiem rozpadu małżeństwa jej rodziców, Marion i Teda, którzy nie są w stanie poradzić sobie z traumą po wypadku samochodowym w którym zginęła dwójka ich synów. W drugiej części (rok 1990), Ruth ma 36 lat; mieszka w Europie i przygotowuje książkę na temat prostytucji. Trzecia część zaś opowiada o 41-letniej Ruth. Ma syna i po raz pierwszy się zakochuje.', 'obyczajowa'),
(79, 'Marquez, Gabriel Garcia', 'Sto lat samotności', 'Sto lat samotności opowiada historię rodziny Buendiów na przestrzeni sześciu pokoleń w fikcyjnej miejscowości Macondo. Osadę zakłada kilka rodzin, na których czele stoją José Arcadio Buendía i Urszula Iguarán, małżeństwo kuzynów, którzy pobrali się pełni złych przeczuć i obaw z powodu swego pokrewieństwa i przekazywanej w rodzinie opowieści, zgodnie z którą ich dzieci mogą mieć świńskie ogony. Pomimo tego, mają trójkę dzieci: Josego Arcadia, Aureliana i Amarantę (imiona te powtarzają się w następnych pokoleniach). José Arcadio, założyciel osady, zawsze jako pierwszy eksperymentuje z wynalazkami przywożonymi do wioski przez Cyganów. Kończy swoje życie przywiązany do drzewa, do którego przybywa duch jego wroga, Prudencia Aguilara, z którym prowadzi dysputę. Urszula, głowa całej rodziny, przez ponad sto lat troszczy się o rodzinę i dom.', 'literatura piękna'),
(80, 'Murakami, Haruki', 'Koniec świata i Hard-Boiled Wonderland', 'Haruki Murakami postanowił zmierzyć się z gatunkiem science-fiction. Narrator i zarazem główny bohater książki jest ostatnią żyjącą ofiarą eksperymentu, który polegał na wszczepieniu do ludzkiego mózgu elektrody rozszyfrowującej zakodowane tajne informacje. Eksperyment spowodował, że bohater posiada jak gdyby dwie świadomości. Powieść została skonstruowana tak, by pokazać dwa równoległe światy, w których żyje narrator: rozdziały, których akcja rozgrywa się w różnych miejscach, napisane różnymi stylami, przedstawiają na zmianę przeżycia obydwu „ja” postaci. Na początku, kiedy nie jeszcze nie wiemy dokładnie, o co chodzi, wydaje się, że historia ma po prostu dwóch bohaterów, z jakichś powodów opisanych w jednej książce. Dopiero później pojawiają się elementy, wspólne obu opowieściom, dowodzące związku między nimi. Takim elementem są na przykład nieziemskie wizje płaczących, jarzących się czaszek jednorożców – magiczne motywy są dla twórczości Murakami bardzo charakterystyczne.', 'science-fiction'),
(81, 'Eco, Umberto', 'Baudolino', 'Akcja zaczyna się w 1204 r., w trakcie IV wyprawy krzyżowej. W czasie gdy krzyżowcy plądrują Konstantynopol, Baudolino ratuje życie Niketasowi Choniatesowi, bizantyjskiemu historykowi, a następnie opowiada mu o swym dzieciństwie, o tym, jak dostał się na dwór cesarza, i tym, jak umierający biskup Otton powierzył mu misję, aby wysłać Fryderyka Barbarossę na wschód do legendarnego królestwa Księdza Jana. Opowiada także o wielu przygodach (mniej lub bardziej związanych z Księdzem Janem i jego królestwem). Jego opowieść kończy się w momencie powrotu do Konstantynopola z wyprawy, której celem było legendarne królestwo. Dopiero wtedy pojął rzeczy, których wcześniej nie rozumiał.', 'powieść historyczna');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
