# Final Project
DROP DATABASE IF EXISTS Final_Project ;
CREATE DATABASE IF NOT EXISTS Final_Project;
USE Final_Project;

#USER_DATA (StreamerID, UserID)
#	WHERE USER.UserID MUST EXIST IN User.UserID
#User (UserID, UserName, Phone, Email, Location, Gender, DateofBirth)
#Streamer (StreamerID, StreamerName, NumberofView, Subscriber, Language, UserID)
#Streamer_Data (UserID, StreamerID)


CREATE TABLE User (
UserID Int NOT NULL auto_increment,
UserName Char(50) NOT NULL,
Phone Int NOT NULL,
Email Char(50) NOT NULL, 
Location Char(50) NOT NULL,
Gender Char(10) NOT NULL,
DateofBirth Date NOT NULL,
TimeSpend Int NOT NULL,
constraint USER1 PRIMARY KEY (UserID)
);

CREATE TABLE Streamer (
StreamerID Int NOT NULL auto_increment,
StreamerName Char(50) NOT NULL,
NumberofView Int NOT NULL,
Subscriber Int NOT NULL,
Language Char(50) NOT NULL,
constraint STREAMER PRIMARY KEY (StreamerID)
);
CREATE TABLE Game (
GameID Int NOT NULL auto_increment,
GameName Char(50) NOT NULL,
LanguageSupport Char(50) NOT NULL DEFAULT 'USA',
ViewCount Int NOT NULL,
PopularStreamer Char(50) NOT NULL,
constraint GAME PRIMARY KEY (GameID)
);
CREATE TABLE Content (
ContentID Int NOT NULL auto_increment,
ContentName Char(50) NOT NULL,
ViewCount Int NOT NULL,
LikeCount Int NOT NULL,
DislikeCount Int NOT NULL,
constraint CONTENT PRIMARY KEY (ContentID)
);
CREATE TABLE Content_data (
GameID Int NOT NULL,
UserID Int NOT NULL,
ContentID Int NOT NULL,
constraint CONTENT_data PRIMARY KEY (UserID, GameID),
constraint CONTENT_data1 FOREIGN KEY (GameID) REFERENCES Game(GameID),
constraint CONTENT_data2 FOREIGN KEY (UserID) REFERENCES User(UserID)
);
CREATE TABLE Donation (
DonationID Int NOT NULL,
DonationAmount Int NOT NULL,
PaymentMethod Char(50) NOT NULL,
Reward_Benefit Char(50) NOT NULL,
constraint DONATE PRIMARY KEY (DonationID)
);
CREATE TABLE Donation_data (
UserID INT NOT NULL,
StreamerID INT NOT NULL,
DonationID INT NOT NULL,
constraint DONATE_DATA PRIMARY KEY (StreamerID, UserID),
CONSTRAINT DONATE_DATA2 FOREIGN KEY (UserID) REFERENCES User(UserID),
CONSTRAINT DONATE_DATA3 FOREIGN KEY (StreamerID) REFERENCES Streamer(StreamerID)
);

#Insert value
INSERT INTO USER (UserName, Phone, Email, Location, Gender, DateofBirth, TimeSpend)
VALUES ('Andree', '123', 'andree89@gmail.com', 'USA', 'Male', '1999-10-07', '300');
INSERT INTO USER (UserName, Phone, Email, Location, Gender, DateofBirth, TimeSpend)
VALUES ('Harry', '456', 'harry89@gmail.com', 'USA', 'Male', '1999-11-20', '250');
INSERT INTO USER (UserName, Phone, Email, Location, Gender, DateofBirth, TimeSpend)
VALUES ('Guang', '789', 'guang89@gmail.com', 'China', 'Male', '1989-05-25', '400');
INSERT INTO USER (UserName, Phone, Email, Location, Gender, DateofBirth, TimeSpend)
VALUES ('Joey', '135', 'joey89@gmail.com', 'Vietnam', 'Female', '2001-08-20', '70');
INSERT INTO USER (UserName, Phone, Email, Location, Gender, DateofBirth, TimeSpend)
VALUES ('David', '246', 'david89@gmail.com', 'England', 'Male', '1997-06-20', '160');

