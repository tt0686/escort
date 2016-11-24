CREATE TABLE escort.dayValue(
    id INT PRIMARY KEY,
    value TINYINT NOT NULL,
    stardate DATETIME NOT NULL,
    endDate DATETIME);

CREATE TABLE escort.unityValueProfile(
	id INT PRIMARY KEY,
    profile VARCHAR(30) NOT NULL,
    unityValue TINYINT NOT NULL);

CREATE TABLE escort.paymentProfile(
	id INT PRIMARY KEY auto_increment,
    profileName VARCHAR(30) NOT NULL,
    profileDiscount FLOAT(3,1) NOT NULL);   

CREATE TABLE escort.models(
	id INT PRIMARY KEY auto_increment,
    name VARCHAR(50) NOT NULL,
    nif INT,
    active CHAR(1) NOT NULL,
    dateAdmission DATETIME NOT NULL
);

CREATE TABLE escort.phones(
	id INT PRIMARY KEY auto_increment,
    phone BIGINT NOT NULL,
    modelId INT NOT NULL,
    FOREIGN KEY(modelId) REFERENCES phones(id));

CREATE TABLE escort.mails(
	id INT PRIMARY KEY auto_increment,
    mail VARCHAR(255) NOT NULL,
    modelId INT NOT NULL,
    FOREIGN KEY(modelId) REFERENCES models(id));  
 
 -- PROFILE -- HARDCORE -- NUDE
CREATE TABLE escort.photoCategory(
	id INT PRIMARY KEY auto_increment,
    category VARCHAR(30) NOT NULL,
    price FLOAT(3,1) NOT NULL,
    active CHAR(1) NOT NULL
);

CREATE TABLE escort.photoCategoryPriceHistory(
	id INT PRIMARY KEY,
    price FLOAT(3,1),
    FOREIGN KEY(id) REFERENCES escort.photoCategory(id)
);    
    
CREATE TABLE escort.photos(
	id INT PRIMARY KEY auto_increment,
    photo BLOB NOT NULL,
    modelId INT NOT NULL,
    active CHAR(1),
    categoryId INT NOT NULL,
    token VARCHAR(10),
    FOREIGN KEY(modelId) REFERENCES models(id),
    FOREIGN KEY(categoryId) REFERENCES photoCategory(id)); 
    
CREATE TABLE escort.buyedPhotos(
	id BIGINT PRIMARY KEY auto_increment,
    photoId INT NOT NULL,
    date DATETIME NOT NULL,
	value FLOAT(3,1)
);    
    
CREATE TABLE mails(
	id INT PRIMARY KEY auto_increment,
    mail VARCHAR(255) NOT NULL,
    modelId INT NOT NULL,
    FOREIGN KEY(modelId) REFERENCES models(id));     
    
CREATE TABLE escort.activePhotosHistory(
	id INT PRIMARY KEY,
    photoId INT NOT NULL,
    modelId INT NOT NULL,
    startDate DATETIME NOT NULL,
    endDate DATETIME,
    FOREIGN KEY(photoId) REFERENCES photos(id),
    FOREIGN KEY(modelId) REFERENCES models(id)
);   

CREATE TABLE escort.payments(
	id BIGINT PRIMARY KEY auto_increment,
    modelId INT NOT NULL,
    paymentDate DATETIME NOT NULL,
    paymentValue FLOAT(7,2) NOT NULL,
    paymentProfileId INT NOT NULL,
    FOREIGN KEY(modelId) REFERENCES models(id),
    FOREIGN KEY(paymentProfileId) REFERENCES paymentProfile(id) 
);

CREATE TABLE escort.spendPayments(
	id BIGINT PRIMARY KEY,
    paymentId BIGINT NOT NULL,
    startDate DATETIME NOT NULL,
    endDate DATETIME NOT NULL,
    dayValueId INT NOT NULL,
    unityValueModelProfileId BIGINT NOT NULL,
    FOREIGN KEY(unityValueModelProfileId) REFERENCES unityValueModelProfile(id),
    FOREIGN KEY(paymentId) REFERENCES payments(id),
    FOREIGN KEY(dayValueId) REFERENCES dayValue(id)
);

