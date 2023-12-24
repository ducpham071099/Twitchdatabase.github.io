#Query
#1 List of all user
SELECT *
FROM User;
#What country have most total TimeSpend on Twitch
SELECT Location, SUM(TimeSpend)
FROM User
GROUP BY Location;

#2 Find the streamer that have the most user who watch
SELECT A.StreamerName, COUNT(B.UserID) AS UserCount
FROM STREAMER AS A
JOIN Donation_DATA AS B ON A.StreamerID = B.StreamerID
GROUP BY StreamerName
ORDER BY UserCount ASC;

#3&4: Find out what streamer have the most donation, top donation

SELECT B.StreamerName, SUM(A.DonationAmount) AS TotalDonation
FROM Donation AS A, Streamer AS B, Donation_data AS C
WHERE A.DonationID = C.DonationID AND B.StreamerID = C.StreamerID
GROUP BY B.StreamerName
ORDER BY TotalDonation DESC
;
SELECT B.UserName, SUM(A.DonationAmount) AS TotalDonation
FROM Donation AS A, User AS B, Donation_data AS C
WHERE A.DonationID = C.DonationID AND B.UserID = C.UserID
GROUP BY B.UserName
ORDER BY TotalDonation DESC;

#5 Find out most popular games based on content count. Based on the result we will know what are the game that 
# have the most favorite content in twitch, so we can choose to provide new comer with these top game.
SELECT A.GameName, COUNT(B.GameID) AS ContentCount
FROM GAME AS A
JOIN CONTENT_DATA AS B ON A.GameID = B.GameID
GROUP BY A.GameName
ORDER BY ContentCount DESC;

#6 Showing which content gonna attract the most view.
SELECT ContentName, ViewCount, LikeCount, DislikeCount
FROM Content
ORDER BY LikeCount DESC, ViewCount DESC, DislikeCount ASC;


