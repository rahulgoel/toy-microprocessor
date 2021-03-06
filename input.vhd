
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


--library UNISIM;
--use UNISIM.VComponents.all;

entity input is
    Port ( 
				--I1: in std_logic_vector(15 downto 0);
				bitintout8: out STD_LOGIC_VECTOR (7 downto 0);
				bitreg1out2: out STD_LOGIC_VECTOR (1 downto 0);
				bitreg2out2: out STD_LOGIC_VECTOR (1 downto 0);
				bitmodeout4: out STD_LOGIC_VECTOR (3 downto 0);
				clk: in std_logic;
				jump1: in STD_LOGIC_VECTOR (7 downto 0)
				);
end input;

architecture Behavioral of input is
function memory(add : integer) return std_logic_vector is
variable ret :std_logic_vector(15 downto 0);
variable index :integer;
type dataout is array (0 to 255) of STD_LOGIC_VECTOR (15 downto 0);
variable arr: dataout;

begin

arr(0):=('0','0','1','0','0','1','0','0','0','0','0','1','1','0','0','0');
arr(1):=('0','1','0','1','0','0','0','0','0','0','0','0','0','0','0','1');
arr(2):=('0','1','1','0','0','1','0','1','0','0','0','0','1','0','0','0');
arr(3):=('0','1','0','0','0','1','0','1','0','0','0','0','0','0','0','0');
arr(4):=('0','1','0','1','1','0','0','1','0','0','0','0','0','0','0','0');
arr(5):=('0','0','1','0','0','1','0','1','0','0','0','0','0','0','0','0');
arr(6):=('0','1','0','0','1','1','0','1','0','0','0','0','0','0','0','0');
arr(7):=('0','0','1','1','1','1','0','1','0','0','0','0','0','0','0','0');
arr(8):=('1','0','0','0','0','1','0','1','0','0','0','0','0','1','0','0');
arr(9):=('0','0','1','0','0','0','1','1','0','0','0','0','0','0','0','0');
arr(10):=('0','0','1','0','0','1','1','1','0','0','0','0','0','0','0','0');
arr(11):=('0','0','1','1','0','0','0','1','0','0','0','0','0','0','0','0');
arr(12):=('0','0','1','1','1','0','1','1','0','0','0','0','0','0','0','0');
arr(13):=('0','0','1','0','0','0','1','1','0','0','0','0','0','0','0','0');
arr(14):=('0','0','1','0','1','0','1','1','0','0','0','0','0','0','0','0');
arr(15):=('0','1','1','0','1','0','1','1','0','0','0','0','0','0','0','0');
arr(16):=('0','1','1','0','0','0','0','1','0','0','0','0','0','0','0','0');
--arr(17):=('0','1','1','0','1','1','0','1');
--arr(18):=('1','0','1','1','0','1','0','1');
--arr(19):=('0','0','1','1','0','1','0','1');
--arr(20):=('0','1','1','0','0','1','0','0');
--arr(21):=('1','1','1','1','1','0','0','0');
--arr(22):=('1','1','1','0','0','0','0','0');
--arr(23):=('0','1','1','1','0','0','1','1');
--arr(24):=('0','0','1','0','0','0','1','1');
--arr(25):=('0','0','1','1','0','0','1','1');
--arr(26):=('0','0','1','1','0','1','0','1');
--arr(27):=('1','0','1','0','0','1','0','1');
--arr(28):=('1','0','1','0','0','0','1','1');
--arr(29):=('0','0','1','1','0','0','1','1');
--arr(30):=('0','0','1','1','1','0','0','1');
--arr(31):=('0','1','1','0','1','0','0','1');
--arr(32):=('0','1','1','0','1','0','0','0');
--arr(33):=('0','0','1','0','0','1','0','0');
--arr(34):=('0','1','0','0','0','1','0','1');
--arr(35):=('0','0','0','0','1','0','0','1');
--arr(36):=('0','0','1','0','1','1','1','1');
--arr(37):=('1','0','1','0','1','0','1','1');
--arr(38):=('1','1','1','0','0','0','0','1');
--arr(39):=('0','1','1','0','1','0','0','1');
--arr(40):=('0','0','1','0','1','1','0','1');
--arr(41):=('0','0','1','0','0','1','1','1');
--arr(42):=('0','0','1','0','1','0','1','1');
--arr(43):=('0','0','1','0','1','0','0','1');
--arr(44):=('1','0','1','0','1','0','0','1');
--arr(45):=('1','1','1','0','0','0','0','1');
--arr(46):=('0','1','1','0','1','0','0','1');
--arr(47):=('0','0','1','0','1','0','1','1');
--arr(48):=('0','0','1','0','0','0','1','1');
--arr(49):=('0','1','1','0','0','0','1','0');
--arr(50):=('0','1','1','1','0','0','0','1');
--arr(51):=('0','0','1','1','1','0','0','1');
--arr(52):=('0','1','1','0','1','0','0','1');
--arr(53):=('0','0','0','1','0','0','1','1');
--arr(54):=('1','0','1','0','0','1','1','1');
--arr(55):=('1','1','1','0','1','0','0','1');
--arr(56):=('0','0','1','0','1','0','0','1');
--arr(57):=('0','1','0','0','0','0','0','1');
--arr(58):=('0','1','1','1','1','0','0','0');
--arr(59):=('0','0','1','1','0','0','1','0');
--arr(60):=('0','0','0','1','1','0','0','1');
--arr(61):=('1','0','0','0','0','0','0','1');
--arr(62):=('1','0','1','0','0','1','0','1');
--arr(63):=('0','0','1','0','0','1','1','1');
--arr(64):=('1','0','1','0','0','0','0','0');
--arr(65):=('1','0','1','0','0','0','0','1');
--arr(66):=('0','1','1','0','0','0','0','1');
--arr(67):=('0','0','1','1','0','1','0','1');
--arr(68):=('0','0','1','1','0','1','0','1');
--arr(69):=('0','0','1','0','0','0','1','1');
--arr(70):=('1','0','1','0','0','1','1','1');
--arr(71):=('0','1','0','0','0','1','0','1');
--arr(72):=('0','1','1','0','0','1','0','1');
--arr(73):=('0','0','0','0','1','0','0','1');
--arr(74):=('1','0','1','0','0','0','1','0');
--arr(75):=('1','0','1','1','0','1','0','1');
--arr(76):=('0','0','1','1','0','1','0','1');
--arr(77):=('1','1','1','0','0','0','0','1');
--arr(78):=('0','0','1','0','0','1','1','0');
--arr(79):=('1','1','1','0','1','1','0','1');
--arr(80):=('0','1','1','0','0','1','0','1');
--arr(81):=('0','0','1','0','0','1','1','1');
--arr(82):=('1','0','1','0','0','0','1','0');
--arr(83):=('0','1','1','0','0','0','0','1');
--arr(84):=('0','0','1','1','1','0','1','1');
--arr(85):=('0','0','1','0','0','0','0','1');
--arr(86):=('0','0','1','0','1','0','1','1');
--arr(87):=('0','0','1','0','1','0','0','1');
--arr(88):=('1','1','1','0','1','0','0','1');
--arr(89):=('0','1','1','0','1','0','0','1');
--arr(90):=('0','0','1','0','1','0','0','1');
--arr(91):=('0','0','1','1','0','0','0','1');
--arr(92):=('1','0','0','1','0','0','0','1');
--arr(93):=('1','0','0','0','0','1','0','1');
--arr(94):=('0','0','0','0','0','0','0','1');
--arr(95):=('1','1','1','0','0','0','0','1');
--arr(96):=('0','1','1','1','0','1','0','1');
--arr(97):=('1','0','1','0','1','1','0','1');
--arr(98):=('1','0','1','0','0','1','0','1');
--arr(99):=('0','0','1','0','1','1','0','0');
--arr(100):=('1','0','1','0','0','1','0','1');
--arr(101):=('1','1','1','0','1','0','0','1');
--arr(102):=('0','0','1','0','1','0','1','1');
--arr(103):=('0','1','1','0','0','1','0','1');
--arr(104):=('0','1','1','0','0','1','0','1');
--arr(105):=('1','1','1','0','0','0','0','0');
--arr(106):=('0','1','1','1','0','0','1','1');
--arr(107):=('1','1','1','0','0','0','1','1');
--arr(108):=('0','1','0','0','0','0','0','1');
--arr(109):=('1','0','0','0','0','1','1','1');
--arr(110):=('0','0','1','1','0','1','0','1');
--arr(111):=('0','1','1','0','0','0','1','0');
--arr(112):=('0','1','0','0','0','0','1','1');
--arr(113):=('1','0','0','0','0','1','1','1');
--arr(114):=('1','0','1','1','0','0','1','0');
--arr(115):=('1','0','1','0','1','0','0','1');
--arr(116):=('1','0','0','0','1','0','0','1');
--arr(117):=('0','1','1','0','1','1','1','1');
--arr(118):=('0','1','1','0','1','0','0','1');
--arr(119):=('1','0','0','0','1','0','0','1');
--arr(120):=('1','1','0','0','0','0','1','1');
--arr(121):=('0','0','1','0','1','0','1','1');
--arr(122):=('1','0','0','1','0','0','0','1');
--arr(123):=('0','1','1','0','1','1','0','1');
--arr(124):=('1','0','1','0','0','1','0','1');
--arr(125):=('1','0','1','0','1','1','0','0');
--arr(126):=('0','1','1','0','0','0','0','0');
--arr(127):=('0','1','1','0','0','0','1','1');
--arr(128):=('1','0','1','0','1','0','0','1');
--arr(129):=('1','0','1','0','1','0','0','0');
--arr(130):=('0','0','1','1','0','0','1','0');
--arr(131):=('0','0','1','1','0','1','1','1');
--arr(132):=('0','0','1','0','0','1','1','1');
--arr(133):=('0','1','1','0','1','0','0','1');
--arr(134):=('0','1','1','1','0','0','0','1');
--arr(135):=('0','0','1','1','0','0','0','0');
--arr(136):=('0','1','1','1','0','0','0','1');
--arr(137):=('0','1','1','0','0','0','1','1');
--arr(138):=('0','0','1','0','1','0','1','1');
--arr(139):=('0','0','1','0','0','1','0','1');
--arr(140):=('0','0','1','0','0','1','0','1');
--arr(141):=('1','0','1','1','0','0','0','0');
--arr(142):=('1','1','0','1','0','0','0','1');
--arr(143):=('0','0','1','0','1','0','0','0');
--arr(144):=('1','1','0','0','1','0','0','1');
--arr(145):=('0','1','0','0','0','0','1','0');
--arr(146):=('0','0','0','0','1','1','1','1');
--arr(147):=('0','0','0','0','0','1','1','1');
--arr(148):=('1','1','1','0','0','1','1','1');
--arr(149):=('0','0','1','1','0','1','0','0');
--arr(150):=('0','0','1','0','1','1','0','1');
--arr(151):=('1','1','1','0','1','0','0','1');
--arr(152):=('0','1','1','0','1','0','0','1');
--arr(153):=('0','0','1','0','1','0','0','1');
--arr(154):=('0','0','0','0','1','1','0','1');
--arr(155):=('0','0','1','1','0','0','0','1');
--arr(156):=('0','0','1','1','0','0','1','0');
--arr(157):=('0','0','1','0','0','0','1','1');
--arr(158):=('1','0','1','0','0','0','1','1');
--arr(159):=('0','1','1','0','0','0','0','1');
--arr(160):=('0','1','1','0','0','0','0','1');
--arr(161):=('0','0','0','0','0','0','0','1');
--arr(162):=('0','0','1','1','0','0','0','1');
--arr(163):=('0','0','1','1','1','0','0','1');
--arr(164):=('0','0','1','0','1','0','0','1');
--arr(165):=('0','0','1','1','1','0','0','0');
--arr(166):=('0','0','0','0','1','0','0','1');
--arr(167):=('0','0','1','0','1','0','0','0');
--arr(168):=('0','0','1','0','0','0','1','0');
--arr(169):=('1','0','1','0','0','0','1','1');
--arr(170):=('1','0','1','0','0','0','0','1');
--arr(171):=('1','1','1','0','0','0','0','1');
--arr(172):=('0','0','1','1','0','0','0','1');
--arr(173):=('0','0','1','0','1','0','0','1');
--arr(174):=('0','0','1','0','0','1','0','1');
--arr(175):=('0','0','1','0','0','1','1','0');
--arr(176):=('0','0','1','0','0','0','0','1');
--arr(177):=('1','0','1','0','0','0','0','0');
--arr(178):=('1','0','1','0','0','0','0','1');
--arr(179):=('1','0','1','1','0','1','0','1');
--arr(180):=('0','0','1','1','1','0','0','1');
--arr(181):=('0','0','1','0','1','1','0','1');
--arr(182):=('0','0','1','1','0','1','0','1');
--arr(183):=('0','0','1','1','1','0','0','1');
--arr(184):=('1','0','1','0','1','0','0','1');
--arr(185):=('1','1','0','0','0','0','0','1');
--arr(186):=('0','0','0','0','1','0','0','0');
--arr(187):=('0','0','1','0','0','1','1','1');
--arr(188):=('0','0','1','1','0','1','0','1');
--arr(189):=('0','0','1','1','0','0','0','1');
--arr(190):=('0','0','1','0','0','0','0','1');
--arr(191):=('0','0','1','1','0','1','0','1');
--arr(192):=('0','1','1','0','0','1','0','1');
--arr(193):=('0','1','0','0','0','0','0','0');
--arr(194):=('0','0','1','0','1','1','0','0');
--arr(195):=('0','0','1','0','1','1','0','1');
--arr(196):=('0','0','1','0','0','1','0','0');
--arr(197):=('0','0','1','0','0','1','0','0');
--arr(198):=('0','0','1','1','0','1','1','1');
--arr(199):=('0','0','1','0','1','0','0','1');
--arr(200):=('0','1','1','0','0','1','0','1');
--arr(201):=('0','1','1','0','0','0','0','1');
--arr(202):=('1','1','1','0','0','0','0','1');
--arr(203):=('1','0','1','0','1','0','0','1');
--arr(204):=('0','0','1','1','1','0','0','1');
--arr(205):=('0','1','0','0','0','0','0','1');
--arr(206):=('1','0','1','0','0','0','0','1');
--arr(207):=('0','0','1','0','0','0','0','1');
--arr(208):=('0','1','1','0','0','0','0','1');
--arr(209):=('0','0','1','1','0','0','0','1');
--arr(210):=('0','0','1','0','1','0','0','1');
--arr(211):=('0','0','1','0','0','1','0','1');
--arr(212):=('0','0','1','0','0','0','0','1');
--arr(213):=('0','0','1','0','0','0','1','1');
--arr(214):=('0','0','1','1','0','0','1','1');
--arr(215):=('0','0','1','0','0','0','0','1');
--arr(216):=('0','0','1','0','1','1','1','1');
--arr(217):=('0','0','1','0','1','0','0','1');
--arr(218):=('0','0','1','0','1','0','0','1');
--arr(219):=('0','0','1','1','0','0','0','1');
--arr(220):=('0','0','0','0','0','0','0','0');
--arr(221):=('0','0','1','0','0','1','0','0');
--arr(222):=('0','0','1','0','1','1','0','1');
--arr(223):=('0','1','1','0','1','0','0','1');
--arr(224):=('0','1','0','1','0','0','0','1');
--arr(225):=('0','0','1','0','1','1','0','1');
--arr(226):=('0','0','0','0','1','0','1','1');
--arr(227):=('0','0','0','0','0','0','0','1');
--arr(228):=('0','1','0','0','0','0','0','1');
--arr(229):=('1','0','1','0','0','0','0','1');
--arr(230):=('1','1','1','0','0','0','0','1');
--arr(231):=('0','1','1','0','0','0','0','1');
--arr(232):=('0','1','1','1','0','0','0','1');
--arr(233):=('0','0','1','0','0','1','0','1');
--arr(234):=('0','0','1','0','1','0','0','1');
--arr(235):=('0','0','1','0','0','1','0','1');
--arr(236):=('0','0','1','0','0','1','1','0');
--arr(237):=('0','0','1','0','0','0','0','0');
--arr(238):=('0','0','1','0','0','0','1','0');
--arr(239):=('0','0','0','0','0','0','1','1');
--arr(240):=('0','0','0','0','0','0','0','1');
--arr(241):=('0','0','1','1','0','0','0','1');
--arr(242):=('0','0','0','0','0','0','0','1');
--arr(243):=('0','0','1','1','0','0','0','1');
--arr(244):=('0','0','1','0','0','1','1','1');
--arr(245):=('0','0','1','0','0','1','0','1');
--arr(246):=('0','0','1','0','0','0','1','1');
--arr(247):=('0','0','1','1','0','0','0','1');
--arr(248):=('0','0','1','0','0','0','0','1');
--arr(249):=('0','0','0','0','0','0','0','1');
--arr(250):=('0','0','1','1','0','0','0','1');
--arr(251):=('0','1','0','0','0','0','0','1');
--arr(252):=('0','0','1','0','0','0','0','1');
--arr(253):=('0','0','1','0','0','0','0','1');
--arr(254):=('1','1','1','0','0','0','0','1');
--arr(255):=('1','0','1','0','0','0','0','1');

--index := conv_integer(unsigned(add));

ret:=arr(add);
return ret;
end;
signal I2 : std_logic_vector(15 downto 0);
shared variable index:integer:=0;
shared variable i :integer:=0;

begin
process(clk)
begin
I2<=memory(i);
--I2<=('0','1','1','0','0','0','0','1','0','0','0','0','0','0','0','0');
bitintout8 <=  I2(7 downto 0);
bitreg1out2 <= I2(9 downto 8);
bitreg2out2 <= I2(11 downto 10);
bitmodeout4 <=I2(15 downto 12);
i:=i+1;
index:= conv_integer(unsigned(jump1));
if index/=0 then
i:=index;
end if;




end process;
end Behavioral;