CREATE TABLE escort.unityValueSpendProfile(
	id BIGINT PRIMARY KEY,
    unityValueProfileId INT NOT NULL,
	spendPaymentsId BIGINT NOT NULL,
    FOREIGN KEY(unityValueProfileId) REFERENCES unityValueProfile(id),
    FOREIGN KEY(spendPaymentsId) REFERENCES spendPayments(id)
); 

/*CREATE TRIGGER before_spendPayments_insert BEFORE INSERT ON spendPayments
	FOR EACH ROW
BEGIN
			SELECT 
            (DATEDIFF(T0.endDate - T0.startDate) * T1.value + 
				(
					SELECT SUM(ST1.unityValue) FROM unityValueSpendProfile ST0 inner join unityValueProfile ST1 on (ST0.unityValueProfileId = ST1.id)
					where T0.spendPayment = T0.id
				)
            ) - 
            (((DATEDIFF(T0.endDate - T0.startDate) * T1.value) * T3.profileDiscount)  / 100)
			FROM spendPayments T0 INNER JOIN dayValue T1 on (T1.id = T0.dayValueId)
            INNER JOIN payments T2 on (T2.id = T0.paymentId)
            INNER JOIN paymentProfile T3 on (T3.id = T2.paymentProfileId)
			where paymentId = NEW.paymentId;
END; */   
 
     
CREATE TABLE escort.modelcharacteristics(
	id INT PRIMARY KEY AUTO_INCREMENT,
    characteristic VARCHAR(30) NOT NULL);
    
INSERT INTO escort.modelcharacteristics(characteristic) VALUES ('age');
INSERT INTO escort.modelcharacteristics(characteristic) VALUES ('weight');
INSERT INTO escort.modelcharacteristics(characteristic) VALUES ('height');
INSERT INTO escort.modelcharacteristics(characteristic) VALUES ('eyeColor');
INSERT INTO escort.modelcharacteristics(characteristic) VALUES ('hairColor');
INSERT INTO escort.modelcharacteristics(characteristic) VALUES ('schedule');
INSERT INTO escort.modelcharacteristics(characteristic) VALUES ('ownPlace');
INSERT INTO escort.modelcharacteristics(characteristic) VALUES ('travels');
INSERT INTO escort.modelcharacteristics(characteristic) VALUES ('phantasies');

CREATE TABLE escort.phantasies(
	id INT PRIMARY KEY AUTO_INCREMENT,
    phantasy VARCHAR(50) NOT NULL);
    
CREATE TABLE escort.userMails(
	id INT PRIMARY KEY,
    mail VARCHAR(255) NOT NULL,
    userId INT NOT NULL,
    FOREIGN KEY(userId) REFERENCES escort.users(id));     
    
-- ADMIN MODEL CURRENT_USER    
CREATE TABLE escort.userProfile(
	id TINYINT PRIMARY KEY,
    profileName VARCHAR(10)
);

CREATE TABLE escort.userPhoto(
	id INT PRIMARY KEY auto_increment,
    photo BLOB NOT NULL
);   

-- CHAT VIDEO STREAM COMMENTS
CREATE TABLE escort.services(
	id INT PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE escort.services
    
CREATE TABLE escort.users(
	id INT PRIMARY KEY,
    user VARCHAR(30) NOT NULL,
    password CHAR(128) NOT NULL,
    userprofileId TINYINT NOT NULL,
    userPhotoId INT,
    FOREIGN KEY(userprofileId) REFERENCES escort.userProfile(id),
    FOREIGN KEY(userPhotoId)   REFERENCES escort.userPhoto(id)
);
    