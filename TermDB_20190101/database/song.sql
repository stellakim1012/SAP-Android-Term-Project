# 권한 설정
# 필요 없으면 Skip!
grant all privileges on  *.* to 'root'@'%' identified by 'mysql1234';
delete from mysql.user where host="localhost" and user="root";
flush privileges;
select host,user,plugin,authentication_string from mysql.user;

###############################################
DROP DATABASE IF EXISTS songdb;

CREATE DATABASE IF NOT EXISTS songdb 
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;

USE songdb;

CREATE TABLE song (
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  singer VARCHAR(100) NOT NULL,
  memo MEDIUMTEXT,
  image VARCHAR(255),
  PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;

###############################################

INSERT INTO song (title, singer, image, memo) VALUES
  ('The Boys', '소녀시대', "TheBoys.jpg", '2011/10/19에 발매된 정규 3집 타이틀곡'),
  ('Holiday', '소녀시대', "HolidayNight.jpg", '2017/08/04에 발매된 정규 6집 타이틀곡'),
  ('Gee', '소녀시대', "Gee.jpg", '2009/01/05에 발매된 미니 1집 타이틀곡'),
  ('Mr.Mr.', '소녀시대', "Mr.Mr.jpg", '2014/02/24에 발매된 미니 4집 타이틀곡'),
  ('다시 만난 세계', '소녀시대', "IntotheNewWorld.jpg", '2007/08/03에 발매된 싱글 1집 타이틀곡'),
  ('Fine', '태연', "MyVoice.jpg", '2017/02/28에 발매된 정규 1집 타이틀곡'),
  ('불티', '태연', "Purpose.jpg", '2019/10/28에 발매된 정규 2집 타이틀곡'),
  ('I', '태연', "I.jpg", '2015/10/07에 발매된 미니 1집 타이틀곡'),
  ('Something New', '태연', "SomethingNew.jpg", '2018/06/18에 발매된 미니 3집 타이틀곡'),
  ('Lovesick Girls', '블랙핑크', "TheAlbum.jpg", '2020/10/02에 발매된 정규 1집 타이틀곡'),
  ('뚜두뚜두', '블랙핑크', "SQUAREUP.jpg", '2018/06/15에 발매된 미니 1집 타이틀곡'),
  ('Kill This Love', '블랙핑크', "KILLTHISLOVE.jpg", '2019/04/05에 발매된 미니 2집 타이틀곡'),
  ('Square', '백예린', "EveryletterIsentyou.jpg", '2019/12/10에 발매된 정규 1집 타이틀곡'),
  ('그건 아마 우리의 잘못은 아닐거야', '백예린', "Ourloveisgreat.jpg", '2019/03/18에 발매된 미니 2집 타이틀곡'),
  ('Black Mamba', '에스파', "BlackMamba.jpg", '2020/11/17에 발매된 디지털 싱글 타이틀곡'),
  ('Forever (약속)', '에스파', "Forever.jpg", '2021/02/05에 발매된 디지털 싱글 타이틀곡'),
  ('Next Level', '에스파', "NextLevel.jpg", '2021/05/17에 발매된 디지털 싱글 타이틀곡'),
  ('Ice Cream Cake', '레드벨벳', "IceCreamCake.jpg", '2015/03/17에 발매된 미니 1집 타이틀곡'),
  ('Psycho', '레드벨벳', "TheReVeFestivalFinale.jpg", '2019/12/23에 발매된 미니 6, 7집 리패키지 타이틀곡'),
  ('첫 사랑니 (Rum Pum Pum Pum)', '에프엑스', "PinkTape.jpg", '2013/07/29에 발매된 정규 2집 타이틀곡'),
  ('4 Walls', '에프엑스', "Walls.jpg", '2015/10/27에 발매된 정규 4집 타이틀곡'),
  ('그리워하다', '비투비', "BrotherAct.jpg", '2017/10/16에 발매된 정규 2집 타이틀곡'),
  ('너 없인 안 된다', '비투비', "THISISUS.jpg", '2018/06/18에 발매된 미니 11집 타이틀곡'),
  ('View', '샤이니', "Odd.jpg", '2015/05/18에 발매된 정규 4집 타이틀곡'),
  ("Don't Call Me", '샤이니', "DontCallMe.jpg", '2021/02/22에 발매된 정규 7집 타이틀곡'),
  ('200%', '악동뮤지션', "PLAY.jpg", '2014/04/07에 발매된 정규 1집 타이틀곡'),
  ('어떻게 이별까지 사랑하겠어, 널 사랑하는 거지', '악동뮤지션', "Sailer.jpg", '2019/09/25에 발매된 정규 3집 타이틀곡'),
  ('살짝 설렜어 (Nonstop)', '오마이걸', "NONSTOP.jpg", '2020/04/27에 발매된 미니 7집 타이틀곡'),
  ('Dun Dun Dance', '오마이걸', "DearOHMYGIRL.jpg", '2021/05/10에 발매된 미니 8집 타이틀곡'),
  ('그냥 안아달란 말야', '다비치', "justhugme.jpg", '2021/04/12에 발매된 디지털 싱글 타이틀곡'),
  ('DUMDi DUMDi', '(여자)아이들', "DUMDiDUMDi.jpg", '2020/08/03에 발매된 싱글 1집 타이틀곡'),
  ('화(火花)', '(여자)아이들', "Iburn.jpg", '2021/01/11에 발매된 미니 4집 타이틀곡'),
  ("롤린(Rollin')", '브레이브걸스', "Rollin.jpg", '2017/03/07에 발매된 미니 4집 타이틀곡'),
  ('운전만해', '브레이브걸스', "WeRide.jpg", '2020/08/14에 발매된 디지털 싱글 4집 타이틀곡'),
  ('FIESTA', '아이즈원', "BLOOMIZ.jpg", '2020/02/17에 발매된 정규 1집 타이틀곡'),
  ('Panorama', '아이즈원', "One-reeler.jpg", '2020/12/07에 발매된 미니 4집 타이틀곡'),
  ('달라달라', '있지', "ITzDifferent.jpg", '2019/02/12에 발매된 디지털 싱글 1집 타이틀곡'),
  ('WANNABE', '있지', "ITzME.jpg", '2020/03/09에 발매된 미니 2집 타이틀곡'),
  ('팔레트', '아이유', "Palette.jpg", '2017/04/21에 발매된 정규 4집 타이틀곡'),
  ('Blueming', '아이유', "Lovepoem.jpg", '2019/11/18에 발매된 미니 5집 타이틀곡');