INSERT INTO STREAMER (StreamerName, NumberofView, Subscriber, Language)
VALUES ('Snake', '30000', '200000', 'English');
INSERT INTO STREAMER (StreamerName, NumberofView, Subscriber, Language)
VALUES ( 'Ben', '15000', '100000', 'Vietnamese');
INSERT INTO STREAMER (StreamerName, NumberofView, Subscriber, Language)
VALUES ( 'Viper', '75000', '500000', 'English');
INSERT INTO STREAMER (StreamerName, NumberofView, Subscriber, Language)
VALUES ( 'Rambo', '50000', '1000000', 'English');
INSERT INTO STREAMER (StreamerName, NumberofView, Subscriber, Language)
VALUES ( 'Alicia', '150000', '3000000', 'French');

INSERT INTO GAME (GameName, ViewCount, PopularStreamer)
VALUES ('LOL', '700000','Faker');
INSERT INTO GAME (GameName, ViewCount, PopularStreamer)
VALUES ('PUBG', '120000','DrDisconnect');
INSERT INTO GAME (GameName, ViewCount, PopularStreamer)
VALUES ('Valorant', '300000','kyedae');
INSERT INTO GAME (GameName, ViewCount, PopularStreamer)
VALUES ('Pokemon', '100000','Bill');
INSERT INTO GAME (GameName, ViewCount, PopularStreamer)
VALUES ('Minecraft', '650000','Mixi');

INSERT INTO CONTENT (ContentName, ViewCount, LikeCount, DislikeCount)
VALUES ('Valorant Highlight','10200','425','60');
INSERT INTO CONTENT (ContentName, ViewCount, LikeCount, DislikeCount)
VALUES ('Minecraft Tutorial','55000','6700','473');
INSERT INTO CONTENT (ContentName, ViewCount, LikeCount, DislikeCount)
VALUES ('Pokemon Hunt','36000','2900','325');
INSERT INTO CONTENT (ContentName, ViewCount, LikeCount, DislikeCount)
VALUES ('PUBG Highlight','7400','200','10');
INSERT INTO CONTENT (ContentName, ViewCount, LikeCount, DislikeCount)
VALUES ('LOL Tournament','180000','14000','2000');
INSERT INTO CONTENT (ContentName, ViewCount, LikeCount, DislikeCount)
VALUES ('LOL Funny Moments','10000','1000','2000');

INSERT INTO DONATION (DonationID, DonationAmount, PaymentMethod, Reward_Benefit)
VALUES ('391', '50', 'Paypal','No');
INSERT INTO DONATION (DonationID, DonationAmount, PaymentMethod, Reward_Benefit)
VALUES ('1478', '20', 'CreditCard','No');
INSERT INTO DONATION (DonationID, DonationAmount, PaymentMethod, Reward_Benefit)
VALUES ('701', '550', 'Paypal','Yes');
INSERT INTO DONATION (DonationID, DonationAmount, PaymentMethod, Reward_Benefit)
VALUES ('7622', '300', 'DebitCard','Yes');
INSERT INTO DONATION (DonationID, DonationAmount, PaymentMethod, Reward_Benefit)
VALUES ('126', '1000', 'Paypal','Yes');

INSERT INTO CONTENT_DATA (GameID, UserID, ContentID)
VALUES ('3','1','1');
INSERT INTO CONTENT_DATA (GameID, UserID, ContentID)
VALUES ('5','2','2');
INSERT INTO CONTENT_DATA (GameID, UserID, ContentID)
VALUES ('4','3','3');
INSERT INTO CONTENT_DATA (GameID, UserID, ContentID)
VALUES ('2','4','4');
INSERT INTO CONTENT_DATA (GameID, UserID, ContentID)
VALUES ('1','1','5');
INSERT INTO CONTENT_DATA (GameID, UserID, ContentID)
VALUES ('1','5','6');

INSERT INTO DONATION_DATA (DonationID, StreamerID, UserID)
VALUES ('391','1','1');
INSERT INTO DONATION_DATA (DonationID, StreamerID, UserID)
VALUES ('1478','2','4');
INSERT INTO DONATION_DATA (DonationID, StreamerID, UserID)
VALUES ('701','5','3');
INSERT INTO DONATION_DATA (DonationID, StreamerID, UserID)
VALUES ('7622','1','4');
INSERT INTO DONATION_DATA (DonationID, StreamerID, UserID)
VALUES ('126','5','5');


