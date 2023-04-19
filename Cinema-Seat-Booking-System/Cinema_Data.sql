INSERT INTO cinemas VALUES('M08', 'Mahwah Movies', '150 Main Street', 'Mahwah', 'NJ', '201-502-8810');
INSERT INTO cinemas VALUES('R09', 'Ridgewood Reels', '250 Main Avenue', 'Ridgewood', 'NJ', '201-994-6783');
INSERT INTO cinemas VALUES('SV01', 'Spring Valley Screens', '75 Main Lane', 'Spring Valley', 'NY', '917-944-1600');
INSERT INTO cinemas VALUES('W04', 'Westwood Watchers', '21 Main Road', 'Westwood', 'NJ','201-869-9758');
INSERT INTO cinemas VALUES('P69', 'Princeton Projectors', '87 Main Drive', 'Princeton', 'NJ', '201-444-4444');
INSERT INTO cinemas VALUES('F07', 'Fair Lawn Films', '43 Main Terrace', 'Fair Lawn', 'NJ', '201-709-2205');

INSERT INTO theaters VALUES('MT01', 'M08', 50);
INSERT INTO theaters VALUES('MT02', 'M08', 75);
INSERT INTO theaters VALUES('MT03', 'M08', 25);
INSERT INTO theaters VALUES('SVT01', 'SV01', 150);
INSERT INTO theaters VALUES('SVT02', 'SV01', 80);
INSERT INTO theaters VALUES('SVT03', 'SV01', 100);
INSERT INTO theaters VALUES('SVT3D', 'SV01', 50);
INSERT INTO theaters VALUES('RR01', 'R09', 30);
INSERT INTO theaters VALUES('RR02', 'R09', 60);
INSERT INTO theaters VALUES('WW01', 'W04', 40);
INSERT INTO theaters VALUES('WW02', 'W04', 45);

INSERT INTO movies VALUES('JW042023', 'John Wick: Chapter 4', 'Chad Stahelski', 'R', 170,  '24-Mar-23', 'With the price on his head ever increasing, legendary hitman John Wick takes his fight against the High Table global as he seeks out the most powerful players in the underworld, from New York to Paris to Japan to Berlin');
INSERT INTO movies VALUES('ACWA2023', 'Asteroid City', 'Wes Anderson', 'R', 140, '16-Jun-23', 'World-changing events spectacularly disrupt the itinerary of a Junior Stargazer/Space Cadet convention in an American desert town circa 1955');
INSERT INTO movies VALUES('KK275', 'Killer Klowns From Outer Space', 'Stephen Chiodo', 'PG13', 124, '27-May-88', 'When a small town is invaded by aliens from outer space who are capturing and killing the townspeople, no one takes them seriously. Why? The aliens all look like circus clowns, use weapons that look clown like, and all have painted on smiles. Only a few of the young people in the town realize the danger and of course no one believes them. Armed with an ice cream truck they try and rescue their friends.');
INSERT INTO movies VALUES('SCRM06', 'SCREAMVI', 'Tyler Gillett', 'R', 122, '10-Mar-23', 'In the next installment, the survivors of the Ghostface killings leave Woodsboro behind and start a fresh chapter in New York City.');

INSERT INTO screenings VALUES('0423JW1', 'JW042023', 'MT03', '23-Apr-23', '1:20PM');
INSERT INTO screenings VALUES('0423JW2', 'JW042023', 'MT03', '23-Apr-23', '5:30PM');
INSERT INTO screenings VALUES('0424JW1', 'JW042023', 'SVT02', '24-Apr-23', '12:50PM');
INSERT INTO screenings VALUES('0424JW2', 'JW042023', 'MT01', '24-Apr-23', '11:40AM');
INSERT INTO screenings VALUES('0425JW1','JW042023', 'MT02', '25-Apr-23', '10:30AM');
INSERT INTO screenings VALUES('0425JW2','JW042023', 'MT02', '25-Apr-23', '2:30PM');
INSERT INTO screenings VALUES('SCRN01','SCRM06', 'WW01', '20-Apr-23', '1:30PM');
INSERT INTO screenings VALUES('SCRN03', 'SCRM06', 'RR01', '30-Apr-23', '4:00PM');
INSERT INTO screenings VALUES('SCNRM08', 'KK275', 'WW02', '27-Apr-23', '9:30AM');
INSERT INTO screenings VALUES('SCNRM05', 'KK275', 'RR02', '19-Apr-23', '12:30PM');

INSERT INTO customers VALUES('JW000100', 'Jonathan Wicker', '973-168-7982', 'johnwickr@gmail.com' );
INSERT INTO customers VALUES('MR000022', 'Melanie Richardson', '973-111-3610', 'melsrich@outlook.com' );
INSERT INTO customers VALUES('JK000213', 'Jason Krueger', '213-553-0666', 'jkrueger@aol.com' );
INSERT INTO customers VALUES('SM000706', 'Samuel Movie', '855-984-2001', 'Samovie@gmail.com' );

INSERT INTO reservations VALUES('00000001', 'JW000100', '0423JW2', 'B4', 12.42);
INSERT INTO reservations VALUES('00000002', 'JW000100', '0424JW1', 'C7', 13.50);
INSERT INTO reservations VALUES('00000003', 'JW000100', '0425JW1', 'H2', 12.42);
INSERT INTO reservations VALUES('00000004', 'JW000100', '0425JW2', 'G4', 12.42);
INSERT INTO reservations VALUES('00000098', 'JK000213', 'SCNRM08', 'F2', 8.50 );
INSERT INTO reservations VALUES('00000099', 'JK000213', 'SCNRM08', 'F3', 8.50 );
INSERT INTO reservations VALUES('00000230', 'SM000706', 'SCRN03', 'J8', 10.50 );
