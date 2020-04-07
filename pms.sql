
CREATE TABLE IF NOT EXISTS admin_ (
  Admin_Id int(11) NOT NULL AUTO_INCREMENT,
  Admin_Name varchar(20) NOT NULL,
  Admin_Password varchar(20) NOT NULL,
  PRIMARY KEY (Admin_Id)
);


CREATE TABLE IF NOT EXISTS policestation (
  Station_Id int(11) NOT NULL AUTO_INCREMENT,
  Station_Name varchar(20) NOT NULL,
  Address varchar(100) NOT NULL,
  City varchar(20) NOT NULL,
  PRIMARY KEY (Station_Id)
);

CREATE TABLE IF NOT EXISTS court (
  National_id int(12) NOT NULL,
  Court_Name varchar(30) NOT NULL,
  Location varchar(15) NOT NULL,
  PRIMARY KEY (National_id)
);

CREATE TABLE IF NOT EXISTS prison (
  pno int(25) NOT NULL AUTO_INCREMENT,
  pname varchar(25) NOT NULL,
  location varchar(25) NOT NULL,
  contact int(25) NOT NULL,
  capacity int(25) NOT NULL,
  PRIMARY KEY (pno)
);

CREATE TABLE IF NOT EXISTS prison_cell (
  num int(25) NOT NULL AUTO_INCREMENT,
  prison_num int(25) NOT NULL,
  PRIMARY KEY (num),
  FOREIGN KEY (prison_num) references prison(pno)
);

CREATE TABLE IF NOT EXISTS prison_guard (
  id int(12) NOT NULL,
  fullname varchar(25) NOT NULL,
  address varchar(25) NOT NULL,
  dateofbirth varchar(25) NOT NULL,
  gender varchar(25) NOT NULL,
  telephone int(25) NOT NULL,
  education varchar(25) NOT NULL,
  experience varchar(25) NOT NULL,
  cell_id int(25) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (cell_id) references prison_cell(num)
  );

CREATE TABLE IF NOT EXISTS officer (
  id int(12) NOT NULL,
  fullname varchar(25) NOT NULL,
  address varchar(25) NOT NULL,
  dateofbirth varchar(25) NOT NULL,
  gender varchar(25) NOT NULL,
  telephone int(25) NOT NULL,
  education varchar(25) NOT NULL,
  experience varchar(25) NOT NULL,
  policestation_id int(11) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (policestation_id) references policestation(Station_Id)
);

CREATE TABLE IF NOT EXISTS registration (
  id int(10) NOT NULL DEFAULT '0',
  Full_Name varchar(23) NOT NULL,
  DOB date NOT NULL,
  Address varchar(20) NOT NULL,
  Gender varchar(20) NOT NULL,
  Education varchar(20) NOT NULL,
  Marital_status varchar(20) NOT NULL,
  Offence varchar(90) NOT NULL,
  Date_in date NOT NULL,
  Sentence varchar(13) NOT NULL,
  cell_id int(25) NOT NULL, 
  court_id int(12) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (cell_id) references prison_cell(num),
  FOREIGN KEY (court_id) references court(National_id)
);

CREATE TABLE IF NOT EXISTS transfer (
  prisoner_id int(16) NOT NULL,
  From_prison int(25) NOT NULL,
  To_prison int(25) NOT NULL,
  Dateoftransfer date NOT NULL,
  PRIMARY KEY (prisoner_id),
  FOREIGN KEY (prisoner_id) references registration(id),
  FOREIGN KEY (From_prison) references prison(pno),
  FOREIGN KEY (To_prison) references prison(pno)
);

CREATE TABLE IF NOT EXISTS visitor (
  id int(12) NOT NULL,
  fullname varchar(25) NOT NULL,
  address varchar(25) NOT NULL,
  dateofvisit varchar(25) NOT NULL,
  timein varchar(24) NOT NULL,
  timeout varchar(23) NOT NULL,
  relationship varchar(25) NOT NULL,
  telephone int(13) NOT NULL,
  prisoner_id int(10) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (prisoner_id) references registration(id)
);


